---
name: seniority-pt-follow-up
description: Draft, update, review, and save unsigned SENIORITY Home Health physical-therapy follow-up visits (Progress Notes) in UltraHHC. Use when the user says SENIORITY follow-up, follow visit, regular PT visit, progress note, scale the prior visit, base the note from the previous progress note, update vitals or gait, or lightly revise the patient response. Never invent clinical findings or sign, submit, certify, or attest.
---

# SENIORITY PT Follow-Up Progress Note

Complete the clinician-selected routine PT follow-up visit in UltraHHC. Treat `Follow-Up Note`, `follow visit`, and `Progress Note` as the same workflow.

## Goal timeframe rounding

When entering or updating goal timeframes in weeks, always use whole numbers. Round any partial week up to the next whole week (ceiling); never enter decimal weeks. For example, 26 days becomes 4 weeks. Apply this to calculated, copied, and clinician-provided fractional goal durations. Preserve actual calendar dates and the verified episode end; rounding a duration does not change those dates. This rule applies only to goal durations, not clinical measurements or numeric goal targets.

## Safety and record integrity

- Verify the selected patient and intended visit date before editing.
- Treat the selected visit's performed date as the assessment date. Never substitute the copied note's date, an email date, the edit date, or the current date.
- Use only the clinician's current instructions and the most recent appropriate signed PT Progress Note.
- Never invent or randomize vitals, symptoms, assistance, device, gait distance, interventions, or clinical response.
- Apply arithmetic changes to vitals only when the clinician explicitly provides both the baseline and the requested adjustment. Calculate exactly.
- When the clinician directly supplies baseline vitals, use those values without opening another note merely to recheck them.
- Preserve unchanged clinical content. Update only the fields the clinician identifies and duplicated fields needed for internal consistency.
- Save completed work automatically as an unsigned, `In Progress` note. Never click an electronic-signature, submit, certify, attest, or finalize control.
- Whenever an UltraHHC staff or clinician selector is used, select only the exact autocomplete record `NGO, JASON QUANG PT`. Never select `Ngo - INTOUCH, Jason PT`, `NGO, JASON PT`, `BUI, DANIEL NGOC PT`, or any other similarly named clinician. If this workflow leads to a SENIORITY order, populate only the first `Select RN/PT/Office Staff` box with the exact `NGO, JASON QUANG PT` record; leave the second `Select LVN/PTA/Field Staff` box blank unless the user explicitly instructs otherwise, and verify both conditions before saving.

## Routine workflow

1. Inspect the selected UltraHHC visit and verify:
   - patient name and MR number;
   - intended visit date shown in the visit record;
   - note type is `Progress Note`;
   - status is `In Progress`.
2. Determine whether the note is already populated.
3. If the note is blank, open `More Options` -> `Base Note From`.
4. Select the newest appropriate signed `Physical Therapy Progress Visit Note`.
   - Prefer the immediately preceding routine PT Progress Note.
   - Do not select an Evaluation Note, re-evaluation, discharge note, or unrelated discipline note.
5. Click `Copy Note`, accept UltraHHC's copy confirmation, and dismiss the success message.
6. Verify that the clinical sections populated before editing. UltraHHC may not visually populate every value until the relevant section is in view; read the actual visible control values before concluding a field is blank.
7. Enter the clinician-directed current visit changes.
8. Run the consistency audit below.
9. Click `Save`.
10. Confirm the note remains unsigned and `In Progress`, then leave it open for clinician review.
11. In the completion report, state the performed assessment/visit date that was verified in the saved note.

## Vitals

- Enter temperature, pulse/heart rate, systolic BP, and diastolic BP exactly as directed.
- For a scaling instruction, calculate each component independently. Example: baseline BP `126/64`, add 2 to both values -> `128/66`; baseline HR `79`, subtract 3 -> `76`.
- Do not change temperature, respirations, oxygen saturation, BP side, BP position, rhythm, or pain unless the clinician instructs it or the current visit documentation supports it.
- After entry, verify the visible controls display the intended values. Blur the field before saving so UltraHHC registers the change.

## Gait and duplicated findings

- Enter the current gait finding in the `AMBULATION` box using the existing format unless the clinician specifies another format, for example:

  `200 ft no AD with CGA`

- Update the gait-training sentence inside `ASSESSMENT` to the same distance, assistance level, device, and surface.
- If the clinician changes only distance, preserve the existing assistance, device, surface, cues, gait pattern, and safety language.
- Update every other current-note occurrence of the prior gait distance when it describes the same visit.
- Do not claim improvement in balance, assistance, device use, gait quality, or independence merely because distance increased.

## Patient/Caregiver Response

- Lightly reword the prior response so it reads as a current visit and is not a verbatim duplicate.
- Preserve the clinical meaning, symptoms, cueing needs, fatigue, rest breaks, safety concerns, and skilled-need rationale unless the clinician reports a change.
- When gait distance increases, state the supported improvement narrowly, such as improved gait distance or activity tolerance.
- Use `Pt.` at the beginning of a sentence and `pt.` within a sentence. Do not spell out `Patient` in newly written response text.
- Do not add adverse events, tolerance, symptoms, caregiver participation, education, or progress that the clinician did not provide or that the copied note does not support.

## Minimal-edit rule

For an established routine follow-up visit, leave the assessment and other sections unchanged when the clinician says everything is the same. Make only:

- the directed vital-sign changes;
- current gait changes and their duplicate assessment entries;
- the dictated subjective change, when provided;
- a light response rewrite;
- corrections required for internal consistency.

## Pre-save audit

Verify in one pass:

- correct patient, performed assessment/visit date, and `Progress Note` type;
- note is based on the appropriate prior Progress Note;
- all clinician-directed vitals are entered and mathematically correct;
- gait distance matches in `ASSESSMENT`, `AMBULATION`, and `Patient/Caregiver Response` when stated there;
- assistance, device, surface, symptoms, fatigue, and cueing remain consistent;
- no unsupported findings were introduced;
- new narrative uses `Pt.` or `pt.` rather than `Patient`;
- note is saved, unsigned, and still `In Progress`.

## Source precedence

When information conflicts, use:

1. Clinician's current-visit dictation and explicit corrections.
2. Current measured values supplied by the clinician.
3. The newest appropriate signed PT Progress Note used as the base.
4. Other chart history for context only.

Stop and ask one concise question when a required current value or a material clinical choice cannot be determined without guessing.
