---
name: kinnser-pt-discharge
description: Complete, revise, and review Kinnser/WellSky Home Health PT Discharge notes at kinnser.net, including goals-met status, discharge disposition, and care coordination checkboxes. Save drafts by default; sign or submit only when explicitly authorized. Use for Kinnser PT DC or discharge notes, not General Evaluations or discharge OASIS.
---

# Kinnser PT Discharge

Apply Jason Ngo's Kinnser PT discharge preferences while documenting only patient-specific findings and completed actions supported by clinician instructions or the chart.

Verify the patient, visit, loaded template, and form variant first. Build the target changes once from current dictation and the standing defaults, then complete the requested note, goals, and order workflow without repetitive reconfirmation. Batch independent edits within stable form sections using verified live controls; reacquire controls after navigation or structural changes. Resolve routine workflow choices from these sources; ask for missing required information or unresolved conflicts that affect completion.

## Standing clinician defaults

Jason explicitly supplied the following defaults. Apply them unless current patient-specific dictation or chart evidence says otherwise; do not repeatedly ask him to reconfirm these defaults. They do not authorize signing or submitting.

- For **InTouch / In Touch Rehab** patients, inspect the available templates before authoring a discharge note or PT order. Use the applicable agency template as the starting point and preserve its useful structure while adapting supported findings. Do not apply a template late over an already-personalized saved note without first preserving and reconciling the existing content.
- Check **Patient identity confirmed** at the top after verifying the current patient/task.
- Check both **L** and **R** for bed-mobility rolling unless Jason specifies a change.
- When low HR is recorded and the clinician confirms the patient is asymptomatic with no adverse signs, use the vitals comment **"Pt. is asymptomatic and shows no adverse signs despite low HR."** Include the actual recorded heart rate when applicable. Do not infer asymptomatic status, treatment clearance, or notifications from low HR alone; document clearance or notifications only when confirmed by the clinician.
- **Physical and Psychological Status:** "Patient is under no current psychological or physical distress at time of discharge." Keep mobility measurements in their assessment fields rather than this status field.
- In **Discharge Information**, select **Yes** for discharge instructions, appropriate medical follow-up advised, understanding of medical follow-up verbalized, comprehension of instructions, calling an agency of choice for future needs, and advance discharge notification. Select **No** for medication review unless he states it was reviewed. Check Patient for applicable affirmative rows and Caregiver when caregiver involvement is mentioned; do not mark medication-review participation when no review occurred.
- In **Information Provided**, select Patient and Caregiver. Use a concise generic narrative about continuing the established HEP, safe use of the prescribed device, fall prevention, activity pacing/rest, advised medical follow-up, and contacting an agency of choice for future home-care needs. Tailor it to the actual discharge plan.
- **Living Arrangements at Discharge:** Home unless another destination is stated.
- **Treatment Preferences:** "None stated." unless a preference is supplied; do not invent one.
- **Patient Progress/Response:** use a short general statement, such as "Pt. made good progress with skilled PT and met all established goals. Pt. is appropriate for discharge from skilled PT to the established HEP to maintain functional gains." Do not repeat gait distances, strength grades, and testing in this field when they are already in the assessment.
- **Treatment / Skilled Intervention This Visit:** Jason confirms his usual discharge work includes assessment, therapeutic exercise, HEP review, and safety education. Keep this field generic, such as "Discharge assessment completed. Therapeutic exercises performed for strength and functional mobility, and the established HEP reviewed for continued performance after discharge. Reviewed safe mobility, fall precautions, and activity pacing. Patient met all established goals and is discharged from skilled PT to HEP." Do not invent exercise names, doses, or treatment responses. Keep patient-specific measurements in the functional assessment and Goals Summary rather than repeating them here.

## Goals-met PT-only discharge pattern

When the clinician states that all PT goals are met, select **All goals met** on the assessment and **Goals Met** in the summary outcomes. If **Update Goals and Interventions** is available, update each applicable goal to **Met**, verify the goal count, then click **Return** to return to the discharge note. If that editor already shows all applicable goals met, return without repeating updates. When updating successive goals, wait for **Continue** to disappear before opening the next goal. A legacy discharge form may instead expose only the static treatment-goal list and the All goals met checkbox; verify the listed goals and use those available controls.

For a goals-met leg-strength improvement goal, Jason instructs a **0.5-grade increase from the verified patient-specific evaluation baseline** unless he dictates another result. Apply that instruction to the relevant bilateral leg-strength fields using the form's MMT notation; preserve ROM and unrelated strength entries. Do not reuse another patient's grades or apply the increment again to an already-updated discharge value.

Use this reason and disposition for the clinician's goals-met, PT-only discharge to HEP:

- **Goals met / max potential reached** (`frm_GoalsMet`).
- **Discharge to Home Exercise Program** (`frm_DCDispositionHomeExer`).
- **Discharge Physical Therapy ONLY** (`frm_DCPTOnly`).

Jason specifically wants the following care coordination boxes included in the review of a completed discharge workflow:

- **Scheduler notified** (`frm_CareCoordDCSchedNotified`).
- **Physician notified of discharge prior to discharge date, per agency policy & timeline** (`frm_CareCoordDCPhysNotifiedPrDCDate`).
- **Discharge Summary sent to the primary care practitioner** (`frm_CareCoordDCPhysNotifiedDCSumm`).
- **Order and summary completed** (`frm_CareCoordDCOrderSummComplete`).

Jason's standing instruction confirms these four actions are completed in his discharge workflow. Check all four unless he supplies an exception or the current chart directly contradicts completion. These selections do not authorize sending messages or creating orders on their own.

For PT-only discharge, leave **Discharge from home health services**, **All services notified and discontinued**, and **Discharge All Home Health Services (if PT is final discipline)** unchecked unless the clinician specifies agency discharge. Other reasons and dispositions remain patient-specific.

Keep **Return to clinician for signature** selected for an unsigned draft. An entered signature credential or a **Signature Valid** indicator is not permission to sign or submit.

## Note consistency

Review the entire form, including actual textarea values and selected checkboxes; page text extraction can omit textarea contents or list every select option without revealing the selected one.

Ensure the date, visit duration, vitals, oxygen setting/route, functional findings, testing, caregiver presence, goal summary, and discharge plan agree with clinician instructions, including the standing defaults above. Replace obsolete continuation-of-PT language when preparing discharge. Do not carry historical assistance levels or unchanged strength grades into current discharge fields as if newly assessed. Outside Jason's explicit leg-strength increment instruction, do not infer exact MMT grades, balance assistance, oxygen settings, gait distance, or walker type from goal attainment.

Confirm strength values support a met strength-improvement goal. Balance fields labeled **Discharge Eval Assist Level** need an actual assistance level when assessed, not just movement descriptions. Distinguish RW and 4WW wording when the goal and discharge assessment use different devices; do not silently change the clinician's device.

Save authorized draft changes and wait for saving to finish. Verify the requested values and the goal/discharge checkbox state before reporting completion. Sign, submit, or approve only with explicit authorization and applicable browser confirmation requirements.

A supplied signature code together with an explicit current-session instruction to **Submit** authorizes its use for the current record only; never persist the code or assume authority for future records. When signing is authorized, blur the signature field after entry and wait for **Signature Valid** before proceeding. Verify **Submitted with Signature** or the actual current record status after submission; URL changes or navigation alone are insufficient. Do not repeat submission after the submitted status is verified.

## Associated discharge order

When a PT discharge order is requested, continue the matching prepared order if one already exists rather than creating a duplicate. Otherwise create it using the current patient's **File > New > Order** menu and the live controls. If requested in another tab, preserve the saved note in its existing tab. Use the clinician's discharge date and supported PT-only/HEP disposition; keep the order unsigned unless signing/submission is explicitly authorized. Uncheck **Send as K-Mail** unless sending a message is explicitly requested. Remove unsupported template claims such as physician read-back verification unless the clinician confirms them; notification alone does not establish read-back. Do not infer other discipline discharge or unsupported physician communication details.

Unless current instructions specify otherwise, set the physician-order time to five minutes before the associated visit's documented end time and copy **Order Date** into **Signature Date**. If the visit end time is unavailable, do not invent it or a derived order time. Filling **Signature Date** does not authorize signing. After saving, verify the saved **Order Date**, **Signature Date**, and order time against the source visit and current instructions.

Keep **Order Summary** blank unless the clinician supplies a summary. When no summary was dictated, clear any browser-autofilled login username with direct **Ctrl+A**, **Backspace** immediately before **Save** or an authorized **Submit**, then verify the persisted field is blank. Distinguish saved content from fresh browser autofill before repeating a save.

## UI details

Use the current connected browser and inspect the live form before using selectors. On the observed PT Discharge form, bilateral hip, knee, and ankle strength inputs were paired IDs `frm_ROM71`/`frm_ROM72`, then every fourth pair through `frm_ROM115`/`frm_ROM116`. ROM is in the other columns; do not change it when asked to change strength. Confirm the current row/column mapping before reusing these IDs.

If CUA loses the page or reports a stale handle, list the browser tabs and inspect the current tab state first. Acquire a fresh handle only when the existing one is stale, then resume from the verified live state. Do not use repeated generic recovery scripts or reopen forms that are already available.

Keep remembered workflow guidance free of patient names, task/session keys, clinical measurements, and signature credentials. Patient-specific values from a prior discharge are not future defaults.
