#!/usr/bin/env pwsh
Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

Write-Host "Initializing submodules..."
git submodule sync --recursive
git submodule update --init --recursive

function Add-Upstream($dir, $url) {
    if (Test-Path $dir) {
        Push-Location $dir
        $hasUpstream = (git remote) -contains "upstream"
        if (-not $hasUpstream) {
            Write-Host "Adding upstream remote to $dir"
            git remote add upstream $url
        }
        Pop-Location
    }
}

Add-Upstream "modules/JasmyCoin" "https://github.com/JasmyCoin/JasmyCoin.git"
Add-Upstream "modules/janction-cli" "https://github.com/Janction-R-D/janction-cli.git"

Write-Host "Done. For safe updates later, run: tools/sync-submodules.sh"
