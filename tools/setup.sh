#!/usr/bin/env bash
set -euo pipefail

echo "Initializing submodules..."
git submodule sync --recursive
git submodule update --init --recursive --jobs 8

add_upstream() {
  local dir="$1" url="$2"
  if [ -d "$dir" ]; then
    (
      cd "$dir"
      if ! git remote | grep -q '^upstream$'; then
        echo "Adding upstream remote to $dir"
        git remote add upstream "$url"
      fi
    )
  fi
}

add_upstream modules/JasmyCoin https://github.com/JasmyCoin/JasmyCoin.git
add_upstream modules/janction-cli https://github.com/Janction-R-D/janction-cli.git

echo "Done. For safe updates later, run: tools/sync-submodules.sh"
