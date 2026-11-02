---
name: altadco
description: Complete, revise, sign when explicitly authorized, and save physical-therapy discharge OASIS forms in Alta/VTTECS at alta.vttecs.com/patientcare. Use when the user says Alta DCO, DCO, discharge OASIS, off-the-DCO, or invokes $altadco.
---

# Alta DCO

Use the open Chrome tab at `https://alta.vttecs.com/patientcare/`.

## Browser workflow

1. Read and follow the Chrome-control skill.
2. Read the selected Alta tab with `getTabContext`, then verify it through the current Chrome tab list before claiming it.
3. If Playwright fails with `this._engines.set is not a function`, stop retrying it. Use `tab.dom_cua.get_visible_dom()` and screenshots.
4. Use DOM node IDs for inspection and simple interactions. Use coordinate clicks for embedded controls that do not respond.
5. If typing or clipboard operations fail, focus the field and enter text with `tab.cua.keypress()`. Pass characters as a key array.
6. Treat screenshots as authoritative for changed textareas and inputs because visible DOM can show loaded/original values.
7. Batch stable field entry within each tab, then take one verification screenshot. Use additional click-wait-inspect cycles only for dependent controls, warnings, or failed interactions.

## Core rules

- Click **Load data** first when starting an unpopulated DCO. Preserve loaded prior-OASIS information unless discharge findings require an update.
- Do not toggle populated checkboxes casually. Toggling can clear dependent pain or assessment fields.
- After changing a checkbox, visually verify the intended box remains checked.
- “Check a tab” means inspect every question and confirm that each required checkbox is visibly checked. Merely opening the tab does not count.
- For every tab, first scroll to its true top. Inspect the visible controls, scroll downward one viewport at a time, refresh the visible DOM after each scroll, and continue until the scrollbar reaches the true bottom.
- Do not move to the next tab until every applicable question discovered at every scroll position has one visibly checked response or a completed value.
- Refer to the patient as `Pt.`
- Improve discharge values consistently with the dictated findings without inventing unsupported clinical details.

## Tab workflow

Start at **Patient Tracking** and explicitly open, inspect, and complete every tab in this exact order. Do not skip a tab because it appears complete:

1. **Patient Tracking**
   - Preserve loaded demographics and episode information.
   - Preserve already-entered visit dates and times. Enter or change time in/time out only when supplied or when Alta explicitly requires a missing value to save.
2. **Administrative Information**
   - Select PT.
   - Complete assessment and discharge dates, discharge reason, emergent-care status, inpatient status, community disposition, and medication reconciliation.
   - Set M2410 to NA.
3. **Hearing, Speech & Vision**
   - Do not leave the tab blank. Select a response for every applicable hearing, speech, and vision question.
   - Preserve loaded findings; for an independent patient, use the least-impaired supported response and use Rarely when directed.
4. **Cognitive Patterns**
   - Audit the entire tab from top to bottom; do not stop after the first cognitive section.
   - Complete C0100 and every applicable lower-page cognitive item. For a cognitively intact independent patient, use the least-impaired supported responses.
   - Set M1700 to `0`.
   - Set M1710 to `Never`.
   - Set M1720 to `None of the time`.
5. **Mood**
   - Use 0 responses when directed and Never for social isolation.
6. **Behavior**
   - Audit the entire tab from top to bottom and do not leave any applicable behavior group blank.
   - Select None of the above and Never when applicable.
7. **Preferences for Customary Routine Activities**
   - Preserve caregiver information.
   - When directed, record non-agency caregiver assistance for A, C, D, and F.
8. **Functional Status**
   - Improve performance according to the dictated discharge level.
   - For an independent patient without an assistive device, select independent grooming, dressing, bathing, toilet transfer, transfers, and ambulation when supported.
   - Set M1845 to `0`.
9. **Functional Abilities & Goals**
   - Scroll through the entire tab from top to bottom.
   - Visually confirm every required checkbox is checked, including off-screen wheelchair/scooter and other follow-up items.
   - Explicitly interact with every discharge-performance dropdown, even when `06` is already displayed.
   - For a generally independent patient, use mostly `06` but add supported `05` scores to make demanding activities clinically believable. Typical harder items include shower/bathing, car transfer, uneven surfaces, curb/step, and 4- or 12-step stairs.
   - Do not use all `06` values by default, and do not assign `05` to an activity unless setup/cleanup assistance is plausible.
   - Select no wheelchair/scooter use when applicable.
   - Do not leave this tab unfinished.
10. **Bowel & Bladder**
    - Do not leave the tab blank. Select a response for every applicable bowel and bladder question.
    - Complete no UTI and applicable urinary and bowel continence responses; use the least-impaired supported discharge response.
11. **Health Conditions**
    - Set J0510 to `Does not apply`.
    - Record no falls when supplied.
    - Use Never for applicable frequency items.
    - Set M1400 to response `2`, moderate exertion.
12. **Swallowing/Nutritional Status**
    - Preserve nurse-entered nutritional findings unless the user explicitly corrects them.
    - For this patient's established profile, use a regular diet; do not select liquid or therapeutic diet merely because it appeared in an earlier dictation.
    - Record independent eating when supported.
13. **Vital Signs/Pain**
    - Enter dictated vitals and pain findings.
    - If a loaded pain-site checkbox must be toggled to enable controls, restore and visually verify the location, type, today/worst/best/most-days intensities, and description.
14. **Skin Conditions**
    - Leave not applicable when no skin condition is present.
15. **Medications**
    - Use the applicable none/NA response and independent medication management when supported.
16. **Special Treatment, Procedures, and Programs**
    - Leave non-applicable items blank unless directed.
17. **Participation in Assessment and Goal Setting**
    - Preserve the required intervention selections:
      - Falls prevention: Yes.
      - Depression intervention: NA.
      - Pain monitoring/mitigation: Yes when pain is present.
      - Pressure-ulcer prevention: NA.
      - Pressure-ulcer treatment: NA.
    - For Reason for Discharge, normally select **No further care needed**.
    - When the user directs continued outpatient participation such as cardiac rehab, select **Other** and enter the concise patient-specific value requested (for example, `Cardiac rehab`). User direction overrides the normal no-Other default.
18. **Endocrine**
    - Leave blank unless diabetes or another endocrine finding is supplied.
19. **Cardiovascular**
    - Preserve loaded information unless updated findings are supplied.
20. **Additional Assessments**
    - Preserve and complete the individualized emergency plan as directed.
    - Replace any recertification/continued-PT text in the bottom assessment box with a personalized DC assessment covering progress, pain improvement, final function/assistive device, goal attainment, and appropriateness for discharge.
    - Write a polished, generic PT discharge assessment in approximately 5–7 concise sentences. Cover progress, decreased pain, final functional level, assistive-device status, goal attainment, safety/tolerance, and why skilled HH PT is no longer needed.
    - Add one or two supported closing sentences beyond the basic summary, such as improved activity tolerance and safety with household mobility and appropriateness to continue the instructed program or transition to cardiac rehab. Do not invent unsupported findings.
    - Example structure: `Pt. demonstrated meaningful progress during the home-health PT episode with decreased pain and improved functional mobility. Pt. is modified independent with transfers, gait, and routine functional activities without an assistive device. Pt. has met or substantially achieved established PT goals and demonstrates improved safety and activity tolerance. Pt. no longer requires skilled home-health PT intervention. Pt. is appropriate for discharge and plans to continue progression through cardiac rehabilitation.` Adapt rather than copy when the chart differs.
21. **Clinician/Signature**
    - Verify clinician name/title and date.
    - Sign only when the user explicitly authorizes the exact signature.
    - Use Alta's **Sign** control first. If it spins without populating, verify required order/date/time fields are saved, dismiss any warning, and retry once.
    - Manually enter a signature only when signing is explicitly authorized and the exact stored signature text is already known; save again and visually confirm the rendered signature.

## Discharge Order / MDO page

If the selected page is a separate **Discharge Order** or **MDO/Care Coordination** form rather than the OASIS DCO:

- Treat it as a separate document and verify the patient and order date before editing.
- Complete the all-goals-met discharge communication, discharge-from-home-health order, read-back verification, patient coordination name, communication method, and any other user-directed fields.
- Preserve entered dates. If Alta reports `Time Required`, enter the supplied order time. If none was supplied, use a neutral required value only when the user has authorized completing all missing order metadata, and report that choice.
- Save before signing, dismiss the success alert, then sign with the authorized clinician signature and save again.
- Visually verify that the signature remains rendered after the final save.

## Final verification

Before saving, visually confirm:

- every intended checkbox remains checked;
- every tab reached its true top and true bottom, with a fresh DOM/screenshot inspection after scrolling;
- every applicable checkbox group has exactly one visible response selected;
- every Functional Abilities & Goals dropdown was explicitly completed;
- Reason for Discharge matches the user's direction (normally **No further care needed**, or **Other** with the specified transition such as cardiac rehab);
- the bottom Additional Assessments box contains the personalized DC assessment;
- vitals, pain location/type/intensities, clinician, date, and signature are correct.

Save only when authorized. Report any site warning, verify the saved form, and leave the requested next tab open.
