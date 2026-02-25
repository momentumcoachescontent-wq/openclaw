#!/usr/bin/env bash
set -euo pipefail

if [ $# -eq 0 ]; then
  echo "Usage: $0 <command...>"
  echo "Runs the provided command after ensuring requested skills are cloned and verified."
  exit 1
fi

ROOT_DIR="$(cd "$(dirname "$0")/.." && pwd)"
cd "$ROOT_DIR"

./scripts/setup_skills.sh >/dev/null 2>&1 || true
./scripts/verify_skills.sh

echo "[run_with_skills] Running: $*"
"$@"
