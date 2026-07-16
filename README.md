# SuperWriter

Agent skills for technical writers who want to create high-quality technical content fast. 

Works with Claude Code, OpenAI Codex, Cursor, Pi, and any agent that supports the [Agent Skills spec](https://agentskills.io).

## The Problem

AI can generate content fast, but without the right guidance it produces generic, forgettable output. You end up spending so much time editing the result into something worth publishing that you lose the speed advantage of using AI in the first place.

SuperWriter is a collection of skills designed to help you create quality technical content consistently with AI, without giving up the speed gains that made you reach for AI to begin with.

## Available Skills

| Skill | Version | What It Does |
|-------|---------|--------------|
| [concept-creator](skills/concept-creator/) | 0.1.0 | Research audience language, generate content concept options, develop a selected concept into a full brief |
| [prose-cleaner](skills/prose-cleaner/) | 1.0.0 | Clean up prose for clarity, brevity, and flow while preserving the writer's voice |

## Quickstart

**1. Install a skill:**

```bash
npx skills add TinyRocketLabs/superwriter --skill concept-creator
```

## Installation

### CLI Install (Recommended)

```bash
# Install all skills
npx skills add TinyRocketLabs/superwriter

# Install a specific skill
npx skills add TinyRocketLabs/superwriter --skill concept-creator

# List available skills
npx skills add TinyRocketLabs/superwriter --list
```

### Agent-Specific Install

```bash
# Claude Code
npx skills add TinyRocketLabs/superwriter -a claude-code

# Codex
npx skills add TinyRocketLabs/superwriter -a codex

# Pi
npx skills add TinyRocketLabs/superwriter -a pi
```

### Local Install (from checkout)

```bash
git clone https://github.com/TinyRocketLabs/superwriter.git
npx skills add /path/to/superwriter --skill concept-creator
```

### Clone and Copy

```bash
git clone https://github.com/TinyRocketLabs/superwriter.git
cp -r superwriter/skills/* .agents/skills/
```


