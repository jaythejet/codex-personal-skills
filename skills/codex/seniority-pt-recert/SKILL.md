---
name: seniority-pt-recert
description: Update and save unsigned SENIORITY Home Health OASIS PT recertification records in UltraHHC by reviewing the immediately prior episode's OASIS SOC or OASIS RECERT, carrying forward only relevant PT data into the current episode's OASIS RECERT without deleting or overwriting existing content, and changing the completing clinician to Jason Quang Ngo, PT. Use when the user says SENIORITY recert, PT recert, OASIS recertification, continue PT into a new episode, or carry the prior OASIS into RECERT. Never invent clinical data or sign, submit, lock, validate, certify, or attest.
---

# SENIORITY PT Recertification

Work in the patient's open UltraHHC chart. The source and destination are OASIS forms, not Visit Notes. Preserve every value already present in the current OASIS RECERT unless the user explicitly asks to replace it or the discipline/completing-clinician fields must be changed to PT and Jason Quang Ngo, PT.

## Goal timeframe rounding

When entering or updating goal timeframes in weeks, always use whole numbers. Round any partial week up to the next whole week (ceiling); never enter decimal weeks. For example, 26 days becomes 4 weeks. Apply this to calculated, copied, and clinician-provided fractional goal durations. Preserve actual calendar dates and the verified episode end; rounding a duration does not change those dates. This rule applies only to goal durations, not clinical measurements or numeric goal targets.

## Workflow

1. Verify the chart name, patient/MR number, current recert episode dates, immediately preceding episode dates, and the current OASIS RECERT assessment date when displayed (including M0090 when populated). Stop if the episodes are not contiguous or the patient identity is uncertain.
2. Determine the source dynamically from the immediately preceding contiguous episode. For the first recertification, use that episode's OASIS SOC. For a later recertification, use the immediately prior OASIS RECERT. Never jump back to the original SOC when a newer contiguous RECERT is the correct source. Do not use a PT re-evaluation or PT Recertification Visit Note as the primary source.
3. Memorize/capture the prior OASIS responses that are relevant to PT recertification, especially functional status, GG functional abilities/goals, health conditions, active diagnoses, safety, mobility, transfers, ambulation/device use, and other PT-relevant supplemental fields. Consult Visit Notes only when the user asks or an OASIS response needs clarification.
4. Open the current episode's OASIS RECERT and inventory all populated fields before changing anything.
5. Add only relevant PT information into blank fields or append it to compatible existing narratives. Do not clear, shorten, replace, or normalize current RECERT content merely because it differs from the prior episode.
6. Treat prior-episode values as historical. Do not present old vitals, pain, distances, assistance levels, or goals as current findings unless the current RECERT or a dated current source confirms them. Phrase historical material as prior status or progress context.
7. Avoid duplication. If equivalent information already exists in the RECERT, leave it unchanged.
8. Set M0080 Discipline of Person Completing Assessment to `2. PT`. Change Care Staff Name to the exact autocomplete record `NGO, JASON QUANG PT`. Never select `Ngo - INTOUCH, Jason PT`, `NGO, JASON PT`, `BUI, DANIEL NGOC PT`, or any other similarly named clinician. Verify both the displayed selection and stored staff identity when the page exposes them. If this workflow leads to a SENIORITY order, populate only the first `Select RN/PT/Office Staff` box with the exact `NGO, JASON QUANG PT` record; leave the second `Select LVN/PTA/Field Staff` box blank unless the user explicitly instructs otherwise, and verify both conditions before saving.
9. Save only as an unlocked, unsigned draft. Never validate, lock, sign, submit, certify, attest, or finalize.
10. Reopen or reselect the RECERT once and verify that existing content remains, added PT content persisted, the correct episode is active, and Jason Quang Ngo, PT is selected.

When the clinician requests email verification, read the latest patient-specific approval/update and match patient identity and service date before using its frequency, effective date, reason or follow-up clinician. Do not assume that reading the prior OASIS includes an email check. If a separate re-evaluation note is requested, finish and save the RECERT review first, then use `seniority-pt-reeval` in a separate tab in the same Chrome window. Preserve any already-open re-evaluation draft rather than creating a duplicate. Keep the OASIS assessment date distinct from the visit date and reconcile conflicts with the clinician.

## User charting conventions

For SENIORITY PT recerts, apply these user-directed defaults unless the user or current patient-specific documentation indicates otherwise. If there is a conflict, preserve the current finding and report it instead of forcing the default.

- Mark the COVID-19 symptom screening `No` and select the accompanying infection-precaution-guidelines checkbox.
- Under Safety Measures, select `Fall precautions`.
- In the head-to-toe review, select `No Problem` for EYES, NOSE, MOUTH, and THROAT.
- Before finishing, compare the prior OASIS with the current RECERT for missing stable administrative information such as emergency-contact details and priority code, and carry forward compatible missing values.
- Complete the PT-relevant G and GG fields from current findings. Use the prior OASIS to identify omissions, but do not copy old measurements over current gait, transfer, bed-mobility, assistance, device, pain, or vital-sign findings.
- Unless current patient-specific documentation differs, enter BP as left arm/sitting, pulse as brachial, and respirations at rest. Use temporal temperature when that option exists unless the clinician directs another route. Select the FWB checkbox unless the clinician documents a different weight-bearing status; leave the extremity comment blank rather than adding `BLE: FWB`.
- In G, complete the MAHC fall-risk assessment by carrying forward still-applicable source risks and reconciling them with current pain, falls, cognition, mobility, and environment. Recalculate the total; do not copy the old total without auditing its components.
- When the clinician requests the standard mental-status entry, document an oriented, cooperative, mildly forgetful patient who follows commands, with no acute mental-status change, unless current findings conflict.
- Complete Functional Independence with current assistance and show supported improvement from the source OASIS. For the clinician's standard balance pattern, use Static Sitting `Good`, Dynamic Sitting `Fair`, and Dynamic Standing `Poor`; do not assume Static Standing unless the clinician or current functional assistance supports it.
- When requested, use concise generic PT findings for muscle tone, posture, and endurance that remain compatible with the patient's diagnoses and current function.
- Keep endurance concise, for example `Reduced endurance; needs rest breaks.` when supported.
- Write G neuro/musculoskeletal findings as direct clinical prose, without prefacing them with `clinician reports`. Select the matching Changes since last assessment and Disease Management Problems checkboxes when their narratives apply.
- Audit the entire PT-related G section, including the assistance checkbox grids, mental status, neuro/musculoskeletal, fall risk, functional independence, transfer assessment, gait, weight-bearing/device, balance, HHA indications and overall functional status. A narrative does not replace its corresponding checkbox. Select only the mutually consistent choices supported by the current findings; do not infer a task-specific assistance grade from a broad OASIS category.
- For tasks identified as not tested, such as floor and auto transfers, use `NT` in the assist-score field and omit explanatory filler. Leave WC Skills scores and comments blank unless the clinician provides wheelchair-skill findings. Do not use `not documented`, `exact assist level not specified`, or similar placeholder prose.
- Enter the clinician-provided Tinetti score in its actual field. Leave unused BERG, Timed Up and Go, and Other assessment fields blank; do not write `qualitative balance assessment documented above`. Scores are patient-specific, not reusable defaults.
- Leave the HHA text comment blank unless the clinician specifically requests a comment; reconcile the actual HHA indication/referral choices with the record.
- Mark Advance Directive `Education needed` unless current documentation says otherwise.
- In ACTIVE DIAGNOSES, preserve the diagnosis grid, then inspect and complete the PT-relevant supporting fields below it: strengths, limitations, permanent impairments, effect on safety/progress, HHA mitigation, fall/hospitalization risks, patient education, PT interventions, homebound reasons, care summary, DME, professional PT services, discharge plan, and rehabilitation potential. Base every entry on the verified diagnoses, current function, and clinician-provided findings; do not add unsupported diagnoses or measurements.

## Preservation rules

- Before editing, capture a compact map of every non-empty current RECERT field in the affected PT sections.
- Treat the current RECERT's verified date of assessment as the assessment date. Never copy the prior episode's assessment date or substitute the form-edit date or current date. Preserve a populated assessment date; fill or change it only when the user or a dated current source supports the change.
- Prefer append operations for narrative fields. Insert a short separator only when needed for readability.
- Fill blank structured fields only when the prior value is still clinically appropriate and supported for the recert; otherwise leave the field unchanged and flag it for clinician review.
- Never overwrite current RECERT values with conflicting historical values. Report the conflict instead.
- Do not copy irrelevant nursing, medication, aide, or administrative content into PT sections.
- Do not invent a frequency, effective date, current measurement, goal status, or justification.

## UltraHHC save and persistence behavior

- Many supplemental fields use `onchange="UpdateAddendum(this)"`. A value remaining visible after `fill()` is not proof that it saved.
- For short supplemental inputs, enter with native keystrokes, blur with Tab, and allow the addendum update to finish before changing the next field. For long textareas, use native typing or paste into the focused field, then Tab to fire the native change handler.
- Use the section's bottom `Save` control whose action is `oasis.saveOasis(false)`, not Printer Friendly, report-viewer, validation, locking, or electronic-signature controls.
- When pasted supplemental text does not register as a change, make one native keystroke edit before Tab and Save. For cleared fields, use select-all, Backspace, then Tab; verify they remain empty after reopening.
- Save after each logical section. After completing A, G, GG, J, M, and ACTIVE DIAGNOSES, perform one intentional full reload, reopen the exact RECERT, and verify representative values from every edited section.
- In the final whole-form review, match supporting checkboxes to their narratives beyond G as well: PT discipline in the care summary, planned professional PT services, homebound reasons, discharge plan and rehabilitation potential. Distinguish planned services from interventions actually performed. Replace outdated requests for current mobility testing once the clinician supplies those findings, and keep gait distances, assistance, device, pain, frequency and effective date consistent across summaries.
- If a supplemental textarea disappears after a true reload while structured checkboxes and inputs persist, retry that field once using native entry, blur, and an immediate section Save. If UltraHHC still rejects it, do not loop or substitute another field; preserve all data that did persist and report the rejected field for clinician review.

## Final report

Summarize:

- the source episode and OASIS form reviewed;
- the verified current RECERT assessment date;
- which RECERT sections received added PT information;
- which existing content was preserved;
- confirmation that Jason Quang Ngo, PT was selected;
- save status and whether the draft remains unsigned;
- any conflicts, missing current measurements, or fields left for clinician review.
