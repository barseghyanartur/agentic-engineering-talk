===================
Agentic Engineering
===================

.. _github.com/obra/superpowers: https://github.com/obra/superpowers
.. _pytest-codeblock: https://github.com/barseghyanartur/pytest-codeblock
.. _proselint: https://github.com/amperser/proselint
.. _markdownlint: https://github.com/igorshubovych/markdownlint-cli
.. _doc8: https://github.com/pycqa/doc8
.. _OpenCode: https://opencode.ai/
.. _Claude Code: https://claude.ai/code
.. _llms.txt: https://llmstxt.org/
.. _AGENTS.md: https://agents.md/
.. _SKILL.md: https://skill.md/
.. _LLMFeeder: https://github.com/jatinkrmalik/LLMFeeder
.. _difftastic: https://github.com/wilfred/difftastic
.. _markdownlint-cli: https://github.com/igorshubovych/markdownlint-cli
.. _Ollama: https://ollama.com/
.. _OpenCode: https://opencode.ai/
.. _OpenCode Zen: https://opencode.ai/docs/zen/
.. _Claude Code: https://claude.ai/code
.. _Qwen3.5: https://ollama.com/library/qwen3.5/tags
.. _MiniMax M2.5: https://www.minimax.io/news/minimax-m25
.. _Qwen3.6 Plus: https://qwen.ai/blog?id=qwen3.6
.. _Kiro.dev: https://kiro.dev/
.. _github.com/barseghyanartur/dot-agents: https://github.com/barseghyanartur/dot-agents
.. _github.com/barseghyanartur/tld: https://github.com/barseghyanartur/tld
.. _github.com/anthropics/skills: https://github.com/anthropics/skills/
.. _github.com/forrestchang/andrej-karpathy-skills: https://github.com/forrestchang/andrej-karpathy-skills

The problem
===========

- LLMs are only as good as the context you give them
- Vague instructions → vague results
- No structure → no reliability

The era of agents...
====================
.. div:: sd-d-flex-row sd-align-major-center

    .. image:: images/agent_cleo.png
       :width: 800px
       :alt: When you prompt an LLM with "just build me X"
       :align: center

Structural approach needed
==========================
It's time to put AI on rails!

.. revealjs-break::
    :notitle:

.. div:: sd-d-flex-row sd-align-major-center

    .. image:: images/cleo_train_plan.png
       :width: 800px
       :alt: It's time to put AI on rails!
       :align: center

New concepts/standards
======================
- `llms.txt`_
- `AGENTS.md`_
- `SKILL.md`_
- MCP
- Agent Harness (`Claude Code`_, `OpenCode`_, etc.)
- Something news emerges every day

llms.txt
--------
- LLM optimized docs (.md, .rst) written by package/service owners
- Instructions to install, use, test, and code
- Faster/better AI consumption → improved accuracy

.. revealjs-break::
    :notitle:

What to look for?
~~~~~~~~~~~~~~~~~

.. code-block:: text

    - DOMAIN + /llms.txt
    - DOMAIN + /llms-full.txt

.. revealjs-break::
    :notitle:

Examples
~~~~~~~~
- `Anthropic <https://platform.claude.com/llms.txt>`__: https://platform.claude.com/llms.txt
- `Anthropic full <https://platform.claude.com/llms-full.txt>`__: https://platform.claude.com/llms-full.txt
- `GitHub <https://docs.github.com/llms.txt>`__: https://docs.github.com/llms.txt
- `OpenAI <https://developers.openai.com/api/docs/llms.txt>`__: https://developers.openai.com/api/docs/llms.txt
- `OpenAI full <https://developers.openai.com/api/docs/llms-full.txt>`__: https://developers.openai.com/api/docs/llms-full.txt
- `Marimo <https://docs.marimo.io/llms.txt>`__: https://docs.marimo.io/llms.txt
- `Agentskills <https://agentskills.io/llms.txt>`__: https://agentskills.io/llms.txt
- `Agentskills full <https://agentskills.io/llms-full.txt>`__: https://agentskills.io/llms-full.txt

LLMs can write awesome documentation
------------------------------------
.. revealjs-break::
    :notitle:

DeepWiki
~~~~~~~~

`deepwiki.com <https://deepwiki.com/>`__

.. revealjs-break::
    :notitle:

Works as MCP for OpenCode
~~~~~~~~~~~~~~~~~~~~~~~~~
.. code-block:: json

  "mcp": {
    "deepwiki": {
      "type": "remote",
      "url": "https://mcp.deepwiki.com/mcp",
      "enabled": true
    }
  }

.. revealjs-break::
    :notitle:

Or Claude Code
~~~~~~~~~~~~~~
.. code-block:: sh

    claude mcp add -s user -t http deepwiki https://mcp.deepwiki.com/mcp

AGENTS.md & SKILL.md
--------------------
- Guide agents through codebase
- Helps write and review code with fewer mistakes
- DRY, no repetition → get more done

A couple of AGENTS.md examples
------------------------------

.. revealjs-break::
    :notitle:

.. container:: sd-fs-3 sd-text-center

    *Filename: github.com/langchain-ai/langchain/AGENTS.md*

.. literalinclude:: examples/langchain_AGENTS_example.md
    :language: markdown

.. revealjs-break::
    :notitle:

.. container:: sd-fs-3 sd-text-center

    *Filename: github.com/barseghyanartur/safezip/AGENTS.md*

.. literalinclude:: examples/safezip_AGENTS_example.md
    :language: markdown

.. revealjs-break::
    :notitle:

Tip: Use `/init` command to create AGENTS.md for your repository.

A couple of SKILL.md examples
-----------------------------
.. revealjs-break::
    :notitle:

.. container:: sd-fs-3 sd-text-center

    *Filename: github.com/marimo-team/skills/jupyter-to-marimo/SKILL.md*

.. literalinclude:: examples/jupyter_to_marimo_SKILL_example.md
    :language: markdown

.. revealjs-break::
    :notitle:

.. container:: sd-fs-3 sd-text-center

    *Filename: github.com/marimo-team/skills/marimo-notebook/SKILL.md*

.. literalinclude:: examples/marimo_notebook_SKILL_example.md
    :language: markdown

.. revealjs-break::
    :notitle:

.. container:: sd-fs-3 sd-text-center

    *Filename: github.com/anthropics/skills/pdf/SKILL.md*

.. literalinclude:: examples/anthropics_pdf_SKILL_example.md
    :language: markdown

Documentation validity
----------------------
- If docs are wrong/outdated, results will be too

Documentation quality
---------------------
- If your SKILL.md contains code examples — they need to actually work
- Automated linting: `markdownlint`_, `doc8`_
- Automated testing: `pytest-codeblock`_ for Python
- Automated syncing of code/documentation: SKILL.md

Markdownlint
------------

See the official `markdownlint-cli`_ documentation.

.. code-block:: sh

    brew install markdownlint-cli

.. revealjs-break::
    :notitle:

Pre-commit config exists:

.. code-block:: yaml

    - repo: https://github.com/igorshubovych/markdownlint-cli
      rev: v0.48.0
      hooks:
      - id: markdownlint

Spec-driven development
=======================

In the past (pre LLMs) we used to write a spec...
-------------------------------------------------

.. div:: sd-d-flex-row sd-align-major-center

    .. image:: images/cleo_diagrams.png
       :height: 800px
       :alt: Write it down first, then ask the LLM
       :align: center

Now we still write specs, but with the help of AI
-------------------------------------------------
.. revealjs-break::
    :notitle:

1. Write the initial spec — clear, complete, no vague language
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. revealjs-break::
    :notitle:

.. container:: sd-fs-3 sd-text-center

Checklist sample:

- If creating a public API, is it easy to consume?
- What does "happy-path" look like?
- What does "error-path" look like?
- What are the alternatives/considered solutions?
- Write some pseudo code. You should like the API!
- Am I reinventing the wheel? Can I use/configure an existing library?
- Less code = less maintenance!

.. revealjs-break::
    :notitle:

2. Consult the LLM — ask for critique, missing pieces, improvements
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Harness tools like `OpenCode`_ and `Claude Code`_ have a `plan` mode.

.. revealjs-break::
    :notitle:

.. container:: sd-fs-3 sd-text-center

    github.com/obra/superpowers/skills/brainstorming/SKILL.md

.. literalinclude:: examples/superpowers_brainstorming_SKILL_example.md

.. revealjs-break::
    :notitle:

3. Build upon the refined spec
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Switch to `build` mode

.. revealjs-break::
    :notitle:

4. Tips
~~~~~~~

- Save the spec for reference/docs
- Commit everything before switching to `build` mode.
- Only commit when you understand the change. `git diff` is your friend.
- `difftastic`_ Help to reduce `git diff` noise.
- `LLMFeeder`_ is a browser plugin that converts pages into Markdown

What's next
===========

#. Create an AGENTS.md and SKILL.md files from scratch for your
   project
#. Create a specific SKILL.md from scratch for your project
#. How to auto-update your documentation (README.md, AGENTS.md, SKILL.md, etc.) with LLMs

Agents directories and symlinks
-------------------------------

- `.agents/skills/` — for agent-specific skills (understood by most except Claude)
- Symlink `.claude/skills/` to `.agents/skills/` for Claude compatibility

.. revealjs-break::
    :notitle:

Create ``~/.agents/skills`` directory in your home directory
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. code-block:: sh

    mkdir -p ~/.agents/skills

.. revealjs-break::
    :notitle:

Make a proper symlink to ``~/.claude/skills``
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
.. code-block:: sh

    mkdir -p ~/.claude
    cd ~/.claude
    ln -s ../.agents/skills skills

But let's show BEFORE and AFTER
===============================

.. div:: sd-d-flex-row sd-align-major-center

    .. image:: images/confronting_the_agents.png
       :height: 800px
       :alt: Confronting the agents without AGENTS.md and SKILL.md
       :align: center

Step 0: Tryout with no SKILL.md and no AGENTS.md
================================================
.. revealjs-break::
    :notitle:

I'll be experimenting on `github.com/barseghyanartur/tld`_ repository.

.. code-block:: sh

    cd ~/repos/tld
    opencode

.. revealjs-break::
    :notitle:

Let's ask an agent to implement a single feature:

.. code-block:: text

    Result.private property — expose whether a domain uses a private TLD
    The TrieNode already tracks private: bool, and process_url already has
    access to the matched node. But Result never surfaces it. Users who care
    about the public/private distinction (e.g., filtering out AWS/GCP
    subdomains) currently have to call get_tld twice with different
    search_private flags to infer it. A single result.private boolean would
    be a clean, zero-cost addition.

.. revealjs-break::
    :notitle:

Even if the agent is able to do it, it will likely fail to:

- Follow the coding standards
- Fail to run the tests
- Fail to update the documentation

.. revealjs-break::
    :notitle:

.. raw:: html

    <iframe width="100%"
            height="800px"
            src="https://www.youtube.com/embed/IgNYXLWS2bM?si=mZ9Xu1kkzlhYVeb1"
            title="YouTube video player"
            frameborder="0"
            allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
            referrerpolicy="strict-origin-when-cross-origin"
            allowfullscreen>
    </iframe>

.. revealjs-break::
    :notitle:

.. div:: sd-d-flex-row sd-align-major-center

    .. image:: images/doubts_3_v2.png
       :height: 800px
       :alt: Write it down first, then ask the LLM
       :align: center

Step 1: Creating an AGENTS.md + basic skills from scratch
=========================================================

Objective
---------

- AGENTS.md
- Supportive SKILL.md's for:

  - coding-standards
  - dev-setup
  - dev-workflow
  - pr-review
  - update-documentation

List skills
-----------
.. code-block:: sh

    /skills

Bootstrapping
-------------
`github.com/barseghyanartur/dot-agents`_

- No ``/init`` command
- Use ``/repo-bootstrap`` skill

.. revealjs-break::
    :notitle:

.. raw:: html

    <iframe width="100%"
            height="800px"
            src="https://www.youtube.com/embed/XT032IZgDDU?si=JpZx2lECPN-T1pVc"
            title="YouTube video player"
            frameborder="0"
            allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
            referrerpolicy="strict-origin-when-cross-origin"
            allowfullscreen>
    </iframe>

.. revealjs-break::
    :notitle:

.. div:: sd-d-flex-row sd-align-major-center

    .. image:: images/very_exciting_1.png
       :height: 800px
       :alt: Awesome!
       :align: center

Step 2: Tryout with AGENTS.md and SKILL.md
==========================================

.. div:: sd-d-flex-row sd-align-major-center

    .. image:: images/fighting_agents_with_skills.png
       :height: 800px
       :alt: Fighting the agents with AGENTS.md and SKILL.md
       :align: center

.. revealjs-break::
    :notitle:

Ask the agent to do the same task

.. revealjs-break::
    :notitle:

.. raw:: html

    <iframe width="100%"
            height="800px"
            src="https://www.youtube.com/embed/JJuuQhJgbHs?si=DPLh5AzGXCfB5ajB"
            title="YouTube video player"
            frameborder="0"
            allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
            referrerpolicy="strict-origin-when-cross-origin"
            allowfullscreen>
    </iframe>

Enjoy watching the agent
------------------------

- Doing its work
- Following the coding standards
- Running the tests
- Updating the documentation

.. revealjs-break::
    :notitle:

.. div:: sd-d-flex-row sd-align-major-center

    .. image:: images/very_exciting_1.png
       :height: 800px
       :alt: Awesome!
       :align: center

Step 3: Create a specific SKILL.md for migrating from `mypy` to `ty`
====================================================================

.. revealjs-break::
    :notitle:

.. code-block:: text

    /skill-authoring I need a SKILL.md for migrating from `mypy` to `ty`.

.. revealjs-break::
    :notitle:

.. raw:: html

    <iframe width="100%"
            height="800px"
            src="https://www.youtube.com/embed/7mBaYTd-4vE?si=LieGoEY45awD7cLt"
            title="YouTube video player"
            frameborder="0"
            allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
            referrerpolicy="strict-origin-when-cross-origin"
            allowfullscreen>
    </iframe>

.. revealjs-break::
    :notitle:

.. div:: sd-d-flex-row sd-align-major-center

    .. image:: images/very_exciting_1.png
       :height: 800px
       :alt: Awesome!
       :align: center

Step 4: Auto-updating documentation
===================================
- Analyse code
- Find misalignments
- Update docs

.. revealjs-break::
    :notitle:

.. code-block:: text

    /update-documentation

.. revealjs-break::
    :notitle:

.. raw:: html

    <iframe width="100%"
            height="800px"
            src="https://www.youtube.com/embed/omC3a0Zq9bU?si=3yYwL8eSwnqM7lA7"
            title="YouTube video player"
            frameborder="0"
            allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
            referrerpolicy="strict-origin-when-cross-origin"
            allowfullscreen>
    </iframe>

.. revealjs-break::
    :notitle:

.. div:: sd-d-flex-row sd-align-major-center

    .. image:: images/very_exciting_1.png
       :height: 800px
       :alt: Awesome!
       :align: center

Step 5: Safe exploration of LLMs and agents
===========================================
- At home, on your personal devices
- Experiment with agents
- No costs

Running LLMs locally
--------------------
- No data/privacy concerns

- `Ollama`_ is your fiend.
- `Qwen3.5`_ is a great model for agentic coding tasks.

.. revealjs-break::
    :notitle:

It works with `OpenCode`_:

.. code-block:: sh

    ollama launch opencode --model qwen3.6:35b-a3b-coding-nvfp4

It works with `Claude Code`_:

.. code-block:: sh

    ollama launch claude --model qwen3.6:35b-a3b-coding-nvfp4

Some of the local models I use
------------------------------

.. code-block:: text

    gemma4:31b                        5571076f3d70    19 GB     5 days ago
    gemma4:e2b                        7fbdbf8f5e45    7.2 GB    5 days ago
    gemma4:e4b                        c6eb396dbd59    9.6 GB    5 days ago
    glm-4.7-flash:latest              d1a8a26252f1    19 GB     7 weeks ago
    nemotron-3-nano:4b                6cc467f05439    2.8 GB    5 days ago
    qwen3.5:0.8b-nvfp4                6d2b253cfc04    1.0 GB    5 days ago
    qwen3.5:27b-coding-nvfp4          d57ac1bd5340    19 GB     5 days ago
    qwen3.5:2b-nvfp4                  0ab1f7a1e882    2.5 GB    5 days ago
    qwen3.6:35b-a3b-coding-nvfp4      6e73b30f8f1c    21 GB     11 days ago
    qwen3.5:4b-nvfp4                  61aa3858e9d3    4.0 GB    5 days ago
    qwen3.5:9b-nvfp4                  203e30078279    8.9 GB    11 days ago

Free tier
---------
- ⚠️ your data will be used for training!

.. revealjs-break::
    :notitle:

Use `OpenCode Zen`_ for free access to agentic LLMs in the cloud:

- `MiniMax M2.5`_ Free
- `Big Pickle` Free
- `Nemotron 3 Super` Free

.. revealjs-break::
    :notitle:

Or use `Kiro.dev`_ either as CLI or IDE (VSCode based)

- `Claude Sonnet 4.5` Free
- `MiniMax M2.5`_ Free
- `GLM 5` Free
- `DeepSeek 3.2` Free

.. revealjs-break::
    :notitle:

- Limits apply
- Hitting the limit? Time to stop! Keep good life/fun ratio

But if you are desperate...
---------------------------

Use free tier in `Ollama`_ cloud:

- `MiniMax M2.5`_ Free
- `GLM 5` Free
- `Kimi K2.5` Free

.. revealjs-break::
    :notitle:

For `OpenCode`_:

.. code-block:: sh

    ollama launch opencode --model glm-5.1:cloud

For `Claude Code`_:

.. code-block:: sh

    ollama launch claude --model glm-5.1:cloud

Step 7: Closing words and tips
==============================

Start thinking in SKILLs
------------------------
- Repetitive tasks → good candidates for SKILLs
- Example: setting up logging in every project → create a SKILL.md for logging
- When designing a skill, think about migration too

Benefits?
---------
Just think about:

- Colleague: "Can you help me with X?"
- You: "I can explain it to you"

Versus
------
- Colleague: "Can you help me with X?"
- You: "I have a SKILL.md for that, let me show/share it with you"

Questions
=========

.. div:: sd-d-flex-row sd-align-major-center

    .. image:: images/very_exciting_1.png
       :height: 800px
       :alt: Awesome!
       :align: center

Links
=====

- `Anthropic: The Complete Guide to Building Skills for Claude <https://resources.anthropic.com/hubfs/The-Complete-Guide-to-Building-Skill-for-Claude.pdf>`__
- `markdownlint`_: Linter for Markdown files
- `doc8`_: Linter for reStructuredText files
- `OpenCode`_: Open-source agent harness with free tier
- `Claude Code`_: Agent harness by Anthropic
- `Kiro.dev`_: Agentic IDE and harness with free tier

.. revealjs-break::
    :notitle:

- `llms.txt`_: A standard for LLM-optimized documentation
- `AGENTS.md`_: A standard for guiding agents through your codebase
- `SKILL.md`_: A standard for documenting individual skills
- `LLMFeeder`_: A browser plugin that converts pages into Markdown
- `difftastic`_: A tool to reduce `git diff` noise and make code changes clearer
- `pytest-codeblock`_: A plugin for testing code blocks in documentation

.. revealjs-break::
    :notitle:

- `Ollama`_: Free local/cloud models
- `github.com/anthropics/skills`_: Useful skills
- `github.com/obra/superpowers`_: Useful skills
- `github.com/barseghyanartur/dot-agents`_: Usefull skills
- `github.com/forrestchang/andrej-karpathy-skills`_: Usefull skills
- `barseghyanartur.github.io/gistblog/posts/2026/05/pygrunn-2026-talk-agentic-engineering/ <https://barseghyanartur.github.io/gistblog/posts/2026/05/pygrunn-2026-talk-agentic-engineering/>`__
