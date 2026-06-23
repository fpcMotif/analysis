#!/usr/bin/env bash
# fetch-sources.sh — re-download the external reference texts that are NOT
# committed to this repo (they are large and have permanent upstream sources).
#
# Sources & permanent homes (see RESOURCES.md):
#   ra-master/                  https://github.com/jirilebl/ra            (Jiri Lebl, Basic Analysis)
#   analysis_notes-master/      https://github.com/noahjussila/analysis_notes
#   taoanalysissolutions-master/ https://github.com/frederic-santos/taoanalysissolutions
#   arXiv-2508.19405v12/        https://arxiv.org/abs/2508.19405          (Klazar, Univariate Real Analysis)
#
# Usage:
#   bash scripts/fetch-sources.sh           # fetch only what is missing
#   bash scripts/fetch-sources.sh --force   # re-fetch everything (overwrites)
#
# Works on Windows Git Bash (uses bundled curl + tar/bsdtar), macOS, and Linux.
set -euo pipefail

# Move to the repo root regardless of where the script is invoked from.
cd "$(dirname "${BASH_SOURCE[0]}")/.."

FORCE=0
[ "${1:-}" = "--force" ] && FORCE=1

log() { printf '  %s\n' "$*"; }

# Extract a .zip using whatever is available (unzip on *nix, bsdtar/tar on Windows).
extract_zip() {
  local zip="$1"
  if command -v unzip >/dev/null 2>&1; then
    unzip -q -o "$zip"
  else
    tar -xf "$zip"   # bsdtar (Windows Git Bash) reads zip files
  fi
}

# $1 = target dir   $2 = GitHub owner/repo   $3 = branch
fetch_github() {
  local dir="$1" repo="$2" branch="$3"
  if [ -d "$dir" ] && [ "$FORCE" -eq 0 ]; then
    log "skip  $dir (already present; use --force to refresh)"
    return
  fi
  log "fetch $dir  <-  github.com/$repo @ $branch"
  rm -rf "$dir"
  local tmp="._fetch_${dir}.zip"
  curl -fSL -o "$tmp" "https://github.com/$repo/archive/refs/heads/$branch.zip"
  extract_zip "$tmp"          # creates <repo-basename>-<branch>/, i.e. exactly $dir
  rm -f "$tmp"
}

# $1 = target dir   $2 = arXiv id (with version, e.g. 2508.19405v12)
fetch_arxiv() {
  local dir="$1" id="$2"
  if [ -d "$dir" ] && [ "$FORCE" -eq 0 ]; then
    log "skip  $dir (already present; use --force to refresh)"
    return
  fi
  log "fetch $dir  <-  arxiv.org/e-print/$id"
  rm -rf "$dir"; mkdir -p "$dir"
  local tmp="._fetch_${dir}.tar.gz"
  curl -fSL -A "fetch-sources" -o "$tmp" "https://arxiv.org/e-print/$id"
  # arXiv e-print is a gzipped tar for multi-file submissions.
  tar -xzf "$tmp" -C "$dir"
  rm -f "$tmp"
}

echo "Fetching external reference sources into $(pwd)"
fetch_github "ra-master"                   "jirilebl/ra"                     "master"
fetch_github "analysis_notes-master"       "noahjussila/analysis_notes"      "master"
fetch_github "taoanalysissolutions-master" "frederic-santos/taoanalysissolutions" "master"
fetch_arxiv  "arXiv-2508.19405v12"         "2508.19405v12"
echo "Done. These directories are git-ignored on purpose."
