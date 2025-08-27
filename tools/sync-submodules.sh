#!/usr/bin/env bash
seto -euo pipefail

declare -A upstreams=(
  ["modules/JasmyCoin"]="https://github.com/JasmyCoin/JasmyCoin.git"
  ["modules/janction-cli"]="https://github.com/Janction-R-D/janction-cli.git"
)

updated=()
skipped=()

for module in "${!upstreams[@]}"; do
  echo "Syncing $module..."
  if [ ! -d "$module/.git" ]; then
    echo "  (skip) not initialized"
    skipped+=("$module")
    continue
  fi

  branch=$(git -C "$module" rev-parse --abbrev-ref HEAD 2>/dev/null || echo "main")
  git -C "$module" fetch origin "$branch" || true
  git -C "$module" fetch upstream "$branch" || true

  if git -C "$module" merge --ff-only "upstream/$branch"; then
    echo "  updated (fast-forward)."
    updated+=("$module")
  else
    echo "  conflict or non-ff; please resolve manually."
    skipped+=("$module")
  fi
done

echo "Summary:"
echo "  Updated: ${updated[*]:-none}"
echo "  Skipped: ${skipped[*]:-none}"
