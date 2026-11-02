#!/usr/bin/env bash
set -euo pipefail

usage() {
  echo "Usage: $0 [--backup-existing]"
}

mode="${1:-}"
if [[ -n "$mode" && "$mode" != "--backup-existing" ]]; then
  usage >&2
  exit 64
fi

repo_root="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
install_home="${CODEX_SKILLS_INSTALL_HOME:-$HOME}"
backup_root="$install_home/.codex-skill-backups/$(date +%Y%m%d-%H%M%S)"
conflicts=0
backed_up=0
linked=0

install_group() {
  local source_root="$1"
  local target_root="$2"
  local group_name="$3"
  local source target name backup_group

  mkdir -p -- "$target_root"

  for source in "$source_root"/*; do
    [[ -d "$source" ]] || continue
    name="$(basename -- "$source")"
    target="$target_root/$name"

    if [[ -L "$target" && -e "$target" && "$target" -ef "$source" ]]; then
      echo "Already linked: $target"
      continue
    fi

    if [[ -e "$target" || -L "$target" ]]; then
      if [[ "$mode" == "--backup-existing" ]]; then
        backup_group="$backup_root/$group_name"
        mkdir -p -- "$backup_group"
        mv -- "$target" "$backup_group/$name"
        echo "Backed up: $target -> $backup_group/$name"
        backed_up=$((backed_up + 1))
      else
        echo "Conflict (left untouched): $target" >&2
        conflicts=$((conflicts + 1))
        continue
      fi
    fi

    ln -s -- "$source" "$target"
    echo "Linked: $target -> $source"
    linked=$((linked + 1))
  done
}

install_group "$repo_root/skills/codex" "$install_home/.codex/skills" "codex"
install_group "$repo_root/skills/agents" "$install_home/.agents/skills" "agents"

echo
echo "Created $linked skill link(s)."
if (( backed_up > 0 )); then
  echo "Backed up $backed_up existing skill(s) under $backup_root."
fi

if (( conflicts > 0 )); then
  echo "Found $conflicts conflict(s). Review them, or rerun with --backup-existing." >&2
  exit 2
fi

echo "Installation complete. Restart Codex to reload the skills."
