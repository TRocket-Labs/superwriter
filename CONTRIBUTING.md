# Contributing

Found a way to improve a skill or have a new one to add? PRs are welcome.

1. Fork the repository
2. Create your skill in `skills/<skill-name>/SKILL.md`
3. Run `./validate-skills.sh` to check your work
4. Open a pull request

## Validation

```bash
./validate-skills.sh
```

The validator checks:

1. Required `SKILL.md` files exist
2. Valid skill names and descriptions
3. Parseable YAML frontmatter
4. Parseable `agents/openai.yaml` files
5. No source-specific reference leakage
6. File size limits

## Pre-commit Hook

```bash
git config core.hooksPath .githooks
```
