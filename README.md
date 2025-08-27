# Jasmy Control Deck

Control Deck for the Jasmy / Janction ecosystem. This monorepo manages UI, CLI, smart contracts, and external modules via git submodules.

## Folder Structure

- `/ui` — React + TypeScript + ShadCN UI
- `/cli` — CLI integration point
- `/contracts` — Smart contracts (e.g., JasmyCoin)
- `/modules` — External submodules (JasmyCoin, janction-cli, future modules)
- `/docs` — Documentation
- `/tools` — Scripts for setup and syncing
- `.github/workflows` — CI/CD workflows

## Getting Started

Clone the repository with submodules and run the setup script:

```bash
git clone --recursive https://github.com/cryptomx1/jasmy-control-deck.git
cd jasmy-control-deck
bash tools/setup.sh   # or: pwsh ./tools/setup.ps1 on Windows
```

## Working with Submodules

- Submodules live under `modules/`.
- To sync your fork with upstream safely:

```bash
bash tools/sync-submodules.sh
```

- Manual commands:

```bash
cd modules/JasmyCoin
git fetch origin
git fetch upstream
git merge upstream/main
```

## Adding New Modules

To add a new module as a submodule:

```bash
git submodule add <repo-url> modules/<ModuleName>
git submodule update --init --recursive
```

## CI/CD

A lightweight GitHub Actions workflow (`doctor.yml`) checks that:

- Submodules exist
- Onboarding files are present and non-empty

## Common Issues & Warnings

- Submodule changes are only tracked inside their own directory. Commit and push from inside the submodule if needed.
- If `sync-submodules.sh` reports a conflict, resolve manually before proceeding.
