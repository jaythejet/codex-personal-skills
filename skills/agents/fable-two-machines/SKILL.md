---
name: fable-two-machines
description: How to work safely on a project the user edits from more than one computer (Windows desktop + MacBook). Use this BEFORE touching any project the user is known to edit elsewhere, whenever a git push is rejected or git reports "diverged"/"behind", whenever the user mentions "my MacBook", "my other computer", or "I worked on this earlier somewhere else", and whenever the code on this machine doesn't match what's live. Also use when reconciling two versions of the same project.
---

# Working across two machines like Fable

The user writes code with an AI assistant on a Windows desktop AND a MacBook. That means the copy of the project in front of you is not automatically the newest one — the other machine may be hours ahead. Every rule in this file exists because a real fork happened (Seniority, 2026-07-05): both machines had work the other didn't, and untangling it cost far more than prevention would have.

## The prime directive

**Never assume the machine you're on is current, and never destroy the other machine's work to make a problem go away.** A rejected push or a "diverged" warning is git telling you the other machine got ahead. The lazy exits — force-push, or blindly overwriting local files — permanently delete someone's real work. Both are forbidden without the user's explicit, informed choice.

## Before touching anything — the sync check (ten seconds, every session)

1. Run `git fetch` in the project.
2. Compare the two lines (`@{u}` means "this branch's remote counterpart" and works whether the branch is `main`, `master`, or anything else — do NOT hardcode `origin/main`; this user's projects differ):
   - `git log --oneline "HEAD..@{u}"` — commits the OTHER machine (remote) has that this one doesn't.
   - `git log --oneline "@{u}..HEAD"` — commits THIS machine has that were never pushed.
   - `git status` — uncommitted local edits.
3. Read the result as one of four states:
   - **In sync** (both lists empty): proceed normally.
   - **Behind** (remote has extra, local has none): `git pull`, then proceed. This is the common case after the user worked on the other machine.
   - **Ahead** (local has extra, remote has none): fine — but push when done so the other machine can catch up.
   - **Forked** (BOTH lists have commits): stop. Do not start the requested task. Reconciling comes first, because every edit on a forked copy makes the fork more expensive.

Skipping this check and building on a stale copy silently discards the user's work — the most expensive ten seconds you can save.

## When you find a fork

1. **Change nothing yet.** No commits, no pulls, no rebases, no "quick fixes."
2. **Inventory both sides in user terms.** For each side's unique commits, say what a user of the app would notice ("the MacBook line has the winner-reveal window; this desktop line has the DEFEAT screen and three color themes"). Commit messages and `git diff` give you this; translate them out of git-speak.
3. **Let the user pick the winner.** This is a product decision, not a technical one — only the user knows which work they value more, or whether both should survive. Present it as: which line wins, and what happens to the loser (merged in, shelved, or dropped). In the Seniority fork, the MacBook line won and the desktop features were deliberately shelved — the right answer, but only the user could have made that call.
4. **Preserve the losing side before resolving.** Put the losing commits on a named branch (e.g. `git branch shelved-desktop-work <hash>`) so "shelved" never quietly becomes "gone." Deleting is a separate, later decision.
5. **Resolve, push, and close the loop.** After the chosen line is on the remote, remind the user: the FIRST thing to do on the other machine is pull (or let the assistant there run this same sync check). A fork resolved on one machine is re-created the moment the other machine pushes stale work.

## What git does NOT sync

- **Per-device data.** These apps store real data (settings, visits, overrides) in the browser's localStorage on each device. Syncing code does not sync data, and that's usually by design — don't "fix" a difference in saved settings between devices as if it were a bug.
- **Secrets and env files.** `.env` files don't travel through git. If something works on one machine and fails on the other with auth/permission errors, suspect a missing local secret before suspecting the code.

## Deploys from two machines

A deploy publishes **the checkout on the machine that runs it**. If this machine is stale and you deploy, you just shipped old code — or erased a feature the other machine already shipped. So the sync check above is mandatory before any deploy, and doubly so for projects like Seniority where deploy is a manual command (`npm run cf:deploy`) that could be run from either machine. If what's live doesn't match what's in front of you, the first suspect is "the other machine deployed something newer," not a broken deploy.

## Reporting

Tell the user which state you found (in sync / behind / ahead / forked) at the start of work in plain language — "your MacBook pushed two changes since last time; I've pulled them in" costs one sentence and prevents every downstream surprise. If you resolved a fork, report what won, where the losing work is preserved, and what to do on the other machine.
