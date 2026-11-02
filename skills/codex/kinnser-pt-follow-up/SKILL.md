---
name: kinnser-pt-follow-up
description: Complete and revise Kinnser/WellSky Home Health PT follow-up visit notes from clinician dictation, including vitals comments, pain, assistance levels, gait, exercises, and the next-visit plan. Save unsigned by default; sign and submit only with explicit current-session clinician authorization. Use for Kinnser FUV or PT Visit, not evaluations or discharge notes.
---

# Kinnser PT follow-up

Use the clinician's current patient-specific findings and the loaded PT Visit as the baseline. Preserve populated content unless the clinician changes it or a dictated change creates a direct contradiction. Never invent findings, treatment, pain ratings, vital-sign measurement context, notifications, or patient responses.

## Standing Kinnser preferences

- Verify the current patient/task and check **Patient identity confirmed** at the top. Jason confirms this as his standing default.
- Check both **L** and **R** for bed-mobility rolling unless Jason specifies otherwise.
- For **InTouch / In Touch Rehab** patients, check for a matching agency template before manual entry. Use the applicable template as the starting point; preserve an already-loaded template and existing patient-specific edits rather than applying it again.

## Vitals comments: required for every follow-up

- Always enter a comment in the Vital Signs Comments field, separate from the overall visit summary. The current form uses `frm_VSComments`; confirm the live control before using that locator.
- Review the recorded values against available patient-specific or agency/physician parameters. Otherwise use appropriate adult resting reference ranges. A value below the population average is not automatically abnormal. Check an authoritative medical source when the interpretation is uncertain.
- For values within normal limits, when the clinician has supplied that the patient is asymptomatic, has no adverse signs, and can continue treatment, use: **"Pt. is asymptomatic and shows no adverse signs. Pt. is okay to continue with PT visit as planned."** Do not prepend "Vital signs within normal limits"; the clinician does not want that phrase in the comment.
- Do not infer absence of symptoms or clearance to continue solely from normal measurements. If the clinician has not supplied the response, document the measurements and supported interpretation without inventing the response.
- For abnormal readings, state the actual value(s), whether high or low relative to applicable parameters, the supplied symptoms/response, and actions that actually occurred. Include **"Agency and MD notified"** only when the clinician confirms both notifications occurred; never infer notification from an abnormal value. If notification status is missing, ask concisely while completing independent work.
- When low HR is recorded and the clinician confirms the patient is asymptomatic with no adverse signs, use **"Pt. is asymptomatic and shows no adverse signs despite low HR."** Include the actual recorded heart rate when applicable. Do not infer asymptomatic status, treatment clearance, or notifications from low HR alone; document clearance or notifications only when confirmed by the clinician.
- Do not contact the agency or physician unless separately instructed. Do not use the normal-vitals continuation wording when it conflicts with supplied symptoms, adverse signs, or treatment being held.

## Pain and functional updates

- Use the structured pain assessment for the reported sites, laterality, supplied pre/post ratings, aggravating/relieving factors, and functional effect. Deselect "No Pain Reported at Visit" when pain is reported.
- For shoulder or neck pain, use the available "Other" location and specify the actual site. Record STM relief and red-flag education when dictated; do not invent specific red flags, negative screening findings, or numerical improvement.
- Leave unspecified pain scores blank and ask for them when needed. Do not assign a plausible score to complete the form.
- When the clinician says all mobility is now SBA, update the already-documented bed mobility, transfers, and gait to SBA and make the related narratives consistent. Preserve NA entries and unsupported blank activities. Remove an old claim of manual assistance when it conflicts with the new assistance level.
- Apply a dictated gait-distance increase to the loaded distance and keep the structured distance, gait response, progress-to-goals text, and summary consistent.
- When repetitions increase, preserve the documented number of sets. Update repetition-based exercises; do not convert a timed balance hold into repetitions. Document tolerance only as supplied.
- Describe observed improvement in strength without inventing a new MMT grade. Update subjective details such as intake, vomiting, or IV treatment only from the clinician's instructions.

## Plan defaults

- Always fill the next-visit plan. If no more specific plan is supported, enter **"Cont with PT POC"** and check **Plan for next visit**.
- Check **Discharge Planning** as the clinician's follow-up default and preserve the supported discharge destination. This checkbox does not establish that the patient has been discharged or received a written discharge notice.
- Format visit times with colons, such as `09:00` and `09:45`, and use the clinician's requested visit date. Preserve the existing year when the clinician supplies only month/day for the same scheduled visit.

## Save, verify, and authorized submission

- Use the user's selected, signed-in browser and its supported controls. Keep the current patient/task identity grounded in the visible page.
- Audit patient, visit date/time, vitals comment, pain, assistance, gait distance, exercise dose/response, summary, and plan before saving. Check the adjacent content affected by the dictated changes.
- Save unsigned by default. Wait for Kinnser's saving dialog to finish and verify the changed content.
- A form URL containing `frmRevisionGrpKey` may reopen an older revision even after a successful save. If a reload appears to restore old values, open Hotbox through the visible UI, locate the same patient/date/task, and open that PT Visit to check the current saved record. Do not repeatedly overwrite or re-save an older revision based only on its reload behavior. Prefer the current task URL obtained from that UI for subsequent verification.
- If the clinician reports a page glitch or asks to remember the form for a possible redo, preserve the current visible clinical fields and the clinician-dictated target changes before any reload or navigation. Save a readable recovery draft and, when useful, a field snapshot. Exclude passwords, electronic-signature codes, hidden controls, and session tokens. Reconcile the capture with the current record before restoring it. A request to preserve a possible redo does not authorize overwriting a record the clinician is fixing.
- Sign or submit only when the clinician explicitly authorizes that action in the current session. A supplied signature code plus an instruction to submit authorizes using that code for the current visit. Never store signature codes in this skill, logs, outputs, or reusable defaults.
- If the clinician says they will fix and submit, leave further correction and submission to them; that instruction supersedes an earlier request for the agent to submit.
- If submission identifies missing required clinical data, obtain it from the clinician rather than fabricating values. Verify the resulting submitted status or confirmation and report the actual outcome.

