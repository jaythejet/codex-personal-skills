---
name: "source-command-handoff"
description: "Write a plain-language handoff summary to paste into a new chat"
---

# source-command-handoff

Use this skill when the user asks to run the migrated source command `handoff`.

## Command Template

Write a concise, plain-language handoff summary of the current project and where
we are, suitable for pasting into a brand-new chat that has zero prior context.

IMPORTANT: The user (Jason) is NOT a programmer. Use plain language, no jargon.

Structure it like this:

## <Project name> — handoff

**What it is:** one or two sentences — what the app does, the tech, where it's
deployed (URL), the repo, and the local folder path.

**Important about me (Jason):** physical therapist, not a coder — explain in
plain language.

### Current state
Bullet list of what's built and currently live/deployed.

### Things to know when working on this
Deploy + verify steps, any gotchas, test status, anything that would trip up a
fresh session.

### Open / possible next steps
Anything pending, offered, or half-decided. Mark clearly if nothing is urgent.

Keep it tight and skimmable. Pull real details from the current conversation,
the memory files, and the code — don't invent anything. End by offering to save
anything important to memory before the chat is switched.
