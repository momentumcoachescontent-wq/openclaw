#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "$0")/.." && pwd)"
SKILLS_DIR="$ROOT_DIR/skills"
SKILLS=(
  "qmd-skill"
  "openclaw-supermemory"
  "prompt-guard"
  "dont-hack-me"
)

missing=()
for skill in "${SKILLS[@]}"; do
  if [ -d "$SKILLS_DIR/$skill" ]; then
    echo "[verify_skills] $skill ✔"
  else
    echo "[verify_skills] $skill ✘ (missing)."
    missing+=("$skill")
  fi
done

if [ ${#missing[@]} -gt 0 ]; then
  echo "[verify_skills] Algunas skills faltan: ${missing[*]}"
  echo "[verify_skills] Ejecuta ./scripts/setup_skills.sh y vuelve a intentarlo."
  exit 1
fi

if ! command -v qmd >/dev/null 2>&1; then
  echo "[verify_skills] qmd no está en PATH. Instálalo con 'bun install -g https://github.com/tobi/qmd' y asegúrate de tener ~/.bun/bin en PATH."
fi

if ! python3 -c 'import prompt_guard' >/dev/null 2>&1; then
  echo "[verify_skills] prompt_guard no está instalado. Ejecuta 'pip install prompt-guard' para habilitar las verificaciones offline."
fi

echo "[verify_skills] Verificación completada."
