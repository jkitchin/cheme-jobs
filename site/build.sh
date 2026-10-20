#!/usr/bin/env bash
# Render both boards and their archives to a static site in _site/.
# Usage: site/build.sh [outdir]
set -euo pipefail

cd "$(dirname "$0")/.."
OUT="${1:-_site}"
rm -rf "$OUT"
mkdir -p "$OUT"
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

placeholder() {  # placeholder <dest.md> <heading>
  printf '# %s\n\nNo board has been compiled yet. The first run will appear here.\n' "$2" > "$1"
}

build_board() {  # build_board <current.md> <dest.html> <archive-dir> <title>
  local current="$1" dest="$2" dir="$3" title="$4" tmp
  tmp="$(mktemp -d)"
  if [ -f "$current" ]; then
    render "$current" "$OUT/$dest" "" "$title"
  else
    placeholder "$tmp/current.md" "$title"
    render "$tmp/current.md" "$OUT/$dest" "" "$title"
  fi

  mkdir -p "$OUT/$dir"
  if [ -f "$dir/INDEX.md" ]; then
    render "$dir/INDEX.md" "$OUT/$dir/index.html" "../" "Archive · $title"
  else
    placeholder "$tmp/index.md" "Archive"
    render "$tmp/index.md" "$OUT/$dir/index.html" "../" "Archive · $title"
  fi
  for f in "$dir"/*.md; do
    [ -e "$f" ] || continue
    b="$(basename "$f" .md)"
    [ "$b" = "INDEX" ] && continue
    render "$f" "$OUT/$dir/$b.html" "../" "$b · $title"
  done
  rm -rf "$tmp"
}

build_board INTERNSHIPS.md index.html archive      "ChemE Internship Board"
build_board JOBS.md        jobs.html  jobs-archive "ChemE Job Board"

echo "Built $(find "$OUT" -name '*.html' | wc -l | tr -d ' ') pages in $OUT/"
