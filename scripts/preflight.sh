#!/usr/bin/env bash
set -euo pipefail

PATCH_FILE="${1:-$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/patches/booked-2.4.4.2-14h28-security-backport.patch}"
PLUGINS_DIR="${2:-$(pwd)}"
BOOKED_MAIN="$PLUGINS_DIR/booked/booked.php"

if [[ ! -f "$BOOKED_MAIN" ]]; then
  echo "ERROR: booked/booked.php not found under: $PLUGINS_DIR" >&2
  echo "Run from wp-content/plugins or pass the plugins directory as argument 2." >&2
  exit 1
fi

if ! grep -Eq '^Version:[[:space:]]*2\.4\.4[[:space:]]*$' "$BOOKED_MAIN"; then
  echo "ERROR: source does not report exactly Booked 2.4.4." >&2
  grep -E '^Version:' "$BOOKED_MAIN" || true
  exit 1
fi

if [[ ! -f "$PATCH_FILE" ]]; then
  echo "ERROR: patch file not found: $PATCH_FILE" >&2
  exit 1
fi

cd "$PLUGINS_DIR"
echo "Source version: Booked 2.4.4"
echo "Patch: $PATCH_FILE"
echo "Running dry-run..."
patch --dry-run -p1 < "$PATCH_FILE"
echo "OK: patch dry-run succeeded. No files were modified."
