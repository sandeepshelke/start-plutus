# start-plutus — archived 2026-09-18

Cardano/Plutus work from 2021–2022. Not actively developed since.
The working tree was 39G on disk; this repo keeps the ~1.5MB that was
actually written by hand. Everything else was chain data or clones.

## What is here

- `alonzo-purple/` — Alonzo Purple testnet exercises 1–4.2. Shell script
  series for building, evaluating and submitting Plutus script txs.
- `pioneer-program-homework/` — solutions for the IOHK Plutus Pioneer
  Program, weeks 2–7 and 9, plus `sandeep_notes.md`. Rescued from a
  detached-HEAD clone with an unresolved index before deletion.
- `learn_haskell/`, `mongolia/`, `inser_sort.hs` — Haskell practice.
- `.devcontainer/`, `setup.sh`, `install-nix.sh`, `nix-cache.sh` — the
  environment this was built in (nix + docker).

## What was deliberately NOT committed

| Excluded | Size | Why / how to get it back |
|---|---|---|
| `mainnet/`, `testnet/`, `Alonzo-testnet/` | 29.5G | cardano-node chain data. Re-syncs. Alonzo Purple no longer exists. |
| `plutus/` | 5.3G | clone of github.com/input-output-hk/plutus |
| `paarka/` | 2.1G | clone of github.com/georgeos/paarka |
| `prism-pioneer-program/` | 1M | clone of github.com/input-output-hk/prism-pioneer-program |
| `hashlips_art_engine/` | 184M | clone of github.com/HashLips/hashlips_art_engine |
| `mongodb/` | 302M | local WiredTiger database files |
| `books/` | 31M | purchased PDFs, not mine to publish |
| `*.skey`, `*.vkey`, `*.addr` | — | **wallet keys — never commit** |
| `cardano-node/`, `cardano-node-1.31.0/` | 1G | upstream builds |

The `alonzo-purple/cardano-cli` and `cardano-node` entries were symlinks
into `/nix/store` whose targets no longer exist; they are ignored.
