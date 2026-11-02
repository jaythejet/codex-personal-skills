---
name: fable-shipping
description: How to update a live app without breaking it, and how to verify a deploy actually reached users. Use this EVERY time work involves deploying, publishing, pushing to GitHub/Vercel/Cloudflare, "updating the app," making a change the user will look for on their phone, or when the user says a shipped change "isn't showing up." Also use before changing anything in an app that is currently working in production. Trigger even if the user just says "push it" or "make it live."
---

# Shipping like Fable

A deploy is not an upload; it is a claim that real users now see the new thing. Between your edit and the user's phone sit several layers that each silently serve the old version — the git remote, the build queue, the CDN, the browser cache, and (for installed web apps) the service worker. "I ran the deploy command" only proves you got past layer one. This file is the routine for getting through all of them, plus the specific quirks of this user's projects.

## The prime directive

**Nothing is shipped until you have observed the change on the live site itself.** Not "the deploy command succeeded," not "the push went through," not "it works locally" — you fetched the live URL and saw the new behavior or the new code with your own eyes. Until then, report status as "deployed but not yet verified live," never "done."

## Before touching a working app

1. **Sync first.** Run `git fetch` and compare with the remote before editing anything. The user may have edited from another machine since your last session; building on a stale copy silently discards their work, and untangling a fork later costs far more than the ten seconds this check takes.
2. **Know this project's deploy path.** Projects differ in a way that burns people: some deploy automatically on git push; others require an explicit deploy command, and a push alone changes *nothing* live. Check the project's docs/memory before assuming. Getting this wrong in the optimistic direction means telling the user something is live when it is not.
3. **Note what currently works.** Identify the two or three features adjacent to your change. A working production app is an asset users depend on today; the bar is "improve it without breaking it," and you can't protect what you didn't notice.

## Making the change

Keep the change as small as the task allows, and commit it with a message that says what a user would notice ("Reschedule buttons now include Friday"), because commit history is the rollback map. Before deploying, plant or identify a **verifiable marker** — some string unique to this change (new label text, a version string) that you can search for in the live site's files to prove the new build is being served. Without a marker, "is the new version live?" has no objective answer.

## Verifying the deploy — the layers, in order

1. **Did it leave your machine?** Push happened, no errors, the remote shows the commit.
2. **Did the platform build and release it?** Deploys queue and lag — five or more minutes of silence is normal on some platforms and does NOT mean failure. Do not panic-redeploy, and do not conclude failure from absence; wait and re-check. Redeploying on top of a queued deploy just makes the timeline confusing.
3. **Is the new code actually being served?** Fetch the live site's JavaScript bundle (e.g. `curl` the asset URL) and search it for your marker. This is the decisive check — it bypasses your browser's cache entirely and answers the only question that matters. A dashboard saying "deployment succeeded" is layer-2 evidence; the marker in the served bundle is layer-3 proof.
4. **Will the user's device show it?** Installed web apps (PWAs) cache aggressively via service workers: the user's phone can keep serving last week's version even though the server has the new one. If the site is a PWA, tell the user how to pick up the update (fully close and reopen the app; if stubborn, reload twice or reinstall) — and say what they should *see* when they have it ("the greeting now says X"), so they can confirm without guessing.

If the user reports "I don't see the change," run these layers in order before touching any code — in practice the code is usually fine and one of the layers is stale. Distinguish "not deployed" from "deployed but cached" by comparing the curl result (server truth) with what their device shows.

## After it's live

Exercise the adjacent features on the live site, not just the changed one — a change that ships while quietly breaking its neighbor is a net loss the user discovers at the worst moment. And know your rollback: the last good commit hash. If live is actually broken, revert first and investigate second; users staring at a broken app outrank your curiosity about the cause.

## Reporting

Tell the user three things: what shipped, how you proved it's live (which check you ran), and what they should see or do on their device. If any layer is unverified — deploy still queued, couldn't check the phone — say exactly that instead of rounding up to "done." "It's pushed and building; I'll confirm it's live in a few minutes" is a fine report. "Done!" when it's actually still queued is how trust dies.

## Known quirks of this user's projects

- **ZigZag** (Vercel, `zig-zag-flax.vercel.app`): deploys automatically on GitHub push, but builds can sit queued 5+ minutes looking like nothing happened. Verify by curling the live `/assets/*.js` bundle for a marker string — never conclude failure from lag. It's an installed iOS PWA for its users, so the service-worker cache layer fully applies.
- **Seniority** (`seniorityhh.pages.dev`, Cloudflare Pages): a GitHub push does **NOT** deploy it. It requires `npm run cf:deploy` explicitly. Pushing and reporting "live" without that command has bitten before.
- **Multiple machines:** the user also edits on a MacBook. Always `git fetch` and compare before working — a fork between machines has happened before and is expensive to untangle.
