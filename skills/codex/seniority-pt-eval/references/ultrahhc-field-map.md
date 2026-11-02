# UltraHHC PT Evaluation Field Map

The PT evaluation is inside the single visit-note `iframe`. Scope all controls to that frame.

Use this direct-entry map as the default workflow. It is faster and avoids randomized bookmarklet values.

## Grouped defaults

- Strength selector: `textarea[id^="dsl_"][id*="_strength_"][id$="_right"], textarea[id^="dsl_"][id*="_strength_"][id$="_left"]`
  - Expected count: 48
  - Default: `3+/5`
- ROM selector: `textarea[id^="dsl_"][id*="_rom_"][id$="_right"], textarea[id^="dsl_"][id*="_rom_"][id$="_left"]`
  - Expected count: 48
  - Default: `WFL`

If a grouped fill times out, refresh the DOM snapshot and use the exact IDs from the baseline asset rather than positional selectors. Verify that all 48 values in each group match.

## Standard fields

| Field ID | Default |
|---|---|
| `dsl_prior_functional_level` | `Needs assistance with ADLs and functional mobility` |
| `dsl_balance_sit_static` | `Fair+` |
| `dsl_balance_sit_dynamic` | `Fair` |
| `dsl_balance_stand_static` | `Fair` |
| `dsl_balance_stand_dynamic` | `Fair-` |
| `dsl_pain_location` | `Denies pain at this time` |
| `dsl_vision` | `Unremarkable` |
| `dsl_hearing` | `Unremarkable` |
| `dsl_speech` | `Unremarkable` |
| `dsl_posture` | `Mild kyphosis, forward head posture, rounded shoulders` |
| `dsl_adl_needs` | `Requires assistance with ADLs` |
| `dsl_cognition` | `A&O x3, forgetful` |
| `dsl_safety_precautions` | `Monitor vitals and fall risk.` |
| `dsl_next_visit` | `Next visit as scheduled.` |

Keep `dsl_plan_to` generic and undated. Do not add episode-end dates, target dates, visit dates, or other calendar dates unless the clinician explicitly dictates one for the current note.

## Required patient-specific entries

- Enter `FWB` in `dsl_ambulation_wb` as the clinician-authorized default unless the clinician or patient-specific records specify a different weight-bearing status or restriction.
- Enter the clinician-measured respiratory rate in `vs_resp_rate`. If it is not provided, ask the clinician before the final save.
- Set transfer and bed-mobility goal assistance to the clinician-directed level. Use SBA when directed by checking the corresponding SBA control and clearing conflicting assistance levels.
- For the gait goal, carry the current assistive device into `dsl_goals_improve_amb_gait_with_field`. Unless the clinician explicitly provides another patient-specific goal, check `dsl_goals_improve_amb_gait_with_sba_assist`, clear the conflicting gait-goal assistance checkboxes, and enter `150` in `dsl_goals_improve_amb_gait_with_mod_assist_field` (the form's distance box). Clinician-directed gait goals commonly range from 150 to 300 ft; never replace an explicit goal with the 150-ft default.
- Set the balance goal to the patient-appropriate level. For a significantly unbalanced patient, check `dsl_increase_balance_fair` and clear `dsl_increase_balance_good`; do not default the goal to Good.

## One-pass pre-save audit

Read these controls together and change only mismatches:

| Purpose | Control |
|---|---|
| Respiratory rate | `vs_resp_rate` |
| WB Status | `dsl_ambulation_wb` |
| Gait goal device | `dsl_goals_improve_amb_gait_with_field` |
| Gait goal SBA | `dsl_goals_improve_amb_gait_with_sba_assist` |
| Gait goal distance | `dsl_goals_improve_amb_gait_with_mod_assist_field` |
| Transfer goal SBA | `dsl_goals_improve_transfer_skills_sba` |
| Bed-mobility goal SBA | `dsl_improve_bed_mobility_sba` |
| Balance goal Fair | `dsl_increase_balance_fair` |
| Balance goal Good | `dsl_increase_balance_good` |
| Coordination SN | `dsl_coordination_of_care_with_sn` |
| Coordination PT | `dsl_coordination_of_care_with_pt` |
| Coordination MD | `dsl_coordination_of_care_with_md` |
| Coordination Other | `dsl_coordination_of_care_with_other` |
| Coordination Other text | `dsl_coordination_of_care_with_other_field` |

Also include BP, pulse, temperature, Brief Medical Hx, gait distance/device/assist, frequency, assessment opening, rehab potential, goal timeframes, and next visit in the same targeted audit.

After clicking Save, confirm `Updated Successfully!`. If that signal is missed or absent, reopen the evaluation once and verify the changed values persisted before reporting success.

## Strength goal and rehab potential

- Enter `BLE` in `dsl_goals_increase_muscle_strength_field`.
- Enter `+0.5/5 MMT to baseline` in `dsl_goals_increase_muscle_strength_to_grade`.
- Check `dsl_rehab_potential_fair`.
- Uncheck `dsl_rehab_potential_good`.

## PT/caregiver response

Enter in `dsl_pt_cg_response_tx`:

`Pt. and CG tolerated treatment well. Pt. remained asymptomatic with no adverse signs observed. Pt. and CG verbalized understanding of HEP, safety precautions, and PT POC. Agency and MD made aware. Will continue with established POC.`

## Goal timeframes

When entering or updating goal timeframes in weeks, always use whole numbers. Round any partial week up to the next whole week (ceiling); never enter decimal weeks. For example, 26 days becomes 4 weeks. Apply this to calculated, copied, and clinician-provided fractional goal durations. Preserve actual calendar dates and the verified episode end; rounding a duration does not change those dates. This rule applies only to goal durations, not clinical measurements or numeric goal targets.

Check `dsl_problem_list_hep` and `dsl_problem_list_hep_none`; leave `dsl_problem_list_hep_poor` unchecked unless the clinician explicitly directs otherwise. Check `dsl_indep_in_hep` and use 2 weeks for its goal.

## Generic Plan of Care

### Skilled Intervention Provided @ This Visit

Enter in `dsl_skilled_intervention_provided`:

`PT initial evaluation, functional mobility and gait training, therapeutic exercise, postural training, and instruction in HEP, fall prevention, safety, pain management, and PT plan of care/goals.`

Keep this field generic. Do not append patient-specific diagnoses, devices, gait distance or assistance, pain details, fatigue, or treatment response. Document those in the dedicated findings/assessment/response fields. Remove an intervention if the clinician explicitly says it was not performed.

### Plan of Care sections

Populate applicable sections as planned interventions. Check each corresponding section when entering its text. Preserve patient-specific gait device, distance, and assistance in B5. Leave unrelated modalities unchecked and do not invent exercise dosage.

| Section / text field | Generic wording |
|---|---|
| B2 Other: `dsl_plan_of_care_b2_other_field` | Progressive therapeutic exercises to improve strength, range of motion, and activity tolerance as tolerated. |
| B4: `dsl_plan_of_care_b4_home_program` | Instruct and progress individualized HEP for strength, balance, mobility, and safety; provide patient/caregiver education. |
| B11: `dsl_plan_of_care_b11_muscle_reeducation` | Neuromuscular reeducation to improve balance, coordination, postural control, and safe functional mobility. |
| B12: `dsl_plan_of_care_b12_evaluation_of_pt_careplan` | Assess response to treatment and progress toward PT goals; review and modify the plan of care as indicated. |
| Balance: `dsl_plan_of_care_balance_training_field` | Static and dynamic balance training for safe functional mobility. |
| `dsl_plan_to` | Continue skilled PT per plan of care; progress exercises and functional mobility training as tolerated and reassess response. |

For B2 generic exercise text, check `dsl_plan_of_care_b2` and `dsl_plan_of_care_b2_other`. For B3, select the applicable transfer types rather than leaving the checked section without selections. B11 and B12 must have both their checkbox checked and generic narrative populated. Keep pain/STM location patient-specific when applicable.

## Goal timeframe fields

| Field ID | Weeks |
|---|---:|
| `dsl_problem_list_decreased_bed_mobility_skills_timeframe` | 2 |
| `dsl_problem_list_hep_timeframe` | 2 |
| `dsl_problem_list_decreased_ambulation_gait_timeframe` | 9 |
| `dsl_problem_list_decreased_transfer_skills_timeframe` | 9 |
| `dsl_problem_list_decreased_muscle_strength_timeframe` | 9 |
| `dsl_problem_list_decreased_rom_timeframe` | 9 |
| `dsl_problem_list_decreased_endurance_timeframe` | 9 |
| `dsl_problem_list_decreased_balance_timeframe` | 9 |
| `dsl_problem_list_decreased_posture_timeframe` | 9 |

## Coordination and assessment

- Always check `dsl_coordination_of_care_with_sn`, `dsl_coordination_of_care_with_pt`, and `dsl_coordination_of_care_with_md`.
- Treat first-person email wording such as `I will follow up` as the clinician retaining the patient.
- If the newest email does not explicitly name another clinician who will follow up, leave `dsl_coordination_of_care_with_other` unchecked and clear `dsl_coordination_of_care_with_other_field`; do not add `PTA`.
- Check `dsl_coordination_of_care_with_other` and enter the supported role or name only when the newest email explicitly assigns a different clinician to follow up.
- Assessment field: `dsl_coordination_of_care`.
- Start the personalized assessment exactly with `Pt. is [age] years old`.

## Targeted verification

Confirm:

- measured BP, pulse/heart rate, respiratory rate, and temperature; ask when respiratory rate is omitted;
- WB Status is `FWB` by clinician-authorized default, or the documented patient-specific exception;
- RR and temperature units exactly as charted; stop for clarification rather than silently converting units;
- all strength and ROM counts/values;
- prior function, balance, pain, sensory fields, speech, posture, ADL needs, cognition, endurance, and the exact safety precaution `Monitor vitals and fall risk.` unless the clinician adds patient-specific precautions;
- CLOF across bed mobility, transfers, gait, gait goals, and progressive gait training;
- gait goal uses the current device with SBA and 150 ft by default, or the clinician's explicit patient-specific goal between 150 and 300 ft;
- `ft` in the ambulation-distance field;
- short- and long-term goal timeframes;
- `BLE` strengthening target and `+0.5/5 MMT to baseline`;
- Fair rehab potential with Good unchecked;
- standard PT/caregiver-response wording;
- SN, PT, and MD checked, with Other coordination present only for an explicitly named follow-up clinician;
- visit frequency and effective date;
- `Next visit as scheduled.`;
- evaluation is saved unsigned after the audit; confirm success once, then continue to the order.
