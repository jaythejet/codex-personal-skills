---
name: seniority-recert
description: Copy, reconcile, review, and save unsigned SENIORITY Home Health OASIS E2 recertification assessments in UltraHHC by using the newest prior signed RECERT as a read-only baseline and applying current clinician findings, diagnoses, medications, and plan-of-care changes. Use when the user says SENIORITY recert, OASIS recert, RECERT, recertification, copy the old recert, carry forward the previous recert, or asks to complete or review the blank current recert. Never invent clinical data or validate, lock, unlock, sign, submit, certify, or attest.
---

# SENIORITY OASIS Recertification

Prepare the current SENIORITY Home Health OASIS E2 RECERT in the user's selected UltraHHC Chrome tab. Use the newest prior signed RECERT for the same patient as historical structure, then reconcile every carried-forward item with current clinical information.

## Record integrity and safety

- Verify the patient with the chart name and MR/patient number before reading or entering data.
- Verify the current certification period and the immediately preceding period. Never copy between patients or into the wrong episode.
- Treat the prior signed RECERT as historical evidence, not as proof of the patient's current status.
- Use only current clinician findings, matched current records, the current Medication Profile, current diagnoses, and the verified prior signed RECERT.
- Never invent, estimate, randomize, or silently normalize vitals, pain, functional scores, cognition, wounds, diagnoses, medication status, discipline frequency, goals, or current-visit findings.
- Keep patient data in the live chart and working memory. Do not save patient names, screenshots, extracted chart text, or other PHI in this skill repository.
- Save only when the user asks to complete or save the draft and the pre-save audit passes. Leave the OASIS unsigned and unlocked.
- Never click `Validate Oasis`, `Validate`, `Lock Oasis`, `UnLock Oasis`, `UnLock Comprehensive Assessment Only`, an electronic-signature control, or any submit/certification/attestation control.

## First job: find the correct prior RECERT

Do this before entering anything into a blank current RECERT.

1. Inspect the selected chart and record the exact patient name/MR number, current certification period, and current RECERT header.
2. Confirm that the selected current RECERT is the newest episode's editable assessment. A blank/default draft normally shows `Save`, `Validate Oasis`, and `Lock Oasis`; system-populated demographics or insurance do not make it a completed record.
3. Determine whether the current RECERT already contains clinician-entered data. If it does, preserve it and perform a compare-and-update workflow instead of copying over it blindly.
4. In the left chart tree, start at the immediately preceding certification period, expand `OASIS`, and look for `RECERT`.
5. Prefer the newest prior RECERT whose certification period immediately precedes the current period and whose form is electronically signed/read-only. Verify the old header and signed indicator after opening it. Never unlock it.
6. If the immediately preceding episode has no completed RECERT, inspect older periods only to report what exists. Do not silently substitute a non-adjacent, unsigned, or in-progress assessment; ask the user before using it.
7. Capture the prior values section by section in a structured in-memory map: A, G, GG, J, M, Active Diagnoses/care plan, and Medications.
8. Reopen the newest current `OASIS` -> `RECERT`, then re-verify the patient, current period, editable state, and blank/preserved values before entry.

Use the certification-period labels to target the correct tree nodes; do not choose a RECERT by screen position or by using the first repeated `RECERT` text match.

## Current-information intake

Before copying values into the new episode, collect or confirm all current-only information that cannot safely come from the prior RECERT:

- assessment date, time in/out, completing discipline, and care staff;
- current measured vitals and pain findings;
- falls, hospitalizations, emergency visits, weight loss, exhaustion, and other M1033 lookback items;
- current mental/cognitive status and any acute change;
- current ADL, transfer, gait, device, assistance, and GG performance;
- current system-review findings, symptoms, elimination, nutrition, and psychosocial status;
- current skin condition, wounds, wound measurements, and wound care;
- active diagnoses, ICD-10 codes, onset dates, and symptom-control ratings;
- current Medication Profile, including new, changed, and discontinued medications;
- current skilled need, homebound reason, disciplines/frequencies, interventions, goals, supplies/DME, discharge plan, and rehabilitation potential;
- anything significant that changed since the last assessment.

If the user says `no changes`, apply that statement only to stable findings it reasonably covers. Still require current vitals, assessment timing, time-window questions, medication reconciliation, and any other item that must describe the current visit. Ask one concise combined question for missing required current facts instead of interrupting field by field.

## Copy-forward rules

Read `references/recert-section-map.md` before entering data.

- Populate patient-specific current facts first. Carry forward a prior value only after classifying it as stable, current-confirmed, or current-required.
- Preserve system-populated disabled demographics and episode information unless the chart itself shows an error. Do not overwrite disabled fields with copied text.
- Carry stable information such as longstanding caregiver arrangements, supported chronic conditions, allergies, advance directives, and durable equipment only after verifying that it remains current.
- Reassess functional codes, GG scores, hospitalization-risk lookbacks, pain, vitals, cognition, wounds, homebound status, skilled need, frequencies, goals, and change questions for the new episode.
- Do not copy old vital signs, assessment date/time, pain ratings, wound measurements, recent-event lookback answers, or statements such as `no change` into a new visit without current support.
- Use the current Medication Profile as the medication source of truth. The prior RECERT medication table is a comparison baseline only.
- Reconcile active diagnoses against the current chart and skilled services. Do not preserve a diagnosis merely because it appeared in the old RECERT.
- When one fact changes, update every duplicate occurrence. Common duplicates include gait/device/assistance, fall risk, cognition, pain, wound status, medication count, homebound reason, skilled interventions, frequency, goals, and discharge planning.
- Keep the completing discipline patient- and visit-specific. Do not copy the prior signer's discipline or staff name into the new assessment.

## Efficient browser workflow

- Use the Chrome-control workflow and claim the selected patient chart once.
- Identify the current and prior RECERT by their ancestor certification-period labels in the left tree.
- Read the prior assessment one section at a time with targeted control values, checked states, selected options, and narratives. Avoid repeated full-page snapshots when targeted reads work.
- Store the prior baseline as a section-keyed working map, not a local patient file.
- Return to the current RECERT and enter one section at a time. After each section, run a compact verification of values and checked states before moving on.
- Prefer direct semantic field operations. Do not use arbitrary page scripts to bulk-copy controls, trigger Angular handlers, bypass browser security, or modify the signed source RECERT.
- If a control mapping is uncertain, inspect the actual current form before editing it. Do not assume the old and new pages use identical control IDs.

## Section order

Complete and verify the current assessment in this order:

1. `A - ADMINISTRATIVE INFORMATION`
2. `G - FUNCTIONAL STATUS`
3. `GG - FUNCTIONAL ABILITIES AND GOALS`
4. `J - HEALTH CONDITIONS`
5. `M - SKIN CONDITIONS`
6. `ACTIVE DIAGNOSES`
7. `MEDICATIONS`

Treat `ACTIVE DIAGNOSES` as the long clinical/care-plan section, not merely the ICD-10 table. Complete its strengths/limitations, risk and refusal questions, care preferences, education, skilled interventions, care summary, homebound reason, supplies/DME, discipline services, goals, discharge plans, and rehabilitation potential when those fields are present.

## Source precedence

When sources conflict, use this order:

1. Clinician's current-visit dictation and explicit corrections.
2. Current signed physician/hospital records and current chart information matched to the patient.
3. Current UltraHHC Medication Profile and active-diagnosis information.
4. Newest prior signed RECERT for stable historical context and form structure.
5. Default/blank RECERT content only as interface structure, never as patient evidence.

Stop and report a material conflict instead of silently choosing a value.

## Pre-save audit

Before saving, verify in one pass:

- correct patient, current certification period, and recertification reason;
- prior source was the newest appropriate signed RECERT for the same patient;
- completing discipline, staff, assessment date, and time in/out are current;
- current vitals and pain are supported and no old visit measurements remain;
- G ADLs, GG scores, gait, transfers, device, assistance, fall risk, cognition, and safety measures agree;
- J hospitalization-risk lookbacks and system findings are current;
- M wound/skin answers match the current wound record and related diagnoses/interventions;
- active diagnoses, ICD-10 codes, onset dates, ratings, skilled need, homebound reason, frequencies, goals, and discharge plan agree;
- medications match the current Medication Profile, including new/change/discontinued status;
- all change questions and narratives describe the current episode;
- no unsupported copied statement, stale date, prior signer/staff, or contradictory duplicate remains.

When the audit passes, click `Save` only if the user asked to save. Require a success message or a reopen-and-persist check of representative fields. Leave the current RECERT open, unsigned, unvalidated, and unlocked for clinician review.
