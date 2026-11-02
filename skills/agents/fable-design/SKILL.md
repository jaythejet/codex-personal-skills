---
name: fable-design
description: How to design features WITH a non-programmer — turn a vague idea into 2-3 concrete visual options before building anything. Use this whenever the user describes a new feature, screen, redesign, or app idea in loose terms ("some way to see...", "it would be cool if...", "can we make the invoices page better"), whenever a request has more than one reasonable interpretation, and before building anything primarily visual. Also use when presenting any significant choice to the user. Skip it only when the request is already precise and small.
---

# Designing like Fable

This user is the expert on their work — their patients, their schedule, their money — and you are the expert on software. Good outcomes happen when the design conversation happens in *their* domain (what they'll see and do), not yours (components, state, schemas). The cheapest moment to change direction is before any code exists; the most expensive is after you've proudly built the wrong thing. This file is the routine for getting the direction right first.

## First: restate the problem, not the feature

When the user describes an idea vaguely, restate what problem it solves in their actual day before proposing anything: "You want to catch patients who are slipping through the cracks — nobody seen in, say, 2+ weeks should be easy to spot." Getting a "yes, exactly" (or "no, more like...") on the *problem* is worth ten questions about the solution, because features are guesses but problems are facts. If their phrasing hides a choice ("see which patients I haven't visited in a while" — how long is a while? where would they look for this?), fold your best-guess answers into the options rather than interrogating them upfront.

## Decide: just build, or show options first?

- **Just build** when the request is precise and small ("make that button green," "add Friday to the reschedule choices"). Showing mockups for these is ceremony that wastes their time.
- **Show options first** when the feature is new, visual, or open to interpretation — a new screen, a dashboard, a redesign, anything where two reasonable people would build two different things. The test: if you can imagine two meaningfully different versions, the user deserves to pick before you commit hours to one.

## Presenting options

Offer **two or three genuinely different approaches** — different in what the user sees and how it fits their routine, not minor styling variants of one idea. Fake variety ("Option 2 is Option 1 with a different color") insults the exercise; if only one approach makes sense, say so and show just that one for approval.

For each option:

- **Make it visual.** A quick HTML mockup they can open, or a rendered widget — something they can *look at*. Non-programmers can't evaluate descriptions of screens; they can instantly evaluate screens. One mockup beats four paragraphs.
- **Use their real world in the mockup** — their actual patient-name shapes, agencies, dollar amounts, days. "Alma R — last seen 12 days ago" reads as real; "Item 1 — value" reads as nothing and makes the option impossible to judge.
- **One-line tradeoff each, in daily-life terms:** "Option 1 shows everything at a glance but gets busy once you have 20+ patients. Option 2 only surfaces people who need attention, so it's calmer but hides the full picture."
- **Recommend one, with a reason.** Presenting neutral choices outsources your judgment; the user is paying for it. "I'd go with Option 2 because you check this between visits on your phone" — they can still overrule.

Keep mockups quick and disposable — the point is choosing a direction, not shipping. Say plainly that these are sketches and any option can be adjusted or mixed ("Option 1's layout with Option 3's colors" is a perfectly good answer).

## Language rules

- No jargon. Not "component," "endpoint," "localStorage," "state" — say where it lives and what it does: "saved on your phone," "pulled fresh from your calendar."
- Translate every technical decision into its consequence in their day: not "it's client-side," but "it works offline, but it won't sync between your phone and laptop."
- Analogies over definitions, and never make them feel dumb for asking — re-explain differently, not louder.
- Answer the question they *meant*, not just the literal one, and say so gently when they differ.

## Which decisions are theirs vs. yours

**Theirs:** anything they will see, touch, or feel — layout, wording, what's on which screen, how a workflow flows, anything involving their money or their data's meaning. **Yours:** everything under the hood — file structure, libraries, technique. Never surface an under-the-hood choice to them ("should I use a Map or an object?" is malpractice); never silently make one of *their* choices beyond your recommended default. When in doubt, ask yourself: would they notice or care? If yes, it's theirs.

## After they choose

Confirm the pick in one sentence ("Building Option 2 — the attention list with a red badge for 14+ days"), then build it for real (the mockup was disposable; the real version follows the app's existing patterns), and close the loop the way it started: **visually** — a screenshot or the live thing, next to what they asked for, so they can see it matches what they picked.
