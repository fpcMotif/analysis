#!/usr/bin/env bash
# setup-local.sh — one-click local setup for a fresh checkout on a new device.
#
#   1. Fetches the external reference texts (see scripts/fetch-sources.sh).
#   2. Installs a git hook so they auto-refresh after every `git pull` / checkout.
#
# Run once after cloning:
#   bash scripts/setup-local.sh
set -euo pipefail
cd "$(dirname "${BASH_SOURCE[0]}")/.."

echo "==> 1/2  Fetching external reference sources"
bash scripts/fetch-sources.sh

echo "==> 2/2  Installing git hooks (auto-fetch on pull/checkout)"
HOOK_DIR="$(git rev-parse --git-path hooks)"
mkdir -p "$HOOK_DIR"
HOOK_BODY='#!/usr/bin/env bash
# Auto-installed by scripts/setup-local.sh — keep external sources present.
exec bash "$(git rev-parse --show-toplevel)/scripts/fetch-sources.sh"'
for h in post-merge post-checkout; do
  printf '%s\n' "$HOOK_BODY" > "$HOOK_DIR/$h"
  chmod +x "$HOOK_DIR/$h" 2>/dev/null || true
done

echo "Done. New-device setup complete."
