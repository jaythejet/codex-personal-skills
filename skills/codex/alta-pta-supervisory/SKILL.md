---
name: alta-pta-supervisory
description: Prepare, revise, and save Alta/VTTECS PTA supervisory compliance Care Coordination Notes, including the supervisory note accompanying a PFR. Distinct from PTA visit co-signing and the LVN/CHHA Supervisory Visit form.
---

# Alta PTA Supervisory

Use the existing Alta patient chart in Chrome. Follow the available Chrome-control documentation and [Veertech charting skill](../veertech-pt-charting/SKILL.md).

## Correct form

Use **MDO/Care Coordination > Add > Care Coordination Notes**. Set Title/Subject to **PT Supervisory Visit for PTA Services**.

Do not use Notes > Supervisory Visit Notes: that form is for LVN/CHHA ratings. The separate PFR treatment order uses MDO/PT Care Coordination Notes; the PTA supervisory compliance note uses the general Care Coordination Notes form. Do not create a billable PT visit merely to document supervision.

Check for a matching note for the same patient/date before creating one. Obtain the actual PTA name from the clinician or chart; do not permanently default to a PTA from a different patient.

## Fields and clinician preferences

- Use the requested supervisory/PFR date, not today's date. Enter the clinician-supplied time; do not invent an unprovided time.
- Title/Subject (`titlesubject`): `PT Supervisory Visit for PTA Services`.
- Communication Notes (`communicationnotes`): the template below, retaining all ten items and the summary when the clinician requests the standard all-compliant note. Tailor any exceptions the clinician reports and never assert unconfirmed findings solely because they are in the template.
- Start the narrative with `PTA Supervisory / PFR Compliance Note:`. **Do not prepend `PTA: <name>` or another staff-name heading.** Put the PTA's name in the structured PTA field.
- Select PT (`coordinationofcarewithpt`) and PTA (`coordinationofcarewithpta`). Enter the supervising PT and actual PTA in their associated name fields (`coordinationofcarewithpttext`, `coordinationofcarewithptatext`).
- **Select both Phone and Fax every time**, per the clinician's explicit preference (`communicatedviaphone`, `communicatedviafax`).
- Discipline Name (`disciplinename`): the current supervising PT. Jason's requested display is `NGO, JASON QUANG`; automatically populated `JASON QUANG NGO` is the same identity. Use supported form controls rather than bypassing a read-only field.
- Discipline Date (`disciplinedate`): match Order Date (`orderdate`).

## Standard compliance narrative

```text
PTA Supervisory / PFR Compliance Note:
1. Follows initial evaluation and established plan of care.
2. Complies with HIPAA regulations.
3. Adheres to agency dress code and policies.
4. Demonstrates professionalism in all patient interactions.
5. Maintains punctuality and reliability with scheduled visits.
6. Patient and family report satisfaction with care provided.
7. Completes accurate and timely clinical documentation.
8. Communicates and documents changes in patient condition and treatment to MD/DPCS as indicated.
9. Performs treatments and teaching as outlined by supervising PT.
10. Assists patient in developing and demonstrating appropriate self care techniques.

Summary: All areas reviewed and found compliant. Services remain consistent with the established plan of care. Patient is progressing toward goals.
```

## Save, submit, and verify

Fill the observed fields with supported browser controls. The clinician's pasted JavaScript specifies desired fields; it need not be executed. Do not apply duplicated pasted code twice.

Keep signature/submission within current-session authorization. When the clinician says **submit after edit**, save the final wording and then submit/resubmit that note; verify final status. This phrase is not perpetual authorization to submit unrelated records or future patients. A PFR signature does not by itself authorize signing this separate note. Preserve a signature the clinician has applied and never store an e-sign code.

Click Save once and wait for the asynchronous result. Inspect and acknowledge the success alert before another Save or Close. If the AX tree and visible modal disagree, inspect the screenshot. A still-open editor does not imply save failure. Verify the saved note ID/row, title, date/time, full narrative without a name heading, PT/PTA names, both Phone and Fax, discipline date, signature, and submission status.

When the clinician is editing concurrently, refresh and preserve their changes. Repeated Save on an Add form can create duplicate records; inspect existing rows before retrying. Leave the requested saved note available for review.
