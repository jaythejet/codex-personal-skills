---
name: alta-pt-eval
description: Complete, revise, sign when explicitly authorized, and submit when explicitly authorized Alta/VTTECS home-health PT evaluations and associated PTE orders. Use for Alta PT eval, PTE, PT evaluation notes, evaluation frequencies/goals, or the post-evaluation PTE order at alta.vttecs.com/patientcare. Do not use for PFR/PT re-evaluations.
---

# Alta PT Evaluation

Use the selected Alta patient chart in Chrome. Read the selected tab with `getTabContext`, then follow the [Veertech PT charting skill](../veertech-pt-charting/SKILL.md) for browser interaction. Follow the session's Chrome-instance instructions and documented `cua_repl` APIs.

## Guardrails

- Preserve unrelated chart content and never invent clinical findings.
- Never edit **Diagnosis** or **Other Diagnosis/History**, even when other chart information suggests additions or corrections.
- Keep the note unsigned and unsent unless the user explicitly authorizes signing or submitting that exact note. Signing does not imply permission to submit, and submitting the evaluation does not imply permission to sign or submit its associated order.
- Sign as `JASON QUANG NGO, PT` only when the user explicitly authorizes Jason Ngo's signature.
- Report site warnings and leave the requested note or order open for review.

### Confirmation discipline

- A request to enter findings and save a draft authorizes that work in the identified chart. Do not ask again for routine field entry or saving when the session already provides authorization.
- If governing policy requires action-time confirmation, finish inspection, drafting, mapping, and verification first; request one concise confirmation for the exact actions and record. Do not split it into per-field or per-save prompts.
- Signing and submitting retain the explicit authorization boundaries above. A later request authorizes only its added scope.

## Complete the requested scope

- For a full evaluation, including `finish the entire thing`, complete supplied findings, the defaults below, all applicable goals/dates, assessment, response, rehab potential, and structured plan-of-care selections. Do not stop after transcribing only the latest dictated fields. A request limited to particular fields stays limited to those fields.
- Keep one encounter checklist as dictation arrives. The latest correction replaces earlier wording in every affected field and narrative. Do not restart completed work or keep superseded findings in the note.
- Use supplied details and established defaults before asking questions. Ask only for a missing clinical fact necessary to complete the requested scope; continue independent work while waiting. Leave unsupported optional findings blank rather than inventing them. Do not infer communication, symptoms, treatment tolerance, falls, or return demonstration from a template alone.
- Map the active editor once, then fill by section: structured findings, goals/dates, assessment/response, rehab potential/plan of care, and final verification. Save after a coherent draft is complete. If more dictation follows a save, confirm an active **Edit** form before changing it.
- When asked to remember the encounter, or before recovering a stalled page, save the latest corrected findings and draft to a recovery file in the current workspace. Store reusable preferences in this skill; keep patient-specific findings in the encounter recovery file.

## Evaluation defaults

Apply these clinician preferences unless patient-specific findings or the user's current instructions differ:

- Refer to the patient as `Pt.`.
- Never use `per clinician report` or similar attribution in an assessment or any chart note. The note is written in the treating clinician's voice; retain `Pt. reports` where patient attribution is clinically relevant.
- Never add `No additional DME is needed`, `No DME needed`, or equivalent no-equipment-needed sentences to chart narratives. A supplied DME-needed value of None may be recorded in a designated structured field; do not insert that sentence into the assessment or response.
- **PLOF:** write a complete sentence covering ADL assistance, mobility assistance, and the applicable device. Example: `Needs mod assist with ADLs and SUP mobility with RW.` Do not reduce PLOF to only an assistance level.
- **Vitals:** enter every supplied value, including temperature. Keep resting vitals in the structured fields and post-exercise values in the response when the form has no separate post-exercise fields.
- **Pain:** enter the supplied pattern, intensity, and anatomical site. For incision pain, use the supplied site, such as `Chest incisions`, rather than only `Incisions`.
- **Neurological:** check Intact for both sensation and proprioception.
- **Home Safety Evaluation:** when Jason supplies no different home setup, use his dictated default: `Pt. lives in a single-story home with family providing care around the clock. Home has hardwood flooring and a bathtub.` Replace the default with patient-specific details when supplied. Include hazards and recent falls only when supplied; do not infer no falls. Do not list DME in this field.
- **Even Surfaces:** format distance/device as `<distance> ft x <AD>`, such as `50 ft x RW`, and check the supplied assistance level.
- **Weight bearing:** check FWB.
- **Gait deviations:** check Others. Enter a short comma-separated list before the Tinetti score, using `Decreased cadence, decreased step length, flexed posture, Tinetti: <score>/28` unless different deviations are supplied.
- **Tinetti:** default to `17/28` only when the clinician has not supplied another score. Use the supplied score when given.
- **Balance:** Fair, Fair, Poor, Poor for sitting static, sitting dynamic, standing static, and standing dynamic.
- **Endurance:** `Poor-`.
- **Precautions:** `Fall risk, universal precautions`; append additional supplied precautions.
- **ROM:** check WFLs.
- **Strength:** leave Strength WFLs unchecked and enter `3+/5` for LUE, RUE, LLE, and RLE.
- **Rehab potential / Plan of care discussed with:** complete the structured controls from the clinician's findings and coordination instructions. Do not omit these controls merely because rehab potential or coordination is mentioned in a narrative.
- Keep assistive-device checkboxes and gait/transfer wording consistent with the current patient; do not infer a device solely from equipment available in the home.

## Goals and dates

Tailor assistance levels and devices to the evaluation rather than copying mismatched template values.

- B2: `Pt. will improve B LE strength by at least 0.5 grade to perform functional mobility safely and with ease.`
- B3: `Pt. will be able to transfer <level> with good safety and proper body mechanics with <device>.`
- B4: `Pt. will be compliant with HEP in order to improve overall function and perform safely.`
- B5: `Pt. will be able to ambulate 150 ft <level> with <device> on level surfaces and Indep with rest management.`
- B11 specify `Tinetti`. Use the clinician's supplied target: `Pt. will improve Tinetti score to at least <target>/28 to demonstrate decreased fall risk.` If no target is supplied, use `greater than 20/28`. A dictated score or target always overrides the template; keep baseline and goal distinct.
- B12: `Patient/Caregiver to be knowledgeable of safety measures to prevent falls and COVID safety/prevention.`
- Use a two-week date for B4 and B12 and an approximately 30-day date for B2, B3, B5, and B11, unless the user or loaded plan gives different dates.
- Format frequency as `<frequency> eff M/D/YYYY`, preserving the clinician's ordered frequency and effective date.

## Assessment and response

- Preserve Jason's preferred intervention and response wording below. Use these as the starting templates when he requests his usual style; adapt only findings and activities supported by the current encounter. Keep the same clinical sequence and phrasing, with minor grammar cleanup. Do not replace these with a newly composed assessment, a list of structured measurements, or patient-history recap unless Jason requests that change. His latest supplied paragraph overrides the template.
- **Interventions: Skilled Care Provided This Visit** is the clinical assessment. Keep frequency and effective dates in the structured Frequency field, not in this narrative. Include only supported impairments, functional limitations, education, and activities actually performed. Put additional dictated instruction, such as incentive spirometer training, here. Do not put patient-reported history or the numerical Tinetti score in the assessment.

  Preferred intervention template:

  `Pt. presents with PMH consistent with gross strength deficits, poor activity tolerance, forgetfulness, and impaired balance leading to high fall risk. Pt. is limited with functional mobility relating to bed mobility, transfers, and gait and will benefit from skilled HH PT. Pt. is seen for PT initial evaluation and receives training in HEP, fall safety prevention, education on pain management, and education on PT POC/goal planning to improve functional status and return to PLOF. Ther-ex performed during the visit consists of sit<>stand, gait training, and postural mms strength/endurance training in order to decrease fall risk. Pt. is a good candidate for skilled HH PT and will benefit from skilled HH PT to improve overall strength, functional mobility, home safety, and fall prevention with in-home mobility and ADLs.`

- **Patient/PCG Response** focuses on treatment response, tolerance, return demonstration, cueing, and ability to continue PT. Use the preferred paragraph below when Jason supplies or confirms these findings. Do not automatically replace it with history, height/weight, or home setup; include such details only when he specifically dictates them for the response. When history is requested, attribute it to `Pt. reports`. Preserve supplied symptoms, anatomical pain site, falls, and later corrections. Never infer treatment tolerance, return demonstration, absence of adverse symptoms, or completed agency/MD notification merely because they appear in the template.

  Preferred response template:

  `Pt. responds well to overall treatment procedure and tolerates treatment well. Pt. is able to return demonstration but continues to require training, including verbal and tactile cues, in order to perform functional mobility with fair-good body mechanics. Pt. is asymptomatic and has no adverse symptoms. Pt. is able to continue with PT. Agency and MD notified.`

- Use the COVID screening controls. Do not manually duplicate the auto-rendered COVID screening sentence in either narrative.

## Verification before save or submit

Verify the evaluation date and visit times; pain pattern/intensity/anatomical site; all supplied vitals and post-exercise values; neurological selections; DME; homebound status; Home Safety without DME; functional assistance levels; even-surface distance/device; FWB; Others gait deviations with the correct Tinetti score; supplied edema findings; balance; endurance; precautions; ROM; strength; goals/targets/dates; frequency/approved visits; rehab potential; structured plan of care; assessment; response and supported closing statements; signature; and note status. Reconfirm Diagnosis and Other Diagnosis/History were untouched.

- After Save, inspect the refreshed UI for the `PT Evaluation has been updated!` success alert and acknowledge **Ok** before continuing. The immediate state capture may precede the asynchronous alert; inspect the next current state or screenshot before retrying Save. Check the saved note preview for the changed values and its status, then stop rechecking once persistence is confirmed.
- If controls do not respond, inspect for a pending HTML alert, blocked editor, or saved `... / Notes` view. Reopen the existing note from **Notes > Edit** when further edits are needed. Do not repeatedly click Save or reload merely because one snapshot is unchanged. Editable-looking field values alone do not prove changes were saved. Back up corrected values before a necessary refresh and verify the restored note after saving.

## Associated PTE order

After the evaluation is complete, create or edit the PTE order only when requested:

1. In **MDO/Care Coordination**, edit the existing matching PTE order when one is present. Use **Add > MDO/PT Care Coordination Notes** only when a new order is needed and its creation is requested. Do not create a duplicate of an existing draft.
2. Preserve the agency's generalized PTE template and adjust only patient-specific details unless the user directs otherwise.

### Generalized PTE template

- **Coordination of Care:** MD, RN/LVN, PT, and PTA checked; Others unchecked.
- **Communicated Via:** Phone and Fax checked; Mail, Direct, and Other unchecked, following the clinician's latest `phone and fax always` preference.
- **Communication Notes:** `Physical therapy evaluation, home safety assessment, and DME assessment completed. Patient/CG receives education on safety and fall prevention, HEP education, instruction on mobility as tolerated, patient goals planning, PT POC education, and expectations with skilled HH PT in order to meet goals and return to PLOF/improve quality of life. MD made aware.`
- **Checked orders:** B1 Physical Therapy Evaluation; Physical Therapy Treatment Orders; B2 Therapeutic Exercise; B3 Transfer Training; B4 Home Program; B12 Management and Evaluation; B5 Gait Training; Balance Training; Bed Mobility Training; Frequency; and Patient/PCG training in safe use of adaptive/assistive device(s).
- **Unchecked orders:** B9 Prosthetic Training; B10 Fabrication Temporary Devices; B6 Pulmonary Physical Therapy; B7 Ultrasound; B8 Electrotherapy; B11 Muscle Re-education; B15 Other; and Discharge Patient from Physical Therapy Care. Select an unchecked item only when the evaluation or user specifically supports it.
- When the evaluation includes B11/Tinetti treatment and a corresponding goal, check B11 and specify `Tinetti`. Instruction in use of an incentive spirometer does not by itself add a pulmonary treatment order.

### Patient-specific PTE fields

3. Change the order date, sent date, and discipline date to the evaluation date.
4. Set Time to five minutes after the evaluation Time In when available; otherwise preserve a supplied time or ask rather than inventing one.
5. Use `PTE: <frequency> eff MM/DD/YYYY` for Title/Subject. Enter the same `<frequency> eff MM/DD/YYYY` in Frequency so it exactly matches the evaluation.
6. In the adaptive/assistive-device specify field, enter the mobility device actually supported for patient/PCG training by the evaluation, such as `RW`. Do not copy every item merely because it is present in the home; exclude non-mobility respiratory and medical equipment unless specifically ordered for PT training.
7. Preserve the generalized communication paragraph unless the user supplies patient-specific replacement wording.
8. Verify title, frequency/effective date, every intended checked and unchecked template item, device text, dates/time, clinician, signature, and saved status. Confirm the save through the success message and refreshed order preview. Keep the order unsigned and unsent unless the user explicitly authorizes those exact actions.
