---
name: veertech-pt-charting
description: Edit home-health physical-therapy evaluations and visit forms in Veertech/VTTECS at alta.vttecs.com/patientcare, especially when the clinical form behaves like a browser embedded within a browser and standard Playwright control fails. Use for dictated PT findings, vitals, pain, gait, functional status, Tinetti scores, assistive devices, goals, frequencies, assessments, and patient responses on this site.
---

# Veertech PT Charting

Use the open Chrome tab at `https://alta.vttecs.com/patientcare/`. Read the selected tab with `getTabContext` first.

## Browser workflow

1. Follow the session's Chrome-instance selection instructions and returned `cua_repl` documentation. Verify and claim the selected Alta tab by its current tab ID. Reuse the browser/tab bindings; no separate browser skill or runtime is needed when the session supplies this workflow.
2. Use the documented APIs available on that binding. If Playwright fails with `this._engines.set is not a function`, switch to `tab.getAXState()` rather than retrying Playwright. The indexed Chrome controls used here are `tab.setValue(index, value)`, `tab.click(index)`, `tab.pressKey(indexOrNull, key)`, and `tab.typeText(indexOrNull, text)`. Do not assume legacy `tab.dom_cua` or `tab.cua` methods exist.
3. Map the active editor's relevant fields by labels and IDs from a current accessibility state. When both the chart preview and editor appear in the tree, target the active editor. Batch deterministic entries within one section, then fetch fresh state and check the actual values and checkbox states. Print only the relevant lines when a full tree would add noise.
4. Group checkbox actions by the visible form section. Scrolling/layout changes can leave early clicks unapplied even though later clicks work. Inspect unchecked targets and the current screen, then apply only the missing selections; do not blindly toggle the whole batch again. After a screenshot, obtain a fresh full accessibility state before using numeric indices.
5. Prefer `setValue` for text inputs/textareas and supported select controls. If text does not render correctly, focus the current field, use `pressKey(null, 'CTRL+A')`, and enter text with the documented `typeText` or paste method. Inspect a screenshot for multiline narrative verification. Use coordinates only from a current screenshot when semantic controls fail.
6. After Save, inspect for the application's asynchronous success alert and acknowledge its **Ok** control before continuing. A pending HTML modal can block Save/Close while underlying fields remain editable-looking. Inspect current state/screenshots before retrying; confirm persistence in the refreshed saved preview, not only the edit fields. Capture requested proof and keep the resulting note/order tab open.
7. Do not open a second chart-level View/Edit window while an unsaved form is open. It can hide or recreate the editor and clear unsaved values. Read source notes before opening the destination form; audit the active editor rather than a stale duplicate popup. Back up current corrected findings before any necessary refresh of a stalled editor.

## Documentation conventions

- Refer to the patient as `Pt.` unless the user requests another style.
- Write chart notes in the treating clinician's voice. Never add `per clinician report`, `per therapist report`, or similar attribution to the clinician's own dictated findings. Patient-reported statements may still be introduced with `Pt. reports`.
- Do not insert `No additional DME is needed`, `No DME needed`, or equivalent sentences into chart narratives. Use a designated structured DME-needed field for None when applicable.
- Preserve unrelated chart content.
- Translate obvious speech-to-text errors to the matching form label when the form makes the intended field clear. Examples: "prior level functioning," "Even Surfaces," and "Tinetti."
- Use `4WW` for a four-wheel walker and update every explicitly requested assistive-device reference, including device checkboxes and relevant transfer or gait goals.
- Do not invent findings. If dictated wording remains clinically ambiguous and the form does not resolve it, ask before saving.
- Always review the COVID screening questionnaire. Jason prefers the all-No screening control when he directs a negative screen; verify every question is No and the screening-performed/result fields agree. Do not override a positive symptom or exposure, or infer a future visit's screening result from this preference alone.
- Keep routine COVID screening out of the Skilled Care and Patient Response narratives. Complete required screening controls separately, and mention COVID in narrative text only when the clinician explicitly dictates a clinically relevant symptom, exposure, or narrative statement.
- When copying a follow-up and the clinician says gait distance remains the same, preserve the prior distance in both the gait field and narrative; do not automatically increase it.
- Report any site warning shown after saving, such as a vital sign falling within agency reportable parameters.

## First PT follow-up workflow

Use this workflow when the clinician identifies the visit as the first follow-up after the evaluation:

1. Read the evaluation first. Carry forward only stable baseline findings that remain applicable and that the clinician has not updated, such as alert/oriented status, intact sensation and proprioception, homebound criteria, transfer and bed-mobility assistance levels, balance, strength, ROM, and endurance.
2. Prefer concise assessment entries when the clinician plans to complete or refine details later. For example, document transfers as an assistance level such as `SBA` and bed mobility as a level such as `Supervision`; do not add task-specific details that were not supplied.
3. Match every assistive-device reference across gait, Skilled Care, Patient Response, and Plan. If the clinician says the patient used an RW and no wheelchair, use `RW` consistently and do not carry wheelchair use from the evaluation or a stale popup.
4. Enter pain and SpO2 whenever the clinician provides them or has visibly added them to the active form. Do not omit a visible user-entered value during a later audit or copy-forward.
5. Select only interventions supported by the visit and plan of care. For a typical first follow-up, verify whether the clinician intended B2 Therapeutic Exercise, B3 Transfer Training, B4 Home Program, B5 Gait Training, Balance Training, B12 Management and Evaluation, and B11 Muscle Re-education; when B11 is used for the standardized balance assessment, enter `Tinetti` in its detail field.
6. Before saving a negative COVID screen, verify all required structured layers agree: the top status is Negative, the questionnaire is all-No or every item is No, and screening performed/result are Yes/Negative. Keep routine COVID language out of Skilled Care and Patient Response. If any required layer is unanswered or inconsistent, flag it before saving.
7. When auditing after the clinician edits the draft, compare every active-form value and checked state against the draft, including vitals, pain, SpO2, mental status, neurological findings, homebound criteria, assessments, interventions, narratives, coordination, and COVID controls. Treat the clinician's visible changes as the preferred pattern for future notes unless they conflict with new visit-specific findings.

## Alta DCO workflow

Use this workflow when the user asks for an **Alta DCO**:

1. Use **Load data** as the starting point and preserve prior-OASIS information unless the user supplies an updated discharge finding.
2. Do not toggle a populated checkbox merely to enable a related field unless necessary. Toggling can clear loaded pain details or other dependent values. After every checkbox change, verify the intended box remains checked in a screenshot.
3. Complete the tabs from left to right:
   - **Patient Tracking:** preserve existing information and enter the requested time in/time out when supplied.
   - **Administrative Information:** select PT, complete the discharge date/reason, no emergent care or inpatient admission when applicable, community discharge disposition, and medication reconciliation.
   - **Hearing, Speech & Vision:** use the loaded data; select the appropriate response, commonly Rarely when directed.
   - **Cognitive Patterns:** preserve loaded information and complete applicable blanks.
   - **Mood:** use 0 responses when directed and Never for social isolation.
   - **Behavior:** select None of the above and Never when applicable.
   - **Preferences for Customary Routine Activities:** preserve caregiver data; when directed, record non-agency caregiver assistance for A, C, D, and F.
   - **Functional Status:** improve discharge performance consistently with the dictated functional level. For an independent patient without an assistive device, select independent grooming, dressing, bathing, toilet transfer, transfers, and ambulation as supported.
   - **Functional Abilities & Goals:** explicitly interact with every discharge-performance dropdown. For an independent patient, use `06` for the applicable self-care and mobility items. Select no wheelchair/scooter use when applicable. Do not leave this tab unfinished merely because `06` is already displayed.
   - **Bowel & Bladder:** complete no UTI and the applicable continence responses.
   - **Health Conditions:** record no falls when supplied, use Never for applicable frequency items, and use M1400 response 2 (moderate exertion) when directed.
   - **Swallowing/Nutritional Status:** use therapeutic diet for both applicable look-back/discharge columns when directed and independent eating when supported.
   - **Vital Signs/Pain:** enter the dictated vitals and pain findings. Verify changed inputs and textareas with screenshots because visible DOM can show loaded/original values. If a loaded pain site must be toggled to enable controls, immediately restore location, pain type, intensities, and description, then visually verify them.
   - **Skin Conditions:** leave not applicable when there are no skin issues.
   - **Medications:** use the applicable none/NA response and independent medication management when supported.
   - **Participation in Assessment and Goal Setting:** preserve the required checked intervention responses. For the discharge reason, select **No further care needed** exactly. Do not select Other and do not enter a POC narrative in the Other text field.
   - **Special Treatment, Procedures, and Programs:** leave non-applicable items blank unless directed.
   - **Endocrine:** leave blank unless diabetes or another endocrine finding is supplied.
   - **Cardiovascular:** preserve loaded information unless updated findings are supplied.
   - **Additional Assessments:** preserve and complete the individualized emergency plan as directed. Replace any recertification/continued-PT narrative in the bottom assessment textarea with a personalized DC assessment that summarizes progress, pain improvement, final functional level/assistive device, goal attainment, and appropriateness for discharge.
   - **Clinician/Signature:** verify clinician name/title and date. Sign only when the user explicitly authorizes the signature. Save only after the signature requirement is satisfied.
4. Before saving, visually recheck:
   - every intended checkbox is still checked;
   - every Functional Abilities & Goals dropdown was explicitly completed;
   - the discharge reason is **No further care needed**;
   - the bottom Additional Assessments textarea contains the personalized DC assessment;
   - vital signs, pain location/type/intensities, clinician, date, and signature are correct.
5. Save, handle and report any site warning, verify the saved form, and leave the requested next tab open.
