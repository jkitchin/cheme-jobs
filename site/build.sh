#!/usr/bin/env bash
# Render INTERNSHIPS.md and the archive to a static site in _site/.
# Usage: site/build.sh [outdir]
set -euo pipefail

cd "$(dirname "$0")/.."
OUT="${1:-_site}"
rm -rf "$OUT"
mkdir -p "$OUT/archive"
cp site/style.css "$OUT/"

render() {  # render <src.md> <dest.html> <root-prefix> <title>
  pandoc "$1" \
    --from gfm \
    --to html5 \
    --section-divs \
    --lua-filter site/filters.lua \
    --template site/template.html \
    --metadata pagetitle="$4" \
    --variable root="$3" \
    --output "$2"
}

render INTERNSHIPS.md "$OUT/index.html" "" "ChemE Internship Board"

for f in archive/*.md; do
  b="$(basename "$f" .md)"
  if [ "$b" = "INDEX" ]; then
    render "$f" "$OUT/archive/index.html" "../" "Archive · ChemE Internship Board"
  else
    render "$f" "$OUT/archive/$b.html" "../" "$b · ChemE Internship Board"
  fi
done

echo "Built $(find "$OUT" -name '*.html' | wc -l | tr -d ' ') pages in $OUT/"
