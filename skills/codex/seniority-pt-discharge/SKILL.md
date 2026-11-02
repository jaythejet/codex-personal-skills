---
name: seniority-pt-discharge
description: Draft, review, and save unsigned SENIORITY Home Health physical-therapy discharge notes in UltraHHC using the initial evaluation, later reassessments, and the latest matching PT visit, then create the associated unsigned PT discharge telephone order. Use when the user asks for a SENIORITY PT discharge, discharge visit, discharge note, agency discharge, PT discipline discharge, or discharge order. Never invent clinical findings or sign, submit, certify, or attest.
---

# SENIORITY PT Discharge

Prepare a clinically faithful Physical Therapy Discharge Note in the user's selected UltraHHC patient chart. Treat the clinician as the final decision-maker.

## Goal timeframe rounding

When entering or updating goal timeframes in weeks, always use whole numbers. Round any partial week up to the next whole week (ceiling); never enter decimal weeks. For example, 26 days becomes 4 weeks. Apply this to calculated, copied, and clinician-provided fractional goal durations. Preserve actual calendar dates and the verified episode end; rounding a duration does not change those dates. This rule applies only to goal durations, not clinical measurements or numeric goal targets.

## Record integrity

- Verify the same patient and active episode using the chart name plus MR number or DOB before editing.
- Confirm that the pending visit is a `PT DISCHARGE` visit and retain its performed date and time.
- Use the performed discharge visit date in dedicated date fields and the order, with `MM/DD/YYYY` in fields and `M/D/YY` without leading zeros in the Other-order title. Omit evaluation and discharge dates from the note's status, treatment and summary narratives. Never substitute an email date, note-edit date, or current date.
- Use the clinician's current dictation first, then the matching discharge visit, latest PT progress note, latest PT re-evaluation, and actual initial PT evaluation. For the initial-status section, locate the original evaluation across prior episodes of the same admission when needed; do not substitute an early PTA progress note or a reassessment for the initial evaluation.
- Treat JavaScript/bookmarklet text as field mapping and editable structure, not patient evidence.
- Never infer that goals were met, maximal potential was reached, no further care is needed, outpatient rehabilitation is planned, or a specific disposition applies merely because a discharge visit exists.
- Draft and save the note unsigned. Never electronically sign, submit, certify, attest, or finalize it.

## Workflow

1. Inspect the open chart and capture patient name, MR number, DOB, active episode, discharge date, and visit time. Stop if the chart identity or episode is uncertain.
2. Read the episode-opening PT evaluation for diagnosis, baseline functional mobility, assistance, device, distance, balance, strength, endurance, safety deficits, goals, and planned interventions.
3. Read the newest matching PT re-evaluation and the latest signed PT progress note before discharge. Prefer the newest current findings, but do not turn a copied or historical statement into a discharge finding.
4. If the user supplied current discharge findings, use them even when they differ from the prior note. Flag material contradictions instead of silently resolving them.
5. Open the pending PT discharge note and verify `Note Type: Discharge Note`, `Status: In Progress`, patient identity, discharge date, and visit time.
6. Fill the note in one grouped pass, then run the audit below. Save the internally consistent note unsigned; saving is part of the requested discharge workflow, but never click an electronic-signature, review, submit, or certification control.
7. After the note saves successfully, keep it open in its original tab and create and save the matching unsigned PT discharge telephone order in a new tab in the same Chrome window using the hardlined navigation and order workflow below. If the user asks to see the note before moving on, leave the saved note open and wait for their instruction. For an in-place correction, stay on the current note rather than navigating to orders.

## Preferred discharge writing style

- Write concise clinical statements directly. Do not add `per clinician report`, `by clinician`, or `to be confirmed by clinician` to note prose.
- Avoid source-label wording such as `Latest PTA note` or `Latest documented` in status entries and orders. Use clinician-confirmed current function directly; if only historical evidence is available, clarify current status in chat rather than silently presenting historical findings as newly measured.
- When the clinician reports improvement with residual limitation, state both, for example `Endurance improved but remains poor.` Do not assume improvement without supporting findings or dictation. Assistance levels and distances are patient-specific, never reusable defaults.
- Keep the discharge order generic: discharge assessment activities performed, education re-emphasized, and the stated discharge reason/goal status. Avoid a PTA-source reference or detailed functional-status recap unless requested. Include only confirmed discharge-day activities; therapeutic exercise is not automatic.
- Keep exactly six short status entries. Initial status describes baseline limitations; discharge status describes current function. Avoid long histories, repeated caveats, and bare `goals met` entries when specific supported function is available.
- Use the dictated assistance level exactly: for example, `Mod Indep with bed mobility`, `Mod Indep with transfers`, and `Ambulates [distance] ft with [device] and [assistance].` Distances, devices and assistance are patient-specific, never defaults. A correction to gait assistance does not change its distance or device.
- Read the actual evaluation/re-evaluation goals before writing strength, balance and endurance status. When all goals are explicitly reported met, a concise goal-based statement may name the documented target: `BLE strength goal of MMT [target] met.` This is not a newly measured MMT. Do not manufacture individual muscle grades or copy another patient's target. Use actual discharge measurements when supplied.
- Keep the summary generic in style while using interventions supported by that episode. Omit names, dates, detailed progress comparisons and historical deficits. Example when supported: `Skilled PT services included therapeutic exercise, gait training, transfer and bed mobility training, balance training, HEP instruction, and safety/fall prevention education. All PT goals met. Discharge from skilled PT services with continuation of established HEP.`
- Treatment rendered should describe discharge-day care, not drafting or chart review. When supported by current dictation, use: `Therapeutic exercise, final assessment of functional mobility and goal status, HEP review, and discharge instruction on fall prevention, safe use of [device], pacing, and continued home exercise. Discharge from skilled PT services.` Include only performed services; this example is not evidence that they occurred.

## Field rules

- `Diagnosis`: carry forward the supported PT diagnosis from the evaluation or latest re-evaluation; lightly normalize grammar without adding diagnoses.
- `Treatment Rendered on day of discharge`: document only services actually performed or explicitly dictated for the discharge visit. If no separate discharge findings exist, use conservative assessment/education wording and avoid claiming that a treatment was performed merely because it was common earlier in the episode.
- Include therapeutic exercise in the discharge-day treatment and order only when the clinician or current discharge documentation states that it was performed.
- `Reason for Discharge`: when the user states all PT goals are met, check both `No further care needed` and `Other (specify)`, enter exactly `All PT goals met.`, select goals attained `Yes`, and enter `N/A` for goals not reached. No further care refers to skilled PT, not all agency disciplines. For other discharge reasons, select only supported options. Do not automatically check `Transfer to OP Rehab`. If the reason is missing, use `Discharge reason not documented.` and identify the missing information in chat.
- `Status of Patient on Initial Evaluation`: summarize six supported baseline limitations from the episode-opening evaluation. Prefer concrete assistance, distance/device, balance, strength, endurance, and safety findings over generic problem-list language.
- `Status of Patient at Discharge`: summarize six current findings from the latest matching source. Preserve exact assistance, gait distance, device, balance, strength, endurance, and safety status. Do not claim independence, goal attainment, or caregiver competence unless documented.
- `Summary of Care Provided`: synthesize interventions actually documented across the episode, such as therapeutic exercise, gait training, transfer or bed-mobility training, balance training, functional mobility, HEP, fall-prevention education, and patient/caregiver education.
- `Treatment goals attained`: choose `Yes`, `No`, or `Partially` only from documented goal status or clinician instruction. If the evidence shows improvement with remaining deficits but no explicit goal-status statement, select `Partially` and briefly explain the remaining deficits.
- `Reason for not reaching goals`: use `N/A` only when `Yes` is supported. For `Partially` or `No`, state the supported remaining limitations without blame or speculation.
- `Discharge plan`: check `Home with MD supervision` only when supported by the plan. Use `Other` only for an explicitly supported follow-up plan. Do not invent outpatient rehabilitation, hospice, SNF, hospital, or other disposition.
- `Therapist Name/Signature`: enter the clinician's typed name only when this field is plain note content and the user has asked to fill the note. A typed name is not permission to click an electronic-signature control.
- Preserve the scheduled discharge date and visit time shown by UltraHHC unless the clinician corrects them.

## Comparison discipline

- Compare like with like: bed mobility to bed mobility, transfers to transfers, and gait distance/device/assistance to the same fields.
- A longer gait distance or less restrictive device supports improvement, but it does not prove independence, normal balance, full endurance, or complete goal attainment.
- Preserve continuing deficits unless newer discharge findings supersede them. Do not retain historical limitations as current findings after the user supplies updated function. Flag a material mismatch between current findings and a goal target briefly in chat; do not silently upgrade assistance to fit an all-goals-met statement.
- Do not convert `SBA` to supervision or independence unless the current source does so. Preserve `SUP`, `SBA`, `CGA`, and other assistance terms exactly.
- If current strength or balance measurements are missing, distinguish reported attainment of a documented goal from a fresh measurement. Do not claim a formal reassessment was or was not performed without evidence, or manufacture a better grade.

## Confirmed UltraHHC controls

The discharge form is inside the visit-note iframe. Prefer label-based control first; use these current IDs when direct label control is ambiguous:

- `dsl_diagnosis`
- `dsl_treatment_rendered`
- reason checkboxes: `dsl_reason_dc_*`; other text: `dsl_reason_dc_other_field`
- initial status: `dsl_initial_eval_stat_pt_1` through `_6`
- discharge status: `dsl_dc_stat_for_pt_1` through `_6`
- summary: `dsl_summary_care_provided`
- goal status: `dsl_treatment_goals_attained_yes`, `_no`, `_partially`
- reason not reached: `dsl_reason_not_reaching_goals`
- plan: `dsl_dc_plan_home_md_supervision`, `dsl_dc_plan_other`, `dsl_dc_plan_other_field`
- therapist: `dsl_therapist_signature`
- date/time: inspect the live form; observed fields include `dsl_patient_dc_date`, `dsl_therapist_signature_date`, `dsl_time_in`, `dsl_time_out`

If an ID is absent, inspect the rendered label and control rather than guessing a replacement. Use ordinary form filling/checking so the site's input and change events fire. After the final edit, press `Tab` to blur the field, inspect the changed values, then save in a separate action. Verify values after the save finishes: a successful fill or Save click alone does not prove persistence. If fields revert, reapply the affected edits, blur, and verify again before proceeding.

## Pre-save audit

- Patient name, MR number, DOB, episode, discharge date, and visit time match.
- Diagnosis is supported.
- Day-of-discharge treatment is not copied from prior visits as though newly performed.
- Exactly six initial and six discharge findings are populated, with no unsupported assistance, device, distance, strength, balance, or endurance claims.
- Reason for discharge and disposition are supported; unrelated reason boxes are unchecked.
- Goal-status selection agrees with the narrative and reason-not-reached field.
- Summary reflects documented care across the episode.
- Typed therapist name, if entered, is correct, and the record remains unsigned.

After saving, accept an authoritative success message or reopen the exact dated visit once and verify persisted identity, diagnosis, reason, the twelve status entries, summary, goal status, plan, date, and time. Do not sign the note.

## Hardlined order navigation

After the discharge note saves, use this route every time:

1. Keep the saved discharge note open and unchanged in its original tab. Read the destination of the blue patient name/MR link in the note's top-left chart header, for example `[MR number] - [LAST NAME], [FIRST NAME]`, and open that destination in a new tab in the same Chrome window.
2. In the new tab, verify the Patient record shows the same MR number, name, DOB, and active episode.
3. In that same new tab, open the Patient record's dedicated `Orders / Telephone Orders` link whose URL begins `/pto/physiciantelephoneorder.aspx?patientId=...&episodeId=...&patintakeId=...`.
4. Verify the URL IDs and selected episode match the discharge note.
5. Click `New Order / Telephone Order`.

Never use `Go to Patient Chart View` or the chart tree's `Order / Telephone Order` node to create a new order. Those routes show chart records rather than the dedicated new-order station.

## PT discharge telephone order

1. Preserve the patient's selected primary physician.
2. Populate only the first `Select RN/PT/Office Staff` box: search with native keystrokes and select the exact autocomplete record `NGO, JASON QUANG PT`. Leave the second `Select LVN/PTA/Field Staff` box blank unless the user explicitly instructs otherwise. Never select `Ngo - INTOUCH, Jason PT`, `NGO, JASON PT`, `BUI, DANIEL NGOC PT`, or any other similarly named clinician. Verify the first box visibly displays exactly `NGO, JASON QUANG PT`, the second box is blank, and the stored care-staff identity is correct before saving.
3. Enter the discharge visit date in `Order Date` with keystrokes and press `Tab` so UltraHHC's date formatter retains it.
4. Enter order time as five minutes before the discharge visit ended.
5. Only after the date is entered and blurred, select order type `Others`; selecting it earlier causes `Order Date cannot be empty` and resets the type.
6. Enter `PT DISCHARGE - M/D/YY` in the Other title field, replacing `M/D/YY` with the performed discharge assessment date without leading zeros. For example, a discharge performed on August 25, 2026 uses `PT DISCHARGE - 8/25/26`.
7. Leave `Reasons` and `Goal` blank unless the clinician dictates content for them.
8. Enter this narrative, adapting only facts explicitly supplied for the current patient:

```text
Physical Therapy Discharge Visit Completed
Discharge Date: MM/DD/YYYY

Discharge Order:
[x] Discharge from skilled home health physical therapy services.

Reason for Discharge:
[x] All PT goals met; no further skilled PT care needed.

Final assessment completed including gait, transfers, balance, strength, and functional mobility. [Include therapeutic exercise here only when performed.] HEP, fall prevention, safety awareness, and discharge recommendations were reviewed with patient/caregiver. Patient to continue HEP as instructed and follow up with physician as needed.
```

Replace the reason when the clinician documents a different discharge basis. Goals met is not an automatic default, and does not by itself establish maximal functional potential.

9. Keep `ORDER READ BACK AND VERIFIED` checked. Leave Sent and Received tracking dates blank.
10. Save the order unsigned. Do not click `Electronically Sign For CareStaff`, fax, send, or otherwise transmit it.
11. Accept `Others order created successfully.` plus the saved editor as verification. Confirm the editor shows the same patient and episode, physician, exact staff, date, time, `Order: Others`, title `PT DISCHARGE - M/D/YY` with the performed discharge assessment date, narrative, blank Reasons/Goal, checked read-back, and unsigned/Unsent status. Leave the saved unsigned order open for clinician review and signature, and keep the saved discharge note open in its original tab.

In the completion report, state the performed discharge assessment date used in both the note and the dated order title.

## Conservative draft when evidence is incomplete

Fill supported fields without inventing measurements. If a needed current finding is absent, use a short factual placeholder such as `Discharge MMT not documented.` and identify the missing item in chat; avoid repetitive third-person disclaimers in the note. A clearly attributed historical value may be used when necessary, but do not turn it into a current finding. If the missing item controls a consequential checkbox (discharge reason, goal attainment, or disposition), leave it unselected when UltraHHC allows that and tell the user what remains to be chosen.
