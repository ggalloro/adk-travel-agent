# Create an ADK Agent Skill in Antigravity

In the rapidly evolving world of artificial intelligence and agentic development, having access to the latest frameworks and tools is crucial. Recently, I embarked on a project to create an agent skill within Antigravity specifically designed to develop agents using the Google Agent Development Kit (ADK). This post details why this skill was necessary, what these technologies are, and how I built the agent skill step-by-step.

## What is Antigravity?

**Google Antigravity** is a platform designed to "Build the new way." It provides a powerful, agentic development environment where developers can pair program with an advanced AI coding assistant. One of Antigravity's key features is its extensibility through "skills." These skills allow the agent to adopt specialized instructions, helper scripts, and context tailored to specific frameworks or workflows, vastly expanding its capabilities for specialized tasks.

## What is the Agent Development Kit (ADK)?

The **Agent Development Kit (ADK)** is a flexible and modular framework for developing and deploying AI agents. While optimized for Gemini and the Google ecosystem, ADK is model-agnostic, deployment-agnostic, and built for compatibility with other frameworks. To put it simply, ADK was designed to make agent development feel more like traditional software development. It makes it easier for developers to create, deploy, and orchestrate agentic architectures ranging from simple targeted tasks to highly complex workflows.

## The Challenge: LLM Knowledge Cutoffs

A significant hurdle when working with cutting-edge, rapidly updating frameworks like ADK is the **Knowledge Cutoff** inherent to Large Language Models (LLMs). When I ask my AI agent to help me build an ADK application, it might rely on outdated APIs, deprecated methods, or an incomplete understanding of the framework's current state because its training data only goes up to a certain date.

To solve this, we cannot rely solely on the model's pre-trained weights. Instead, we must provide the agent with the most up-to-date documentation precisely when it starts a task.

## What is an Agent Skill?

In Antigravity, an **Agent Skill** is a structured folder of instructions, scripts, and resources that extend the agent's capabilities. At its core, every skill contains a `SKILL.md` file—a markdown document containing detailed instructions and rules the agent must follow when that skill is invoked. A skill can also include custom scripts to automate setup and a resources directory to provide static or dynamic contextual data. 

By creating an ADK skill, we can instruct the Antigravity agent on exactly how to use the framework, and more importantly, how to keep itself updated.

## How I Created the ADK Skill

To create the skill, I leveraged the Antigravity agent itself. I provided it with a clear prompt detailing my requirements. 

Here is the exact prompt I used:

> *"create a new agent skill to develop agents with Google Agent Development Kit, the skill must follow guidance from https://github.com/google/adk-python/blob/main/llms-full.txt, it must also update the file mentioned at each start. Create a .agent/skills/adk-skill folder and put assets in it following the folder structure guidance from https://antigravity.google/docs/skills"*

### The Resulting Skill Architecture

Following my prompt, the agent orchestrated the creation of the skill. Here is what the resulting architecture looks like and what each component does:

#### 1. Folder Structure
The skill lives inside the project's agent configuration directory:
```
.agent/skills/adk-skill/
├── SKILL.md
├── scripts/
│   └── update_adk_docs.sh
└── resources/
    └── llms-full.txt
```

#### 2. The Update Script (`scripts/update_adk_docs.sh`)
This is a straightforward bash script that solves the knowledge cutoff problem. It curls the latest `llms-full.txt` (a single-file, LLM-friendly version of the ADK documentation) directly from the official Google repository and saves it into the `resources` directory. 

#### 3. The `SKILL.md` File
This is the brain of the operation. The generated `SKILL.md` includes:
- **A Description:** Explaining that the skill equips the agent to build applications using the ADK framework.
- **A Critical Requirement:** A strict rule instructing the agent: *"You MUST run the update script below at the start of any task that involves using this skill."*
- **Context Injection:** Instructions telling the agent to explicitly read `/resources/llms-full.txt` using its file-reading tools to understand how to use the framework, manage sessions, implement streaming, and define agents before writing any code.

### Conclusion

By building this simple yet powerful agent skill, we effectively bridged the gap between a static AI model and a dynamically evolving framework. Now, whenever the Antigravity agent begins a task utilizing ADK, it automatically fetches the freshest documentation, reads the updated guidelines, and generates code that utilizes the absolute latest features and best practices. 

This pattern—combining a `SKILL.md` with an auto-updating documentation fetcher—is incredibly potent and can be adapted for virtually any rapidly changing technology stack you wish to build with in Antigravity.
