---
name: seniority-pt-reeval
description: Draft, review, and save unsigned SENIORITY Home Health PT re-evaluation notes in UltraHHC and create the associated unsigned PT REEVAL telephone order using the latest patient-specific Gmail update. Use for SENIORITY PT re-evaluations, re-eval notes, reassessment-update emails that feed a re-evaluation, and PT REEVAL orders. Keep the UltraHHC note type as Evaluation Note unless the user explicitly says otherwise. Never invent clinical data. Save unsigned by default; sign only with explicit current-session clinician authorization.
---

# SENIORITY PT Re-Evaluation

Use the existing `seniority-pt-eval` skill for UltraHHC field mapping, browser safety, patient verification, staff autocomplete, physician selection, and unsigned-save requirements. The rules below override the evaluation workflow for re-evaluations.

## Goal timeframe rounding

When entering or updating goal timeframes in weeks, always use whole numbers. Round any partial week up to the next whole week (ceiling); never enter decimal weeks. For example, 26 days becomes 4 weeks. Apply this to calculated, copied, and clinician-provided fractional goal durations. Preserve actual calendar dates and the verified episode end; rounding a duration does not change those dates. This rule applies only to goal durations, not clinical measurements or numeric goal targets.

## Fast path

1. Read the open chart first and capture the exact chart name, patient ID/MR number, active episode, and re-evaluation visit date and time. Treat the chart spelling as canonical when the dictated name differs.
2. Search Gmail with the canonical chart name, then open the newest patient-specific re-evaluation update whose service date matches the visit. Extract only current findings, effective date, frequency, and named follow-up clinician.
3. Open or duplicate the relevant Evaluation Note and make one grouped update pass. Prefer targeted field reads and locators over repeated full-page snapshots.
4. Run the copied-note cleanup and pre-save audits below, save unsigned, and verify persistence once.
5. Create the unsigned PT REEVAL order only after the note is saved and the date, frequency, physician, episode, and staff are reconciled. Keep the saved re-evaluation open in its original tab. From the evaluation header, open the blue patient/MR link to the Patient record in a new tab in the same Chrome window, then use that new tab for the dedicated `Orders / Telephone Orders` workflow. Never navigate the re-evaluation tab away, return to Patient Chart View, or use its episode-tree `Order / Telephone Order` node to create a new order.

If an iframe snapshot is sparse but direct field access works, continue with targeted DOM queries. Use a screenshot only when visible dynamic UI, such as autocomplete suggestions, is absent from the semantic snapshot.

## Clinical source and dates

- Search Gmail by the patient name and read the newest clinician-sent re-evaluation or reassessment update.
- When the dictated name and chart name differ, search Gmail using the exact chart name rather than broad spelling guesses. Confirm the result with at least one additional identifier or the matching service date.
- Match the email's re-evaluation/service date before using any clinical content.
- Treat that matching service date as the performed assessment date throughout the workflow. Use it for note verification, Order Date, the dated Other title, the narrative assessment date, and the completion report; never substitute the email-sent date, note-edit date, or current date.
- A quoted older evaluation in the email thread is historical context only. Do not use its CLOF, gait, or level-of-function findings as current re-evaluation findings unless the newest dated message explicitly repeats or updates them.
- If the newest message supplies only the re-evaluation reason and frequency, do not invent or backfill a CLOF from the initial evaluation.
- Use the effective date and frequency from the newest dated update.
- If dictated diagnostic terminology conflicts with the verified chart history, use neutral symptom wording in the narrative rather than silently changing a diagnosis. Escalate only if the conflict affects safety, the plan, or the order.
- If the newest patient-specific email predates or does not match the current re-evaluation service date, do not silently reuse its effective date or frequency. Reconcile the signed note and current visit schedule, then obtain the clinician's confirmation before saving the order.

## Re-evaluation note rules

- Keep UltraHHC `Note Type` as `Evaluation Note`; do not switch it to reassessment or progress note.
- Change narrative references from evaluation/eval to re-evaluation/re-eval where clinically appropriate.
- Write the assessment/summary as a concise clinical narrative about progress, remaining deficits, functional impact, and continued skilled PT need. Do not repeat detailed CLOF such as gait distance, assistive device, or gait/transfer/bed-mobility assistance levels, vital measurements, visit frequency, or the plan effective date. Keep those details in their dedicated findings/frequency fields and the telephone order.
- Do not change patient findings unless the newest dated source or the clinician's current dictation supports the change.
- Treat first-person email wording such as `I will follow up` as the clinician retaining the patient. If the newest email does not explicitly name a different clinician who will follow up, check only `SN`, `PT`, and `MD` under Coordination of Care and leave `Other` blank and unchecked; do not add `PTA`.
- Enter `Monitor vitals and fall risk.` in Safety Precautions by default. Add other precautions only when the clinician or matched source explicitly provides them.
- Replace standard balance and speech defaults with current patient-specific findings. For example, chart dictated poor standing balance in the standing static/dynamic fields and chart dictated slowed speech in the Speech field instead of leaving `Unremarkable`.
- Never autonomously sign or submit the note.
- When the clinician explicitly requests signing the current note, finish the corrections and verification, click Save, then Review, and use only the signing credential provided in the current session. Verify the signed status. This is not standing authorization for future notes or orders; never store the signing credential in this skill.
- Before signing, read the re-evaluation start and end time from the note footer. Keep the signature date on the performed visit date and set the signature time within the documented visit interval. Unless the clinician explicitly provides another in-visit signing time, use five minutes before the visit end. Never leave UltraHHC's current-time default when it falls outside the visit. In UltraHHC's clock picker, adjust the hour with the hour arrows, then click the minute field (the second box), select its existing value, and type the two-digit minute directly; do not click the minute arrow repeatedly. Move focus out of the picker and verify the resulting `HH:MM` value before entering the PIN and signing. Verify the final displayed signature timestamp.
- If the clinician says the re-evaluation is already saved and signed, do not reopen or modify it; proceed directly to the order.

### Copied-note cleanup

#### Goal dates, vitals, and coordination preferences

- Confirm the active episode end in Visit Calendar. Replace the inherited nine-week goal default with the actual interval from the current plan's effective date to episode end. For week-based goal fields, divide the interval in days by 7 and always round up to a whole week; never use decimal weeks or round down to stay within episode end. Keep `Plan to` generic and undated; do not include episode-end dates, target dates, visit dates, or other calendar dates unless the clinician explicitly dictates one for the current note.
- Short-term bed-mobility and HEP goals are two weeks from that same effective date. Use the verified episode end as the long-term goal target date and enter its calculated duration in whole weeks rounded up. Preserve the performed assessment date separately from the plan effective date.
- Compare current dictated vitals with the clinician's most recent prior visit, including the initial evaluation when that was the last visit. Report identical components or a duplicated full set; never alter, randomize, or invent measurements merely to make visits differ. Retain current clinician-provided measurements unless corrected by the clinician.
- When a PTA is assigned to follow up, check Other under Coordination of Care With and enter exactly `PTA`, not the PTA's personal name. Keep SN, PT, and MD checked. If no PTA follow-up is supported, keep the existing rule to leave Other blank and unchecked.
- Use the current dictated subjective report, including caregiver presence, reported falls or absence of falls, and ongoing symptoms. Do not carry patient-specific subjective statements into unrelated visits as defaults. Keep the subjective paragraph together and end it with `Pt. is agreeable to therapy today.` When oxygen saturation is provided, put it on its own line immediately below the subjective paragraph, including the sourced room-air or oxygen-support status.

Treat every carried-forward value as historical until it is supported by the current dictation or matched source. In one pass, audit and update:

- Subjective/Other Findings, including caregiver report, current symptoms, and outstanding DME;
- every bed-mobility and transfer assistance field, not just the summary field;
- gait distance, device, assistance, pattern, weight-bearing status, progressive-gait field, and gait goal;
- current vitals and any copied orthostatic or positional-vital episode;
- equipment, safety precautions, frequency, coordination of care, goals, rehabilitation potential, assessment/summary, and response to treatment.

Remove old distances, assistance levels, vital signs, stair findings, and positional episodes unless the current visit repeats them. Rewrite both the assessment/summary and response to treatment so they describe the current patient response, progress, remaining deficits, and continued skilled need. Do not merely change `evaluation` to `re-evaluation` in copied prose.

Keep current gait findings separate from the gait goal. Current ambulation distance and Progressive Gait Training must match the current sourced CLOF. Unless the clinician explicitly provides a different patient-specific gait goal, carry the current assistive device into the goal and set the gait goal to `150 ft` with `SBA`, clearing conflicting assistance selections. Clinician-directed gait goals commonly range from `150 ft` to `300 ft`; use a different value in that range only when explicitly directed.

If a copied vital must be blank, focus the field, press `Control+A`, then `Backspace`, blur, and verify it is empty. A plain programmatic empty fill may not persist in UltraHHC.

For strength and ROM grouped audits, use element-agnostic selectors because current UltraHHC renders these controls as textareas even when older mappings describe inputs:

```text
[id^="dsl_"][id*="_strength_"]
[id^="dsl_"][id*="_rom_"]
```

Exclude IDs containing `goals`, `problem_list`, or `plan_of_care`. The current form normally exposes 48 strength and 48 ROM controls; if the count differs, inspect before bulk editing instead of assuming the mapping is safe.

### Note save proof

Accept a clear success message plus persisted values as proof. If no success message appears, reselect the exact dated PT visit node once and verify a compact representative set: vitals, all transfer/bed levels, gait distance/device/assist, frequency, assessment/summary, and response. Do not repeatedly reopen the note when that check passes.

## PT REEVAL telephone order

Create the order only after verifying the patient, episode, re-evaluation date, frequency, effective date, physician, and exact staff record.

In a new tab in the same Chrome window, use the Patient record's dedicated `Orders / Telephone Orders` link whose URL begins `/pto/physiciantelephoneorder.aspx?patientId=...&episodeId=...&patintakeId=...`. Verify those IDs identify the intended current episode. Keep the saved re-evaluation open and unchanged in its original tab. Do not use `Go to Patient Chart View`, and do not expand or select an `Order / Telephone Order` folder in the chart tree; that route displays printable existing records and is not the new-order station.

Use this fast entry order because UltraHHC validates the date when the order type changes:

1. Open `New Order / Telephone Order`.
2. Verify physician.
3. Populate only the first `Select RN/PT/Office Staff` box with the exact autocomplete record `NGO, JASON QUANG PT`. Leave the second `Select LVN/PTA/Field Staff` box blank unless the user explicitly instructs otherwise. Never select `Ngo - INTOUCH, Jason PT`, `NGO, JASON PT`, `BUI, DANIEL NGOC PT`, or any other similarly named clinician. Verify the first box displays exactly `NGO, JASON QUANG PT` and the second is blank before saving; plain typed text is not sufficient when the control expects an autocomplete selection.
4. Enter the re-evaluation Order Date and blur the field with Tab.
5. Enter Order Time as five minutes before the evaluation visit ended.
6. Select order type `Others`.
7. In the Other title field enter `PT REEVAL - M/D/YY`, replacing `M/D/YY` with the re-evaluation's performed visit date without leading zeros. For example, a re-evaluation performed on August 25, 2026 uses `PT REEVAL - 8/25/26`.
8. Leave `Reasons` blank unless the user explicitly dictates a reason.
9. Enter the order narrative.
10. Leave `Goal` blank unless the user explicitly dictates a goal.
11. Keep `ORDER READ BACK AND VERIFIED` checked.
12. Leave Sent and Received dates blank.
13. Save unsigned, reopen or verify the stored record once, and leave it open for the clinician.

Do not select `Others` before entering and blurring the Order Date. UltraHHC will show `Order Date cannot be empty` and reset the order type.

For reliable staff autocomplete, type a distinctive name stem, wait for suggestions, and click the exact matching `li[ng-click="handleSelection(item)"]` entry. If the suggestions are visible but missing from the snapshot, use a targeted DOM query or screenshot instead of broad page inspection. Verify both the visible selection and hidden `SelectedCarestaff1` value before saving. UltraHHC may display a saved name in a different order; the canonical stored staff record must still match exactly.

Outstanding DME belongs in the note's equipment/subjective narrative. Keep the re-evaluation order title in the exact format `PT REEVAL - M/D/YY`, using the performed visit date; do not convert it to an evaluation/DME-request order unless the clinician explicitly asks for a separate DME order.

If UltraHHC reports `Others order created successfully.`, shows the new Unsent row, and leaves that saved order editor open with its persisted values, use that editor as the required reopen verification. Do not click the row again merely to repeat the same check. If there is no success message, accept the new Unsent row only after matching its title, date/time, physician, and saved record link. If the editor resets a field or contradicts the row, reopen that row once and verify the persisted record.

### Default narrative opening

Use this opening unless the clinician dictates different wording:

`Physical therapy re-evaluation, home safety assessment, and DME assessment were completed. Patient received education on safety and fall prevention, home exercise program (HEP) instruction, and mobility training as tolerated. Education was also provided on goal planning, the updated physical therapy plan of care, and expectations with continued skilled home health PT. Patient is expected to benefit from continued skilled PT services to help achieve goals, return toward the prior level of function, and improve quality of life.`

Begin the narrative with `Physical therapy re-evaluation` so the completed service is explicit. Do not prefix the narrative with `PT REEVAL:`; keep the dated `PT REEVAL - M/D/YY` label in the Other title field.

Then append:

```text
Effective/Start Date: MM/DD/YYYY
Physical Therapy Frequency (including re-evaluation): [frequency]

Interventions:
[x] Bed Mobility Training
[x] Transfer Training
[x] Gait Training
[x] Therapeutic Exercise Training
[x] Therapeutic Activity Training
[x] CG/family Training
[x] Fall Prevention Training
[x] Balance Exercise Training
[x] Assistive Device/DME Training
[x] Manual Therapy/STM
[x] Modalities & Pain management Training
[x] Neuromuscular Re-Education
[ ] Edema Management Training
[ ] Pressure Ulcer Prevention Training
```

Change intervention selections only when the clinician's instructions require it.

## Save verification

Before and after save, verify:

- correct patient and episode;
- exact physician and staff;
- Order Date and Time;
- order type `Others`;
- title exactly `PT REEVAL - M/D/YY`, using the re-evaluation's performed visit date without leading zeros;
- Reason blank by default;
- narrative explicitly begins with the default `Physical therapy re-evaluation` opening;
- effective date and frequency match the newest dated email;
- Goal blank by default;
- read-back checked;
- order remains unsigned and Unsent.

When reopening is required, verify the saved editor heading is `Order: Others`, the title is `PT REEVAL - M/D/YY` with the correct performed visit date, the canonical staff selection is exact, date/time and narrative persisted, read-back remains checked, and Sent/Received tracking fields remain blank. The saved row and reopened record are authoritative when the post-save form has reset to blank defaults.

Success messages may say `Others order created successfully.` for a new order or `Others order updated successfully.` for an edit.

Leave the verified unsigned order open for the clinician and keep the saved re-evaluation open in its original tab. In the completion report, state the performed re-evaluation assessment date used in the note and order. If the clinician later says they signed it, treat the workflow as complete and do not reopen, edit, or sign anything unless explicitly asked.
