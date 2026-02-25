#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "$0")/.." && pwd)"
SKILLS_DIR="$ROOT_DIR/skills"
mkdir -p "$SKILLS_DIR"

clone_if_missing() {
  local url="$1"
  local target="$2"
  local dest="$SKILLS_DIR/$target"
  if [ -d "$dest/.git" ]; then
    echo "[setup_skills] "$target" already cloned, skipping."
  else
    echo "[setup_skills] Cloning $url -> $dest"
    git clone --depth 1 "$url" "$dest"
  fi
}

clone_if_missing "https://github.com/levineam/qmd-skill" "qmd-skill"
clone_if_missing "https://github.com/supermemoryai/openclaw-supermemory" "openclaw-supermemory"
clone_if_missing "https://github.com/seojoonkim/prompt-guard" "prompt-guard"

chmod +x "$ROOT_DIR/scripts/setup_skills.sh"

echo "[setup_skills] Lista de skills disponibles:"
ls -1 "$SKILLS_DIR"