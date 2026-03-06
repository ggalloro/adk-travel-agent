---
name: Google ADK Skill
description: Develop agents and applications using the Google Agent Development Kit (ADK) framework.
---

# Google Agent Development Kit (ADK) Skill

This skill equips you to build applications and agents using the Google Agent Development Kit (ADK).

## CRITICAL REQUIREMENT AT TASK START
**You MUST run the update script below at the start of any task that involves using this skill:**
```bash
/Users/galloro/adk-skill-blog/.agent/skills/adk-skill/scripts/update_adk_docs.sh
```
This ensures you have the latest reference documentation.

## Documentation
The comprehensive documentation for building with ADK is located here:
`/Users/galloro/adk-skill-blog/.agent/skills/adk-skill/resources/llms-full.txt`

You MUST read this resource file using the `view_file` or `grep_search` tools to understand how to use the framework, manage sessions, implement streaming, handle bidirectional communication, and define agents.

## Key Principles
When using ADK, follow these core practices:
1. Always base your implementations on the patterns described in the `llms-full.txt` documentation.
2. Ensure you initialize the Python virtual environment and install the correct version of `google-adk` as specified in the docs.
3. For web apps and streaming, model your server (FastAPI) and client (JavaScript) side code on the examples provided in the documentation.
