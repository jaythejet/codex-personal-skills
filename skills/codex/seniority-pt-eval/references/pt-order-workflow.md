# PT Telephone Order Workflow

Create this order after the reviewed PT evaluation has been saved. Keep the saved evaluation open in its original tab and perform the patient/order navigation in a new tab in the same Chrome window. Never sign either record.

Keep the order's `Reasons` and `Goal` fields blank. Never add a separate reason or patient-specific goal list to the order; goals belong in the evaluation. Use only the approved Orders narrative below, with a DME block only for explicitly requested equipment.

## Navigate to the same patient

1. Retain the evaluated patient's full name, MR number, patient ID, episode ID, intake ID, evaluation date, evaluation visit start/end time, frequency, and effective date.
2. Keep the evaluation tab open and unchanged. From its top-left header, locate the blue patient-identification link showing the patient's name/MR number (and usually the address), read its destination, and open that destination in a new tab in the same Chrome window. Prefer creating or claiming the new tab and navigating it to the link destination instead of replacing the evaluation tab.
3. In the new tab, confirm the Patient record still matches the evaluated patient's name and MR number.
4. In that same new tab, open the exact `Orders / Telephone Orders` link. Prefer its stable href beginning `/pto/physiciantelephoneorder.aspx?patientId=...&episodeId=...&patintakeId=...`, and verify the patient, episode, and intake IDs against the target episode before navigating there.
5. Do not click `Go to Patient Chart View` and do not use or expand any episode-tree `Order / Telephone Order` node. The chart-tree route displays printable existing orders and is not the new-order workspace.
6. In the dedicated orders station, click `New Order / Telephone Order`.

If the blue patient/MR link is unavailable:

1. From the evaluation tab, read the destination of top-right `Patient` -> `Search for Patients` and open that destination in a new tab in the same Chrome window. Keep the evaluation tab unchanged.
2. Find the same patient using the verified name and MR number.
3. Click the MR number at the left of the matching row.
4. Confirm the patient identity on the main Patient record, then click its dedicated `Orders / Telephone Orders` link whose href begins `/pto/physiciantelephoneorder.aspx`.
5. Never return to Patient Chart View or use its episode-tree order node for creation.
6. In the dedicated orders station, click `New Order / Telephone Order`. Keep the original evaluation tab open throughout.

When the same verified patient IDs are already available, reuse them to confirm the destination. Never create an order for a merely similar name.

## Required fields

- Physician: preserve the patient's physician already selected for the order.
- Staff(s) for this order: click the field, type `Jason` using real keystrokes so the suggestion list opens, then select the exact suggestion `NGO, JASON QUANG PT`.
- Two Jason entries may appear. Always choose `NGO, JASON QUANG PT`; `QUANG` is the clinician's middle name. Do not choose `NGO, JASON PT`.
- Do not merely type or paste the staff name. Before saving, confirm the autocomplete selection resolves to the `NGO, JASON QUANG PT` record. The order editor may normalize its saved display to `JASON QUANG NGO, PT`; this is the same selected record when the exact autocomplete choice was made before saving. Confirm the normalized saved value after the save/reopen check.
- Do not click `Electronically Sign For CareStaff`.
- Order Date: evaluation date.
- Order Time: use 5 minutes before the evaluation visit's documented ending time. For example, an evaluation from `12:00 PM` to `12:45 PM` gets an order time of `12:40 PM`. Preserve AM/PM and do not calculate from the start time.
- Type of Order / Telephone Order: `Others`.
- Other-order label: append the evaluation's performed visit date in `M/D/YY` format. Use `PT EVAL & DME REQUEST - M/D/YY` when the order includes a DME request block; otherwise use `PT EVAL - M/D/YY`. For example, an evaluation performed on August 25, 2026 uses `PT EVAL - 8/25/26`.
- Leave Sent Date and Received Date blank so the order remains editable.
- Check `ORDER READ BACK AND VERIFIED`.

## Order narrative

Enter this text in `Orders`, substituting the verified effective/start date and frequency. Preserve the blank lines and put every intervention on its own line:

```text
Physical therapy evaluation, home safety assessment, and DME assessment were completed. Patient received education on safety and fall prevention, home exercise program (HEP) instruction, and mobility training as tolerated. Education was also provided on goal planning, the physical therapy plan of care, and expectations with skilled home health PT. Patient is expected to benefit from skilled PT services to help achieve goals, return to the prior level of function, and improve quality of life.

Effective/Start Date: [MM/DD/YYYY]
Physical Therapy Frequency (including evaluation): [FREQUENCY]

Interventions:
[x] Bed Mobility Training
[x] Transfer Training
[x] Gait Training
[x] Therapeutic Exercise Training
[x] Therapeutic Activity Training
[x] CG/family Training
[x] Fall Prevention Training
[x] Balance Exercise Training
[x] Assistive Device/DME Training
[x] Manual Therapy/STM
[x] Modalities & Pain management Training
[x] Neuromuscular Re-Education
[ ] Edema Management Training
[ ] Pressure Ulcer Prevention Training
```

Use the clinician's sent-email effective date and frequency exactly. The order date is the evaluation date. Flag any inconsistency before saving.

## DME request block

When the clinician's current findings or sent evaluation email documents requested DME, append this block immediately below `[ ] Pressure Ulcer Prevention Training`, separated by one blank line:

```text
DME Request:
- [Device]: [Patient-specific clinical rationale]
- [Device]: [Patient-specific clinical rationale]
- Height: [sourced height]
- Weight: [sourced weight]
```

- Copy the supported device names and rationale, lightly editing only for clear clinical prose.
- Prefer the clinician's current correction when it differs from the sent email, such as `rollator walker` instead of `rolling walker`.
- Include height and weight only when the clinician or matched source provides them.
- Omit unsupported devices, rationale, measurements, and unused template lines.
- Change the other-order label to `PT EVAL & DME REQUEST - M/D/YY`, using the evaluation's performed visit date.

## Intervention exceptions

- Keep all standard interventions marked `[x]`.
- Keep Edema Management Training and Pressure Ulcer Prevention Training unmarked by default.
- Mark either exception only when the clinician specifically documents that it applies, including a bedbound patient or relevant caregiver training.

## UltraHHC entry shortcuts

- Enter Order Date in `#CallerInformationOrderDate` with keystrokes, then press `Tab`; a direct programmatic fill may be cleared by the date formatter.
- Enter Order Time in `#CallerInformationTime`.
- Select `Others` in `#select` only after the date has persisted.
- Enter `PT EVAL & DME REQUEST - M/D/YY` in `[ng-model="ptoCtrl.ptoInput.OrdersOtherText"]` when a DME request block is present; otherwise enter `PT EVAL - M/D/YY`. Replace `M/D/YY` with the evaluation's performed visit date, without leading zeros (for example, `8/25/26`).
- Enter the narrative only in `#ContentPlaceHolder_ASPxMemoPhysicianOrders_I`. Leave `#ContentPlaceHolder_ASPxMemoReasons_I` and `#ContentPlaceHolder_ASPxMemoGoals_I` empty, and include their blank values in the save audit.
- Keep `#ptosentDate`, `#ptoSentTime`, `#ptoreceivedDate`, and `#ptoReceivedTime` blank.
- If the staff suggestions do not appear after typing `Jason`, remove and retype the final character, then inspect the refreshed visible list.
- Select the autocomplete row itself, not the text field or blank dropdown area. With this UltraHHC form, the accessibility link for a suggestion may be present but have no layout object, and clicking its AX index can fail. In that case, use the fresh screenshot and click the visible row by coordinates; place the click inside the row's full hit area, centered on the exact `NGO, JASON QUANG PT` option (the second Jason row when both are shown). Do not reuse coordinates from an earlier screenshot because the list can shift or change.
- Verify that the field changes from the search text (such as `Jason`) to the full selected staff record `NGO, JASON QUANG PT`. If it remains search text or selects `Ngo - INTOUCH, Jason PT`, remove that selection with its clear control, search again, refresh the final character if needed, and select the visible exact `QUANG` row. Save only after the selected record is confirmed and the second staff box remains blank.
- After saving, the form may display the same selected clinician in normalized name order as `JASON QUANG NGO, PT`. Treat this as confirmation only when the pre-save exact autocomplete selection was visibly verified; never use typed text alone as evidence of selection.
- For order-date focus loss, use the current accessibility index, select all, type the date, and press Tab.
- If the time spinner's rendered text appears stale after entry, verify the actual `#CallerInformationTime` input or the persisted saved-order time before changing it again.
- DevExpress memo APIs may return an empty value immediately after entry. Verify the Orders narrative in a fresh visible page snapshot and again in the saved record.

## Save boundary

1. Verify patient identity, selected staff `NGO, JASON QUANG PT`, order date, order time (evaluation ending time minus 5 minutes), the correct conditional other-order label, effective date, frequency, multiline intervention formatting, intervention marks, any sourced DME request block, and read-back checkbox.
2. Click `Save`.
3. Reopen the saved `Others - PT EVAL - M/D/YY` or `Others - PT EVAL & DME REQUEST - M/D/YY` order once, matching the evaluation's performed visit date and whether a DME request is present. If the success response already leaves the new saved-order editor open and the matching Unsent row is visible, use that persisted editor as the reopen check instead of clicking the row again.
4. Confirm the selected staff still reads `NGO, JASON QUANG PT`, the date/time persisted, Reasons and Goal remain blank, and the narrative retained its blank lines, effective date, frequency, and one-intervention-per-line layout.
5. Do not click `Electronically Sign For CareStaff` or any other signature action.
6. Leave the saved order open for the clinician to sign, and keep the saved evaluation open in its original tab.
