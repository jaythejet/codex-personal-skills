---
name: alta-pfr
description: Copy and update PT Functional Reassessment (PFR/PT re-evaluation) notes and associated PFR orders in Alta/VTTECS at alta.vttecs.com/patientcare. Use for Alta PFR, PFR orders, PT re-evaluation, functional reassessment, or carrying a prior PFR or evaluation into a new PFR with dictated changes.
---

# Alta PFR

Use the open Alta patient chart in Chrome. Read and follow the Chrome-control and Veertech PT charting skills before browser actions.

## Guardrails

- Treat PFR as PT Functional Reassessment/PT re-evaluation.
- Preserve unrelated chart content and never invent clinical findings.
- Save only when the user requests chart changes.
- Keep the PFR unsigned and unsent. Never click Sign, Submit, or For QA unless the user explicitly authorizes that exact action.
- Leave the saved PFR open for review.

## Copy workflow

1. Identify the requested target PFR date. Edit an existing unsent PFR when present; otherwise create a PFR for that date.
2. Use the closest prior completed PFR as the source. If none exists, use the closest prior completed PT evaluation.
3. Inspect the entire source, including lower-page checkboxes, assistance levels, balance, goals, dates, frequency, narratives, and visit times.
4. Copy the source into the target, then apply every user-supplied change. Preserve unspecified values from the source, including O2 saturation when the user supplies other vitals but omits O2.
5. Update requested current findings consistently across related fields, devices, and narratives. Preserve baseline goal wording and criteria unless the clinician explicitly changes the goals; a current device or assistance level does not automatically change the intended goal.
6. When converting a dated follow-up to a PFR, use that visit's date, times, vitals, pain, screening, and current functional findings, together with the prior evaluation/PFR's baseline information and goals. Do not use today's date by default. Label an older Tinetti or other outcome score with its source date when no updated score is supplied.
7. Do not carry visit-specific caregiver presence, education response, symptom resolution, or communication from another visit without support. Apply clinician corrections to every affected narrative.

## Editing and replacing a follow-up

- Batch deterministic entries by form section, then inspect actual values and checked states. Early checkbox clicks can fail while the form scrolls; reapply only selections verified as missing.
- Keep a recoverable copy of prepared values while working on a lengthy unsaved form. If Back/reload clears the editor, reopen the patient and check for an existing saved draft before restoring it.
- A visit-overlap warning does not necessarily mean Save failed. Check the saved note ID, Add-to-Edit transition, refreshed chart row, and status before retrying or creating another note.
- When the clinician requests replacement of a follow-up, finish and verify the PFR and associated request first. Remove only the exact source follow-up when explicitly requested and permitted by the current action policy.

## Edema

- When the user does not report edema, enter `N/A` in Edema Location. Leave size, pitting, and non-pitting blank.
- When the user reports edema, enter only the supplied edema findings and do not enter `N/A`.

## Goal dates

Preserve the clinician's baseline goal text and criteria. Do not invent new goals, change a no-device goal to a walker goal, increase target distance, or assert goal attainment from current findings alone.

When the clinician asks to keep the baseline goals unchanged, preserve their associated dates too unless a date change is requested. Otherwise, calculate updated dates from the target PFR date:

- Short-term date: add 14 days, then roll forward to Saturday.
- Long-term date: add 28 days, then roll forward to Saturday.
- Use the short-term date for B4 Home Program and B12 Management and Evaluation.
- Use the long-term date for B2 Therapeutic Exercise, B3 Transfer Training, B5 Gait Training, and B11 Muscle Re-education/Tinetti.

Example: for a Friday PFR dated 7/24/2026, use 8/8/2026 for short-term goals and 8/22/2026 for long-term goals.

## Frequency

- Preserve the ordered frequency unless the user supplies a change.
- When continuing `2w3` after a Friday PFR, use the immediately following Sunday as the effective date unless directed otherwise.
- Format as `<frequency> eff M/D/YYYY`, using the clinician's actual frequency.
- For a new continuation request, ask for an unspecified frequency/effective date rather than treating the old template regimen as a new order. Apply a supplied change to the PFR, order subject, Frequency field, and any narrative frequency reference.
- Example: for a PFR dated 7/24/2026, enter `2w3 eff 7/26/2026`.

## Assessment and response

- Write **Interventions: Skilled Care Provided This Visit** as a concise, patient-specific reassessment: documented progress since the prior evaluation/PFR, remaining functional or safety limits, and why continued skilled PT is needed. Do not turn it into a routine treatment checklist or a generic statement that PT is indicated.
- Avoid repeating vitals, gait distances, assistance levels, MMT, ROM, or outcome scores already recorded above unless a value explains a meaningful change or safety issue. Summarize their functional implication instead.
- Keep patient-reported statements out of the assessment.
- In **Patient/PCG Response**, describe documented tolerance, limiting symptoms, response to progression, cueing, and relevant education. Include clinician-supplied patient reports and changes, while avoiding redundant recitation of unchanged top-section data.
- Keep the response substantive rather than a generic one-line tolerance statement. If asked to add sentences, use additional supported facts from the same visit; never invent caregiver understanding, participation, or improved performance.
- Refer to the patient as `Pt.`.
- Use the COVID screening checkboxes. Do not manually repeat `Performed COVID-19 Screening prior to provision of care` in the assessment or `COVID-19 Screening performed prior to provision of care was Negative` in the response.

## Associated PFR order

When the clinician also requests PTA supervision, use [Alta PTA Supervisory](../alta-pta-supervisory/SKILL.md) for the separate general Care Coordination Note. Do not substitute the LVN/CHHA Supervisory Visit form or add the supervisory compliance checklist to this PFR treatment order.

- When requested, use MDO/Care Coordination > Add > MDO/PT Care Coordination Notes.
- Use the patient's prior PFR order or the user-selected template, preserving its layout and communication style. If there is no prior PFR order, the patient's existing PT evaluation order can supply the form layout. Tailor only supported details and the clinician's current instructions.
- Default to a broad, generalized PFR communication paragraph covering re-evaluation, education/POC, continued skilled PT, and the purpose of improving function toward PLOF/quality of life. Do not repeat specific assistance levels, gait distances, strength grades, vitals, or a detailed reassessment unless requested or needed for the physician's decision. Keep the actual frequency in the subject and structured Frequency field.
- Set Title/Subject to `PFR: <frequency> eff <effective date>` and make the Frequency field match the clinician's current instruction. Template frequency/dates are placeholders, not new orders.
- Use the PFR visit date for order, sent, and discipline dates when directed by the user's template. Preserve supplied times; if the required order time is absent, ask rather than inventing it.
- A generalized example is: `Physical therapy re-evaluation completed. Continue skilled HH PT with education in safety and fall prevention, HEP, mobility as tolerated, and PT goals/plan of care. Treatment will focus on improving functional safety and independence toward PLOF and improving quality of life. Plan of care discussed with MD and PT.` Add completed home-safety/DME assessment or MD-notification wording only when supported. Describe planned education as part of the POC when actual education is not documented.
- Inspect each template checkbox against this patient's findings. Typical relevant choices include B1 evaluation, PT treatment orders, therapeutic exercise, transfer training, home program, management/evaluation, balance, bed mobility, frequency, and assistive-device training. Do not blindly check every template item.
- Exclude PTA from PFR order coordination unless the user specifically requests PTA involvement. Preserve clinician-supplied MD/RN/PT and communication-method selections; do not infer that communication occurred from template defaults alone.
- For a nonambulatory patient with bilateral BKA and wheelchair/Hoyer-lift mobility, remove gait training and tailor device training to WC/Hoyer lift. BKA alone is not a universal reason to exclude gait training in other patients; use actual mobility/prosthetic status.
- Save the order unsigned unless signing/sending that order is explicitly authorized. Verify title, frequency, patient-specific interventions, dates/time, signature, and saved/submitted status. Note and order authorization are separate; do not extend authorization to a different patient or future visit, and never store an e-sign code in the skill.
- After revising an already submitted order, save and resubmit the final wording when authorized, then verify the saved preview and final status.

## Note verification

Before saving, visually verify:

- target date, visit time, vitals, pain, and O2;
- Edema Location is `N/A` when no edema was reported;
- copied assistance levels, device, distance, balance, Tinetti, strength, and goals;
- original baseline goal wording/criteria and preserved dates when requested, or the calculated Saturday dates when appropriate;
- frequency and effective date;
- assessment contains no patient report;
- response contains all patient reports;
- duplicate COVID sentences are absent from both textareas;
- signature and status match the current authorization; blank and unsent are the default.

Save the draft, report any site warning, visually confirm the saved values and narratives, and keep the edited tab open.
