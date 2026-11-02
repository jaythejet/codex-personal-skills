# SENIORITY RECERT section map

Use this map to decide what may be carried forward and what must be reassessed in the new episode. The live form controls and patient-specific sources remain authoritative.

## A — Administrative information

Check:

- agency/branch, physician, certification dates, patient demographics, address, representative/contact, and insurance;
- COVID screening, completing discipline and staff, M0090 date, priority, advance-directive order, time in/out, and emergency contact;
- M0100 recertification reason, caregiver/living arrangement, support, safety, coordination, and vaccines.

Usually preserve system-populated disabled identity and episode fields. Verify stable contacts and caregiver information. Always make the visit date/time, discipline/staff, current screening, recent vaccines, and current support findings episode-specific.

## G — Functional status

Check:

- mental status and functional limitations;
- M1800 grooming, M1810 upper-body dressing, M1820 lower-body dressing, M1830 bathing, M1840 toilet transfer, M1850 transferring, and M1860 ambulation/locomotion;
- MAHC-10/fall-risk elements and total;
- musculoskeletal, mental-status narrative, neurological/emotional/behavior findings, and HHA indications.

Use prior codes only as comparison. Reassess current assistance, mobility, safety, cognition, and fall-risk elements. Keep narratives consistent with the selected codes.

## GG — Functional abilities and goals

Check:

- activities permitted and allergies;
- GG0130 self-care follow-up performance;
- GG0170 mobility follow-up performance, including bed mobility, transfers, walking, steps, and wheelchair/scooter items;
- safety measures and assistive-device precautions.

Treat every GG score as a current follow-up performance code. Reconcile each score with G, the current gait/transfer findings, assistive devices, and supervision requirements.

## J — Health conditions

Check:

- M1033 risk for hospitalization using the stated lookback periods;
- pain tool, pain intensity/sites/patterns/relief/functional impact, and pain-control comments;
- current vitals;
- eyes, nose, mouth, throat, cardiopulmonary, endocrine, urinary, bowel, nutrition, diet, psychosocial, abdomen, and infusion findings;
- medication affordability/psychotropic use, cognition, prognosis, and advance directives.

Never carry old vitals or pain ratings as current. Recalculate time-window risk items and medication-count items from current facts. Use `No Problem` or `N/A` only when current assessment supports it.

## M — Skin conditions

Check:

- M1306 pressure-ulcer/injury screening and any conditional OASIS wound items;
- wound care performed, location, technique, products, tolerance, and comments;
- diabetic foot exam;
- every wound/lesion's date, location, type, dimensions, tunneling, undermining, stage, odor, surrounding skin, edema, wound bed, and drainage.

Treat prior wounds as history until current wound documentation confirms their status. A previously absent wound does not prove intact skin today; a prior wound does not prove it remains open. Keep M answers consistent with diagnoses, skilled interventions, supplies, and goals.

## Active Diagnoses and long care plan

Check:

- primary and other diagnoses, ICD-10 codes, onset dates, and symptom-control ratings;
- strengths, limitations, disability/impairment, safety impact, mitigation, and significant changes;
- refused care/services and risk-factor follow-up;
- care preferences/personal goals and patient/caregiver education;
- skilled interventions/instructions by discipline and care provided this visit;
- summary checklist, care-plan status, medication status, coordination, analysis, homebound reason, and next/supervisory visit planning;
- care summary by discipline, DME/medical supplies, assessment summary, and supply categories;
- professional services and frequencies for SN, PT, OT, ST, HHA, homemaker, and MSW;
- discipline goals with target dates, discharge plans, rehabilitation potential, and changes since the last assessment.

Sequence diagnoses to support the actual skilled services. Use current onset dates and ratings. Reconcile every plan component with current diagnoses, findings, homebound status, ordered disciplines, frequencies, and measurable goals.

## Medications

Reconcile each row against the current Medication Profile:

- start/date, medication name and strength, directions/frequency, classification, required labs, new/change/old status, discontinuation date, and source.

Do not use the old RECERT table as the source of truth. Remove or mark discontinued medications only when the current profile or clinician source supports it. Make medication count agree with M1033 and polypharmacy/fall-risk answers.

## Cross-section consistency checks

- G mobility and ADLs ↔ GG performance ↔ homebound reason ↔ PT/OT/HHA services and goals.
- Mental status ↔ cognitive code/narrative ↔ supervision and medication-management needs.
- Pain ↔ diagnoses ↔ functional limitation ↔ interventions and goals.
- Fall risk ↔ device/assistance ↔ safety measures ↔ education and homebound rationale.
- Wounds ↔ M1306/wound grid ↔ diagnoses ↔ skilled nursing, supplies, and wound goals.
- Medication list/count ↔ M1033 ↔ MAHC-10/polypharmacy ↔ medication education.
- Diagnoses ↔ body-system findings ↔ skilled need ↔ discipline frequencies ↔ discharge plan.
- Significant-change answers ↔ every current narrative and changed code.
