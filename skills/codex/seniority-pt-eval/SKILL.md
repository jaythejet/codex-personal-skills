---
name: seniority-pt-eval
description: Draft, review, and save SENIORITY Home Health physical-therapy evaluations in UltraHHC, then create and save the associated unsigned PT telephone order from patient-specific Gmail PDFs, clinician findings, CLOF, frequency, and effective dates. Use when the user asks to start, complete, review, autofill, or continue a SENIORITY PT evaluation or PT order. Never invent clinical data. Save notes unsigned by default; sign only with explicit current-session clinician authorization.
---

# SENIORITY PT Evaluation

Prepare a clinically faithful SENIORITY Home Health PT evaluation in the user's selected Chrome tab. Treat the clinician as the final decision-maker.

## Goal timeframe rounding

When entering or updating goal timeframes in weeks, always use whole numbers. Round any partial week up to the next whole week (ceiling); never enter decimal weeks. For example, 26 days becomes 4 weeks. Apply this to calculated, copied, and clinician-provided fractional goal durations. Preserve actual calendar dates and the verified episode end; rounding a duration does not change those dates. This rule applies only to goal durations, not clinical measurements or numeric goal targets.

## Record integrity

- Verify the patient with at least two identifiers across UltraHHC, Gmail, and the PDF, preferably full name plus DOB or MR number.
- Use only the matching email, its attachments, the current patient record, and clinician-provided findings.
- Never invent, estimate, normalize, or randomize age, diagnoses, medical history, vitals, assistance, distance, device, or interventions. The clinician-authorized standard defaults in this skill for prior function, strength, ROM, balance, pain, vision, hearing, speech, posture, ADL needs, cognition, endurance, goal timeframes, and next-visit wording are permitted unless patient-specific findings contradict them.
- Treat JavaScript template content as editable boilerplate, not patient evidence.
- Save the reviewed evaluation and PT telephone order as unsigned records by default. Sign the current evaluation only when the clinician explicitly authorizes it in the current session; this does not authorize signing the order or any future record. Stop with the order open for clinician signature.
- When signing is explicitly authorized, finish corrections and verification, click Save, then Review, and use only the signing credential provided in the current session. Read the visit start and end time from the note footer, keep the signature date on the performed visit date, and set the signature time within the documented visit interval. Unless the clinician explicitly provides another in-visit signing time, use five minutes before the visit end. Never leave UltraHHC's current-time default when it falls outside the visit. In UltraHHC's clock picker, adjust the hour with the hour arrows, then click the minute field (the second box), select its existing value, and type the two-digit minute directly; do not click the minute arrow repeatedly. Move focus out of the picker and verify the resulting `HH:MM` value before entering the PIN and signing. Verify the final displayed signature timestamp and never store the signing credential.

## Workflow

1. Inspect the active UltraHHC evaluation and retain the displayed patient name, MR number, visit date, episode, and the visit start/end time shown at the very bottom. Capture the ending time before leaving the evaluation because the telephone-order time is 5 minutes earlier.
2. Confirm the connected Gmail profile is the clinician-authorized mailbox.
3. Search Gmail using patient-name variants plus `has:attachment filename:pdf`. Prefer the agency's original incoming message for the medical-record PDF, and separately check the clinician's sent evaluation reply for the current level of function (CLOF), DME, evaluation date, frequency, and effective date.
4. Open the attached medical-record PDF and visually confirm that the patient name printed in the MR matches both the email subject/body and the active UltraHHC chart. Also require either DOB or MR number to match. Do not chart from an attachment based on the filename alone; stop when the match is uncertain.
5. Read the face sheet and the complete medical-record PDF. If a PDF is image-only, inspect the Gmail attachment's rendered page images directly when available; otherwise render/OCR every page. Visually verify every relevant page before charting.
6. Extract:
   - DOB and age on the evaluation visit date;
   - explicitly documented chronic diagnoses and pertinent surgical/device history;
   - reason for recent hospitalization and recent acute diagnoses;
   - home oxygen, precautions, assistive devices, and prior function when relevant.
   - the clinician's sent-email CLOF, DME, evaluation date, frequency, and effective date.
   - measured BP, pulse/heart rate, respiratory rate, temperature, and weight-bearing status.
   Ask one concise combined follow-up question for any missing required clinician values before entering the form.
7. Keep acute presentation separate from chronic history. Do not turn a suspected, possible, or ruled-out condition into history.
8. Deduplicate synonyms and abbreviations. Prefer readable clinical terms while preserving meaningful specificity:
   - `CHF` -> `congestive heart failure`;
   - `COPD` -> `COPD`;
   - `SSS s/p PPM` -> `sick sinus syndrome status post pacemaker`;
   - `Afib` -> `atrial fibrillation`;
   - `HTN` -> `hypertension`;
   - `VHD w/ moderate AS/AR` -> `valvular heart disease with moderate aortic stenosis/aortic regurgitation`.
9. Format Brief Medical Hx exactly as:

   `Hx of: item, item, item`

   Use one comma-separated line, no bullets or terminal period. Include only supported items.
10. Keep a separate internal note in the form `Age: N` for use in the clinical assessment. Calculate age from DOB as of the evaluation visit date, not today's date. Do not place age in Brief Medical Hx unless the clinician asks.
11. Before entering data, inspect the actual controls and IDs. Read `references/ultrahhc-field-map.md` and use its confirmed direct-entry path as the normal workflow. The evaluation controls are inside the single visit-note iframe. Use the legacy bookmarklet only when direct control is unavailable and browser policy permits it; never bypass browser security.
12. Enter only clinician-measured vitals. Require blood pressure, pulse/heart rate, respiratory rate, and temperature before the final save. Record oxygen saturation only in a dedicated oxygen-saturation field when the active form provides one; if it does not, do not put saturation or any other vital in Subjective or another unrelated field. If the clinician omits respiratory rate, ask for it instead of leaving it blank or inventing a value. Respect the form's displayed units and stop for clarification when a dictated temperature appears to use a different unit; never silently convert or copy a Celsius value into a Fahrenheit field.
13. Populate patient-specific facts first, then apply the authorized defaults once. Replace or clear every default that conflicts with the matched record or current findings. Audit diagnosis, prior function, strength, ROM, assistance, gait distance, device, gait pattern, cognition, endurance, pain, goals, interventions, frequency, assessment, coordination, and response text.
14. Enter the clinician's standard PT Diagnosis in this exact order: `Generalized weakness, unsteady gait, deconditioning, impaired functional mobility and balance`. Preserve a trailing comma only when the clinician explicitly requests it in the current form.
15. Always check the clinician's sent evaluation reply before finalizing functional fields. Treat its CLOF as current-visit documentation and map it exactly to bed mobility, transfers, and every related gait field, preserving assistance, distance, and device. In the `Distance in ft:` box, always enter the number followed by the unit `ft` (for example, `150 ft`), never the bare number. If one gait fact changes, update all duplicate occurrences such as ambulation distance, Progressive Gait Training, and gait goals. Do not substitute template defaults.
   - Keep current gait findings and the gait goal distinct. Current ambulation distance and Progressive Gait Training must reflect the sourced CLOF.
   - When the clinician does not provide a patient-specific gait goal, use the clinician-authorized default goal of `150 ft` with `SBA`, carrying the current assistive device into the goal. Typical clinician-directed gait goals range from `150 ft` to `300 ft`; use a different value in that range only when the clinician explicitly directs it.
16. Enter `FWB` as the clinician-authorized default weight-bearing status unless the clinician or patient-specific source records specify a different status or restriction. Apply the documented exception; do not ask solely because weight-bearing status was omitted from dictation.
17. Enter `Freq of Visit` exactly as written in the clinician's sent email, including the effective date. Do not calculate or populate total treatments or duration unless the clinician asks or the source states them.
18. For every patient, populate `Brief Medical Hx` from the matched face sheet and complete MR PDF before considering the evaluation ready. Never leave it blank when the matched documents contain supported history. Format it using step 9 and keep recent acute hospitalization details separate from chronic history.
19. Put only the clinician's dictated subjective narrative in `Other Findings`. Begin it exactly with `Subjective: `, lightly edit it into concise clinical prose without adding facts, and end it exactly with `Pt. is agreeable to therapy today.` Keep vital signs, including oxygen saturation, in their dedicated vital fields; never include them in `Subjective`.
20. Enter cognition as `A&O x3, forgetful` for the clinician's standard workflow unless patient-specific findings contradict it.
21. Use these clinician-authorized defaults for every patient unless the clinician provides different patient-specific findings:
   - `Prior Functional Level`: `Needs assistance with ADLs and functional mobility`.
   - Every muscle-strength field: `3+/5`.
   - Every ROM field: `WFL`.
   - Balance: `Fair+` sitting static, `Fair` sitting dynamic, `Fair` standing static, and `Fair-` standing dynamic.
   - Pain location: `Denies pain at this time`.
   - Vision, hearing, and speech: `Unremarkable`.
   - Posture: `Mild kyphosis, forward head posture, rounded shoulders`.
   - ADL Needs: `Requires assistance with ADLs`.
   - Safety Precautions: `Monitor vitals and fall risk.`
   - Rehab Potential: check `Fair`; leave `Good` unchecked.
   - PT/Caregiver Response to Tx: `Pt. and CG tolerated treatment well. Pt. remained asymptomatic with no adverse signs observed. Pt. and CG verbalized understanding of HEP, safety precautions, and PT POC. Agency and MD made aware. Will continue with established POC.`
   - Short-term goal timeframes: `2` weeks.
   - Long-term goal timeframes: `9` weeks.
   - `Next Visit on`: `Next visit as scheduled.`
   - Keep `Plan to` generic and undated. Do not include episode-end dates, target dates, visit dates, or other calendar dates in that field unless the clinician explicitly dictates a date for the current note.
   - HEP problem list: check both `H.E.P.` and `None`, leaving `Poor` unchecked unless the clinician explicitly directs otherwise. Keep the independent-HEP goal and its 2-week timeframe.
   - Complete applicable Plan of Care sections with the generic wording in `references/ultrahhc-field-map.md`, including B11 Muscle Reeducation and B12 Evaluation of PT Careplan. Describe planned care without inventing completed treatment, repetitions, or dosage.
   - `Skilled Intervention Provided @ This Visit` uses the generic wording in the field map. Do not personalize this field with diagnoses, devices, gait distance/assistance, pain location/rating, fatigue, or response details; place those details in their dedicated findings and response fields. Omit any generic intervention explicitly contradicted by the clinician's account.
   Replace any default that conflicts with the clinician's current findings.
22. In the Decreased Muscle Strength goal, enter `BLE` in `Increase Muscle Strength on` and `+0.5/5 MMT to baseline` in the `to Grade` field. Use `BLE` in all caps unless the clinician explicitly specifies a different body region.
23. Treat bed-mobility and HEP goals as short-term goals and enter `2` weeks. Treat gait, transfer, strength, ROM, endurance, balance, posture, and other restorative goals as long-term goals and enter `9` weeks, unless the clinician explicitly specifies a different timeframe.
24. In Progressive Gait Training, use `[device] / [distance] ft / [assist] at time of evaluation`, populated from the clinician's sent CLOF.
25. In Gait Pattern, omit `shuffling gait` and include `decreased foot clearance`. Use `Slow gait with decreased step length and width, decreased foot clearance, mild forward trunk lean` for the standard template unless current findings require different wording.
26. For every patient, prepend one short personalized sentence to the assessment before the standard boilerplate. Start it exactly with `Pt. is [age] years old` and continue with supported sex, pertinent history, and the recent hospitalization reason or acute diagnoses. Do not leave the assessment as boilerplate-only when the matched PDF supports personalization. Do not include a detailed CLOF sentence listing assistance, gait distance, or device in the assessment opening. Then append this clinician-approved boilerplate verbatim:

   `Pt presents with PMH consist with gross strength deficit, poor activity tolerance, forgetfulness, impaired balance leading to high fall risk. Pt is limited with functional mobility relating to bed mobility, transfers, and gait and will benefit from skilled HH PT. Pt is seen for PT initial evaluation and receives training in HEP, fall safety prevention, education on pain management, and education on PT POC/goal planning to improve functional status and return to PLOF. Ther-ex performed during visit consist of sit<>stand, gait training, and postural mms strength/endurance training in order decrease fall risk. Pt is a good candidate for skilled HH PT to and will benefit from skilled HH PT to improve overall strength, functional mobility, home safety, and fall prevention with in-home mobility and ADLs.`

27. Under `Coordination of Care With`, always check `SN`, `PT`, and `MD`. Treat the clinician's first-person wording such as `I will follow up` as the clinician retaining the patient. If the newest email does not explicitly name another clinician who will follow up, leave `Other` unchecked and its text blank; do not add `PTA`. Check `Other` and enter the supported role or name only when the newest email explicitly assigns a different clinician to follow up. Preserve any other supported coordination selections.
28. Run the one-pass pre-save audit in `references/ultrahhc-field-map.md`. Review identity, DOB, age-on-visit-date, evaluation start/end time, Brief Medical Hx, the `Pt. is [age] years old` assessment opening, all four vital signs, WB Status, `ft` in gait distance, CLOF duplicates, goal assistance and balance target, `BLE` strengthening target, Fair rehab potential, SN/PT/MD coordination plus any explicitly assigned follow-up clinician, safety precautions, frequency, goal timeframes, next visit, and unsupported template claims.
29. After the final audit passes, click `Save` on the evaluation. Leave it unsigned unless the clinician explicitly authorizes signing in the current session. Confirm the save completed before leaving the evaluation or beginning the authorized Review-and-Sign flow.
30. Keep the saved evaluation open in its original tab and continue immediately to the PT telephone-order workflow in `references/pt-order-workflow.md` in a new tab in the same Chrome window. Create and save the matching unsigned order, then stop with both the saved evaluation tab and the order tab open for the clinician. Do not click any electronic-signature control.
31. When the clinician reports that the evaluation and order have been signed or completed, do not reopen or modify them unless the clinician explicitly requests another chart change.

## Efficient entry

- For follow-up corrections, read only the affected fields and reference section; reuse the verified identity, source extraction, and browser handles. Do not restart the evaluation workflow.
- Search the incoming referral and sent reply in parallel with focused patient-name subject queries and an episode-appropriate date range. Fetch only matching attachments, and retain their extraction for the whole task.
- Build one patient-specific entry map, fill in logical groups, and run one targeted final audit. After a successful save or one persistence check, move on; do not repeat equivalent checks.
- Use `FWB` unless a patient-specific exception is supplied. A list of current DME is inventory, not an order request; do not create a DME request without evidence that equipment is needed.
- Keep Reasons and Goal blank in the PT telephone order. Enter goals in the evaluation only; use the approved narrative in the order's Orders field.
- Perform identity, Gmail, and PDF reads independently when possible, then reconcile identifiers before charting.
- When an email body contains an MR-number typo but the chart, attached face sheet, patient name, and DOB agree, treat the email MR as a clerical typo and continue with the verified chart/face-sheet identity. Stop if the chart or attachment identifiers conflict.
- Claim the selected chart once and reuse it. The evaluation controls are inside the single visit-note iframe.
- Use the direct field map to populate patient-specific facts first, then apply grouped defaults once. Fill all 48 strength fields as one verified group and all 48 ROM fields as one verified group.
- Use one targeted read to collect the pre-save checklist values, then change only mismatches. Avoid checking each control through separate browser calls.
- Verify grouped strength and ROM fields by exception: confirm the expected count and report only mismatches.
- Avoid repeated full-page snapshots after the evaluation iframe and selectors are confirmed. Use targeted reads for values and checked states.
- After saving, require either the authoritative success message or a reopen-and-persist check. Values remaining in the still-open form alone do not prove the save succeeded.
- Reuse already verified patient identifiers and extracted source facts during follow-up corrections in the same thread. Do not repeat Gmail/PDF extraction unless the patient, episode, source, or material facts changed.
- Preserve the verified patient ID, episode ID, intake ID, evaluation date, evaluation visit start/end time, frequency, and effective date when moving from the evaluation to its order. Set the telephone-order time to 5 minutes before the documented evaluation ending time.
- To reach the order station without leaving the evaluation, open the blue patient name/MR link from the evaluation's top-left header in a new tab in the same Chrome window, then verify the same patient there. Keep the evaluation tab unchanged and open. If the header link is unavailable, read the destination of top-right `Patient` -> `Search for Patients` from the evaluation tab and open that destination in the new tab.
- In every SENIORITY order, use only the first `Select RN/PT/Office Staff` box: search with native keystrokes and select the exact autocomplete record `NGO, JASON QUANG PT`. Leave the second `Select LVN/PTA/Field Staff` box blank unless the user explicitly instructs otherwise. Never select `Ngo - INTOUCH, Jason PT`, `NGO, JASON PT`, `BUI, DANIEL NGOC PT`, or any other similarly named clinician. Before saving, verify the first box visibly displays exactly `NGO, JASON QUANG PT`, the second box is blank, and the stored care-staff identity corresponds to that exact record. Plain typed or pasted text is not a valid selection when the control requires an autocomplete choice.
- If the staff autocomplete does not open after its debounce, remove and retype the final character, wait briefly, and select the visible `QUANG` suggestion. Do not rely on hidden suggestion text.
- Enter the order date with keystrokes and press `Tab` before selecting the order type; UltraHHC's date formatter may clear a programmatically filled date on blur.
- Preserve the order narrative's exact multiline layout from `references/pt-order-workflow.md`: blank lines before the date/frequency and interventions, with one intervention per line. Append the evaluation's performed visit date to every order title in `M/D/YY` format. When a clinician message explicitly requests new DME, use `PT EVAL & DME REQUEST - M/D/YY` and append the sourced DME request block immediately below Pressure Ulcer Prevention Training. Otherwise use `PT EVAL - M/D/YY`. For example, an evaluation performed on August 25, 2026 uses `PT EVAL - 8/25/26`.

## Source precedence

Use this order when sources conflict:

1. Clinician's current-visit findings and explicit corrections.
2. Signed physician history/discharge documentation in the matching medical-record PDF.
3. Face sheet for identity and DOB.
4. Hospital PT/OT notes for historical context only.
5. Email body for scheduling, frequency, and agency instructions.
6. JavaScript template only for field mapping and generic structure.

Flag material conflicts instead of silently choosing a value.

## Legacy bookmarklet cautions

- The supplied baseline bookmarklet is stored at `assets/seniority-sba-template-bookmarklet.txt`. Read it completely before using it.
- Prefer the direct-entry field map. Use the bookmarklet only as a fallback when direct entry is unavailable and browser policy permits it.
- The bookmarklet fills many patient-specific-looking defaults, including assistance levels, strength, ROM, gait, cognition, endurance, pain, and interventions. Audit, replace, or remove each unsupported value.
- Its randomized vital defaults are not clinical measurements and must never be charted; enter measured vitals in the modal or cancel.
- Its final alert says to click Save. Treat that text as template output only, not authorization.
- Preserve the native event-dispatch approach only when browser control requires it; verify every populated control in the visible form afterward.
- Do not rely on a successful alert count as proof that the correct patient or values were entered.

## Example extraction

Source facts: DOB 02/02/1929; evaluation 07/17/2026; documented CHF, COPD, sick sinus syndrome with pacemaker, atrial fibrillation, hypertension, hypothyroidism, dementia, and valvular heart disease with moderate AS/AR.

Output:

`Hx of: congestive heart failure, COPD, sick sinus syndrome status post pacemaker, atrial fibrillation, hypertension, hypothyroidism, dementia, valvular heart disease with moderate aortic stenosis/aortic regurgitation`

Internal note:

`Age: 97`
