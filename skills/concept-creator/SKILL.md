---
name: concept-creator
description: "Create or refine content concepts: focused content territories that group multiple standalone topics around one shared audience problem, outcome, or thesis. Use when a user wants to plan content pillars, shape editorial territories, turn rough themes into topic clusters, write a concept brief, or decide what to publish next."
metadata:
  version: 0.1.0
---

# Concept Creator

Help the user define focused content concepts that can support several connected pieces of content without becoming broad categories or disconnected topic lists.

## What a Concept Is

A concept is the smallest coherent container that can hold multiple standalone topics around one shared problem, outcome, or thesis.

It is broad enough to support several distinct topics, yet narrow enough that each topic makes meaningful progress toward the same central problem.

A good concept is:

- Narrow enough that every topic contributes toward the same outcome.
- Broad enough to support several valuable topics.
- Connected to a stage of the audience's journey or a problem a product, service, or organization helps solve.

Good concepts:

- Getting Better First Drafts from AI
- Developer Content Planning
- Introduction to Documentation Engineering
- Reducing Technical Documentation Review Bottlenecks
- Maintaining Accurate Product Documentation

Too broad:

- AI Writing
- Content Marketing
- Developer Marketing Strategy
- Documentation

When in doubt, prefer a concept that is slightly too narrow over one that is too broad. Narrow concepts produce focused content systems. Broad concepts become categories rather than teachable bodies of knowledge.

## Inputs

Use whatever context the user provides. Useful inputs include:

- Audience: who the content is for, what they already know, and what they are trying to do.
- Product or service: what problem it solves and where it fits in the audience's work.
- Existing ideas: rough topics, themes, keywords, customer questions, research notes, or competitor examples.
- Constraints: format, channel, funnel stage, publication cadence, or desired output count.

If key context is missing, ask only the smallest number of questions needed to produce a useful concept. If the user asks for speed or gives enough clues to proceed, make reasonable assumptions and state them briefly.

## Workflow

### 1. Gather the Missing Context

Identify the audience, the product or service connection, the problem the product or service solves, and the user's goal for the concept. Prefer using context already present in the conversation or project files before asking questions.

Completion criterion: you know who the concept is for, what problem it should organize content around, and what business or educational purpose it should serve.

### 2. Research Audience Language

Research how the target audience talks about the problem, product category, workflow, or desired outcome. Use sources where practitioners speak in their own words: forums, Q&A sites, community discussions, social posts, search results, practitioner blogs, review sites, and public docs issues. Prefer non-vendor sources when the goal is language, pain points, and questions.

Capture a small working set of language signals:

- Search phrases people use around the problem.
- Community questions people ask.
- Repeated problem language, complaints, or desired outcomes.
- Tools, workflows, or alternatives the audience mentions.
- Content gaps or angles that existing results do not answer well.

If live research is unavailable, use the user's supplied context and mark the language signals as inferred.

Completion criterion: you have enough audience language to name concepts in terms the audience might recognize, search for, or say in conversation.

### 3. Generate Candidate Concepts

Generate 3-7 candidate concepts before developing one. A candidate concept should name a teachable territory, not just a topic label, keyword, or problem phrase.

Each candidate should include:

- Concept name.
- The shared problem, outcome, or thesis it organizes.
- Why it is promising for this audience.
- A few example topics it could support.

Use the language signals to shape names and angles. Prefer concepts that imply a body of knowledge the audience can learn, such as "Introduction to Documentation Engineering," over bare phrases such as "Documentation Drift."

Completion criterion: the user has a shortlist of viable concepts that are meaningfully different from each other.

### 4. Select a Concept to Develop

If the user chooses a candidate, develop that one. If the user asks for a complete concept without choosing, select the strongest candidate and briefly state the reason for the choice.

Completion criterion: one concept has been selected for full development.

### 5. Develop the Selected Concept

Develop the selected concept into a complete concept brief using `references/concept-template.md`. Read that reference before writing the brief, then follow its numbered section guidance.

Use the audience's vocabulary when naming the concept. Prefer phrases a real member of the audience might say or search for over abstract category language.

Completion criterion: the selected concept is fully defined and every topic belongs to the same shared problem, outcome, or thesis.

### 6. Review Before Presenting

Check the concept silently before presenting it:

- Breadth: Could this describe an entire category, market, or company? If yes, narrow it.
- Coherence: Do all topics contribute to the same problem, outcome, or thesis?
- Topic fit: Is each topic a standalone piece, not a subheading inside one article?
- Scope fit: Does the scope define boundaries rather than restating the topic list?
- Connection: Does the connection explain a natural next step rather than promote the offer?
- Evidence: Are factual claims supported by supplied context, research, or clearly marked assumptions?
- Language: Does the concept use words the audience would use?
- Candidate quality: Is the concept more than a bare phrase, keyword, or problem label?

Fix issues before showing the result.

## References

- `references/concept-template.md`: read when developing a selected concept into the final concept brief.

## Output Format

When presenting candidates, use this structure:

```markdown
## Candidate Concepts

1. **[Concept Name]**
   - Organizes: [shared problem, outcome, or thesis]
   - Why it works: [why this is promising for the audience]
   - Possible topics: [2-4 example topics]
```

Use the complete concept structure in `references/concept-template.md` for the developed concept.

If the user asks for multiple options, give a short list of candidate concepts first, then fully develop the strongest one or the one the user selects.

If the user asks to save the output, write it to the requested location. If no location is specified but the current project has a clear concepts directory, save it there. Otherwise, present the concept in the conversation.

## Quality Bar

A final concept should pass these tests:

- It can support several content pieces.
- It is specific enough to reflect a clear point of view.
- It is broad enough to become several standalone pieces.
- It gives the audience a coherent body of knowledge, not a pile of adjacent ideas.
- It connects to the product, service, or organization through reader need rather than a sales message.
