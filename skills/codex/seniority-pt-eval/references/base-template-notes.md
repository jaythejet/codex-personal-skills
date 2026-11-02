# Supplied SENIORITY JavaScript base

Use the clinician-supplied bookmarklet as a field map and starting structure only.

Key observed behavior:

- Uses native input/textarea value setters plus input, change, keyboard, blur, and optional jQuery events.
- Uses repeated checkbox-click fallbacks.
- Populates PT diagnosis, prior function, ROM/strength, mobility, balance, gait, pain, cognition, endurance, goals, precautions, plan of care, interventions, coordination, response, and next-visit fields.
- Prompts for vitals but supplies randomized defaults.

Safety rule: remove randomized values and replace every patient-specific-looking default with record-supported or clinician-provided data before charting.
