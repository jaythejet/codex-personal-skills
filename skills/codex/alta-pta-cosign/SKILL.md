---
name: alta-pta-cosign
description: Review and co-sign PTA physical-therapy follow-up notes in ALTA/VTTECS at alta.vttecs.com/patientcare. Use when the user asks to co-sign PTA notes, approve PTA visits, review all PTA follow-ups on an ALTA patient chart, decline problematic notes, remove duplicate drafts, or prepare a correction message for the PTA.
---

# ALTA PTA Co-sign

Use the selected ALTA Chrome tab. Read the selected tab with `getTabContext` first, then read and follow the Chrome-control skill before browser actions. Review the entire visible note list from newest to oldest; do not stop after one error or one declined note.

## Scope

- Process only **PT Notes - Follow-up** completed and e-signed by a PTA.
- Ignore SN and other disciplines.
- Do not co-sign blank or incomplete **Unsent** drafts that lack the PTA signature. Record them separately as duplicates/incomplete drafts when appropriate.
- Preserve notes already co-signed by the supervising PT.
- Continue until no eligible PTA-signed follow-up remains.

## Review before signing

Read the full note, including date, visit time, vitals, mental status, homebound status, assessment, interventions, response, next-visit plan, PTA name/title, PTA signature, and reviewer fields.

Hold the individual note and continue to the next one when documentation is missing, internally inconsistent, clinically concerning, or appears erroneous. Examples include:

- improbable visit times or timing inconsistent with the signature timestamp;
- abnormal vitals without reassessment, patient response, intervention, or notification when applicable;
- a blank Plan for Next Visit;
- surgery, hospitalization, fall, new symptoms, or another material event without adequate coordination or precautions;
- mental-status selections that conflict with the narrative. Do not assume all home-health patients are impaired. Document the patient-specific status; when supported, prefer Alert/Oriented x3 and Forgetful over WNL if forgetfulness is present;
- duplicate or incomplete drafts.

Do not invent a red flag. Optional blank fields are not automatically defects when the completed note otherwise supports the clinical picture.

## Co-sign an eligible note

Before the first co-sign action, require the current supervising PT to provide or explicitly confirm both (a) their own **Reviewed/Approved by** identity as displayed in ALTA and (b) their own e-sign code in the current conversation. Never use another clinician's identity or code. Never hard-code a clinician identity or e-sign code. Use only values the current clinician explicitly provides or confirms in this session. Never store an e-sign code in this skill or carry it into a later conversation.

1. Select the note and confirm the PTA e-signature is present and the supervising PT signature is absent.
2. Click **Edit** and scroll to the reviewer section.
3. Enter the current supervising PT's explicitly confirmed ALTA reviewer identity in **Reviewed/Approved by**.
4. Click **Sign** and enter that supervising PT's e-sign code supplied in the current conversation.
5. Verify the rendered e-signature matches the current supervising PT's confirmed identity before saving. Stop without saving if it shows a different clinician.
6. Click **Save**, acknowledge the successful-update alert, click **Close**, and confirm **Yes**.
7. Reopen or reread the saved note when needed to verify the reviewer name and signature persisted.

The user's request to co-sign the chart authorizes saving eligible notes, but never authorizes signing a held/red-flag note.

## Browser handling

If normal Playwright control fails with the embedded-engine error, claim the verified tab by its current ID and use `dom_cua`, screenshots, and coordinate clicks as directed by the Veertech PT charting skill. Refresh the visible DOM after scrolling because node IDs can change. If text entry fails through the clipboard bridge, focus the field, press Ctrl+A, and use keypress input with spaces mapped to `SPACE`.

## Completion report

At the end, report:

- notes co-signed and saved;
- notes already co-signed;
- notes declined, with one specific reason each;
- incomplete/duplicate unsigned drafts that were not eligible.

Then provide a short, ready-to-send message addressed to the specific PTA. Group corrections by visit date, use plain language, and end by asking the PTA to correct and resubmit the notes. Do not include resolved concerns or notes the user says are acceptable.
