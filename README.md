# Personal AI skills

A collection of reusable agent skills for Codex and other AI assistants that support the Agent Skills format. Each skill is a folder containing `SKILL.md`; optional `references/`, `assets/`, or `agents/` files provide extra context. Assistants that do not install skills can read the relevant `SKILL.md` and referenced files directly.

## Skills

### `skills/codex`

- `alta-pfr`
- `alta-pt-eval`
- `alta-pta-cosign`
- `alta-pta-supervisory`
- `altadco`
- `jason-texting-style`
- `kinnser-pt-discharge`
- `kinnser-pt-follow-up`
- `seniority-pt-discharge`
- `seniority-pt-eval`
- `seniority-pt-follow-up`
- `seniority-pt-recert`
- `seniority-pt-reeval`
- `seniority-recert` (legacy OASIS workflow)
- `veertech-pt-charting`
- `weekly-visit-calendar`

### `skills/agents`

- `fable-debugging`
- `fable-design`
- `fable-method`
- `fable-shipping`
- `fable-two-machines`
- `kinnser-general-eval`
- `source-command-handoff`

## Using a skill

Give your AI assistant the skill folder or its `SKILL.md`, and ask it to follow the instructions when the skill applies. Keep supporting files beside `SKILL.md` so relative references resolve. Some skills describe workflows for specific services or apps and require those services and permissions to be available in the assistant's environment.

## Install on a MacBook with Codex

1. Install and sign in to GitHub CLI if needed:

   ```bash
   brew install gh
   gh auth login
   ```

2. Clone the repository and run the installer:

   ```bash
   mkdir -p ~/Developer
   gh repo clone jaythejet/codex-personal-skills ~/Developer/codex-personal-skills
   cd ~/Developer/codex-personal-skills
   ./install-mac.sh
   ```

3. Restart Codex so it reloads the skills.

The installer creates symbolic links, so future repository updates become available after:

```bash
cd ~/Developer/codex-personal-skills
git pull --ff-only
```

If a skill with the same name already exists on the Mac, the installer leaves it untouched and reports a conflict. To move conflicts into a timestamped backup and replace them with repository links, run:

```bash
./install-mac.sh --backup-existing
```

Backups are stored under `~/.codex-skill-backups/`.

## Privacy

This repository contains reusable workflows for home-health documentation and a de-identified patient-derived example. Do not add patient records, downloaded clinical PDFs, screenshots, credentials, or `.env` files.
