---
name: fable-debugging
description: Systematic debugging methodology — how to find the REAL cause of a bug before changing any code. Use this EVERY time something is broken, erroring, crashing, blank, failing tests, behaving wrong, showing wrong numbers, or "worked before but not now" — web apps, scripts, deploys, anything. Also use when a previous fix attempt didn't work, or when the user reports a problem vaguely ("it's acting weird", "it's not saving", "the total looks off"). Trigger even when the user never says the word "bug" or "debug" — any report that reality differs from expectation counts.
---

# Debugging like Fable

You are about to debug something. The biggest difference between a great debugger and a mediocre one is not knowledge — it is discipline. A mediocre debugger pattern-matches the symptom to a familiar-looking bug and starts editing code. A great debugger treats every hypothesis as a claim that must be proven with evidence before acting on it.

This file is that discipline, written down. Follow the loop in order. Do not skip steps because the bug "looks obvious" — obvious-looking bugs are exactly where guessing wastes the most time, because a wrong "obvious" fix sends you down a hole that takes ten times longer to climb out of.

## The prime directive

**Never edit code you haven't diagnosed.** A fix must be the *conclusion* of an investigation, never a substitute for one. Before your first edit, you should be able to complete this sentence with evidence, not intuition:

> "The bug happens because ___, and I know that because I observed ___."

If you can't fill in the second blank, you are still investigating. Keep investigating.

## The loop

### 1. Reproduce it — see the failure with your own eyes

Before anything else, make the bug happen where you can watch it. Run the script, load the page, call the function with the failing input. If the report came from a user ("David gets logged out"), reconstruct their exact conditions as closely as you can — their data, their steps, their environment.

Why this is non-negotiable: until you've reproduced it, you're debugging a *description* of a bug, and descriptions are unreliable. Users summarize, guess, and omit the one detail that matters. Reproduction also gives you the before/after test you'll need in step 6 — if you never saw it fail, you can't prove your fix made it stop failing.

If you genuinely cannot reproduce it, that fact IS your first clue: the difference between your environment and the failing one (data, account, device, cache, deployed version) is probably where the bug lives. Investigate the difference, not the code.

### 2. Read the error — all of it

Read the entire error message and the entire stack trace, word by word, before forming any theory. Not the first line. All of it. Then state, in one sentence, what the error literally says — not what you assume it means.

Errors are testimony from the crime scene. The line number, the variable that was null, the file it happened in, the request that returned 403 — these are facts. Your job in this step is to collect facts, and the most common failure mode is reading two words ("undefined", "permission") and jumping to a remembered bug that had those words in it. The error you're looking at is allowed to be a bug you've never seen before.

If there's no error — the program runs but does the wrong thing — go get testimony anyway: console output, server logs, network responses, the actual contents of the file or database. Wrong behavior with no error means something *silently* took an unexpected path, and logs are how you find the fork.

### 3. Ask what changed

Bugs don't appear by magic. If it worked before and doesn't now, something changed: code, data, environment, a dependency, a deploy, a token expiring, a date rolling over. Check the recent diff first (`git log`, `git diff`) — the newest code is the most likely suspect, and it's a small search space.

But keep the net wide: "what changed" includes things outside the repo. New data with a format the old data didn't have. A service that rotated a key. A cache holding yesterday's version. The first day of a new month exercising a code path that ran fine all last month. If the code hasn't changed, the input or the world did.

### 4. Locate the bug before touching it

Now narrow down *where* it goes wrong. The tool for this is instrumentation: print the actual values at points along the path and find the exact spot where reality stops matching expectation.

- **Print real values, don't imagine them.** "This variable should be the list of visits" is a hypothesis. `print(visits)` is a fact. When totals are wrong, print every item and the running total — the wrong item will be visible. When a lookup fails, print the key being looked up AND the keys that exist, side by side; mismatches (case, whitespace, type, format) hide when you only look at one of them.
- **Cut the search space in half.** Is the data already wrong when it arrives, or does it become wrong during processing? Print at the midpoint and you've eliminated half the code. Repeat. This is faster than reading everything and much faster than guessing.
- **Read the actual code on the actual path.** Once you're close, read the real code the failing case executes — not your memory of it, not what a similar file does. Bugs live in the gap between what you assume the code says and what it says.

### 5. Find the root cause, not the symptom

When you find the line where things go wrong, ask: is this where the bug *is*, or where the bug *lands*? Keep asking "and why is THAT true?" until you hit a fact about the world, not another piece of code. A `null` crash on line 80 is almost never a line-80 bug — something upstream produced the null, and *that* has a reason too.

The test for whether you've hit root cause: your explanation should account for **every** observed symptom, including the weird ones. If your theory explains the wrong total but not why it's only wrong in July, you have a partial theory — and partial theories produce partial fixes that come back next month. The symptoms your theory can't explain are precisely the ones pointing at the real cause.

Patching where the error lands (adding a null-check, a try/except, a fallback value) makes the error message disappear while the underlying wrongness continues silently. That is strictly worse than the crash.

### 6. Fix with one change, then verify honestly

Make the smallest change that fixes the root cause. One change. Then re-run the exact reproduction from step 1 and confirm the failure is gone — and glance around to confirm you didn't break the neighbors (run the tests if there are any; exercise the adjacent feature if there aren't).

Never declare victory on reasoning alone. "This should fix it" is not verification; watching the previously-failing case pass is. If you cannot run the code (e.g., the fix must deploy first), say so explicitly — "I've made the change but haven't been able to verify it live" — rather than announcing success. And when verifying a deploy, verify the *deployed artifact* (fetch the live bundle and look for your change), not just the absence of a deploy error; deploys queue, lag, and cache.

## The stuck protocol

If two fixes in a row have failed, STOP. You are no longer debugging; you are thrashing. A third guess is not the answer — your model of the problem is wrong somewhere, and more changes built on a wrong model add noise. Do this instead:

1. **Revert to a known state.** Undo speculative changes so you're observing the original bug, not the original bug plus your experiments.
2. **Write down every assumption you haven't personally verified.** Literally list them: "I assume the config is being loaded." "I assume this function is even being called." "I assume the deploy went out." "I assume the data looks like X." The bug is almost always hiding inside one of these — that's *why* you're stuck: everywhere you actually looked was fine.
3. **Verify each one, cheapest first.** A print statement at the top of a function proves in seconds whether it runs. Most stuck-states end here, with a sheepish discovery: wrong file, stale cache, function never called, data not shaped like you thought.
4. **Check the boring culprits.** Read `references/common-culprits.md` — a checklist of unglamorous causes (caching, stale deploys, environment drift, data format drift, timing) that account for a huge share of "impossible" bugs. A bug that defies logical explanation is usually a bug in your assumptions about the environment, not in the logic.
5. **Rebuild the timeline.** Say out loud what you now know for certain, in order: "The request arrives. The token is present. The response is 403. The scope field says X." Often the contradiction becomes visible the moment you line the facts up.

If the evidence contradicts your theory, the theory is wrong — not the evidence. Never dismiss an observation as "weird" and move on; the weird observation is the bug waving at you.

## Anti-patterns — recognize these in yourself and stop

- **The confident lunge:** editing code within a minute of hearing the symptom, because it "looks like" a known bug. Symptoms are shared by many causes; resemblance is not diagnosis.
- **The shotgun:** changing several things at once. Even if the bug disappears, you don't know which change mattered, and the others are now unexplained mutations in the code.
- **The victory lap:** saying "Fixed!" after reasoning that the change should work, without re-running the failing case. If you didn't watch it pass, it isn't verified.
- **The symptom mute:** wrapping the crash site in a guard so the error stops appearing. The error was the only honest signal you had; you silenced the witness.
- **The evidence dodge:** your theory predicts X, the log shows Y, and you keep the theory. Facts outrank theories, always.
- **The tunnel:** re-reading the same function for the fifth time. The bug is not in the place you've verified five times; it's in a place you haven't looked because you assumed you didn't need to. Return to the stuck protocol.

## Reporting to the user

Match the user's technical level. If they aren't a programmer, explain the diagnosis with a plain-language analogy before (or instead of) the technical details — "the app was checking names in a case-sensitive way, like a bouncer rejecting 'jason' because the list says 'Jason'" — and always report three things: what was wrong, why it happened, and how you proved it's fixed. If you couldn't verify the fix, say that plainly instead of projecting confidence you haven't earned.
