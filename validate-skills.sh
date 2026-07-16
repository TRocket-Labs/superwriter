#!/usr/bin/env bash

# validate-skills.sh - validate public skill packages.
# Usage: ./validate-skills.sh [SKILLS_DIR]

set -u

SKILLS_DIR="${1:-skills}"
ISSUES=0
WARNINGS=0
PASSED=0

PRIVATE_PATTERN='TinyRocket|superwriter-x|audience-corpus|product-strategy|topic-strategy|topic-refiner|Linear|audience\.md|product\.md|docs/target-audience|docs/concepts|Adam|DuVander|private|client-only|higher version|intellectual property'

info() {
  printf '%s\n' "$*"
}

if [[ ! -d "$SKILLS_DIR" ]]; then
  info "error: skills directory '$SKILLS_DIR' does not exist"
  exit 1
fi

info "Validating skills in '$SKILLS_DIR'..."
info ""

shopt -s nullglob
for skill_dir in "$SKILLS_DIR"/*/; do
  skill_name="$(basename "$skill_dir")"
  skill_file="${skill_dir}SKILL.md"
  errors=()
  warnings=()

  if [[ ! -f "$skill_file" ]]; then
    info "FAIL $skill_name"
    info "  error: missing SKILL.md"
    ((ISSUES++))
    continue
  fi

  frontmatter="$(awk '/^---[[:space:]]*$/{c++; next} c==1{print} c>=2{exit}' "$skill_file")"

  if [[ -z "$frontmatter" ]]; then
    errors+=("missing YAML frontmatter")
  else
    name="$(printf '%s\n' "$frontmatter" | awk -F': ' '/^name:[[:space:]]*/{sub(/^name:[[:space:]]*/,""); gsub(/^"|"$/,""); print; exit}')"
    desc_line="$(printf '%s\n' "$frontmatter" | grep -m1 '^description:' || true)"
    desc="$(printf '%s' "$desc_line" | sed -E 's/^description:[[:space:]]*//; s/^"(.*)"$/\1/; s/^'\''(.*)'\''$/\1/')"

    if [[ -z "$name" ]]; then
      errors+=("missing 'name' field")
    else
      [[ "$name" != "$skill_name" ]] && errors+=("name '$name' must match directory '$skill_name'")
      [[ ! "$name" =~ ^[a-z0-9]([a-z0-9-]{0,62}[a-z0-9])?$ ]] && errors+=("name '$name' must be lowercase hyphen-case, 1-64 chars")
    fi

    if [[ -z "$desc" ]]; then
      errors+=("missing 'description' field")
    elif (( ${#desc} > 1024 )); then
      errors+=("description is ${#desc} chars; keep it at or below 1024")
    fi

    python3 - "$skill_file" <<'PY' >/dev/null 2>&1
import pathlib
import sys

try:
    import yaml
except Exception:
    sys.exit(0)

path = pathlib.Path(sys.argv[1])
text = path.read_text()
parts = text.split("---", 2)
if len(parts) < 3:
    sys.exit(1)
yaml.safe_load(parts[1])
PY
    [[ $? -ne 0 ]] && errors+=("frontmatter is not valid YAML")
  fi

  lines="$(wc -l < "$skill_file" | tr -d ' ')"
  (( lines > 500 )) && warnings+=("SKILL.md is $lines lines; keep it under 500 when possible")

  if command -v rg >/dev/null 2>&1; then
    private_hits="$(rg -n "$PRIVATE_PATTERN" "$skill_dir" || true)"
  else
    private_hits="$(grep -RInE "$PRIVATE_PATTERN" "$skill_dir" || true)"
  fi
  [[ -n "$private_hits" ]] && errors+=("contains private or source-repo references")

  if [[ -f "${skill_dir}agents/openai.yaml" ]]; then
    python3 - "${skill_dir}agents/openai.yaml" <<'PY' >/dev/null 2>&1
import pathlib
import sys

try:
    import yaml
except Exception:
    sys.exit(0)

yaml.safe_load(pathlib.Path(sys.argv[1]).read_text())
PY
    [[ $? -ne 0 ]] && errors+=("agents/openai.yaml is not valid YAML")

    if ! grep -q '\$'"$skill_name" "${skill_dir}agents/openai.yaml"; then
      warnings+=("agents/openai.yaml default_prompt should mention \$${skill_name}")
    fi
  fi

  if (( ${#errors[@]} > 0 )); then
    info "FAIL $skill_name"
    for error in "${errors[@]}"; do info "  error: $error"; done
    if [[ -n "${private_hits:-}" ]]; then
      printf '%s\n' "$private_hits" | sed 's/^/    /'
    fi
    for warning in "${warnings[@]}"; do info "  warning: $warning"; done
    ((ISSUES++))
  elif (( ${#warnings[@]} > 0 )); then
    info "WARN $skill_name"
    for warning in "${warnings[@]}"; do info "  warning: $warning"; done
    ((WARNINGS++))
  else
    info "PASS $skill_name"
    ((PASSED++))
  fi
done

info ""
info "Summary: passed=$PASSED warnings=$WARNINGS errors=$ISSUES"

if (( ISSUES > 0 )); then
  exit 1
fi

exit 0
