---
mod:        Ancient Buildings Renew
packageId:  nelim.ancientbuildingsrenew
repo:       Rimworld-Ancient-Buildings-Renew
visibility: public
detached:   yes
stage:      done
licence:    silent
licence_at: four places, the About and the Steam page among them
showcase:   complete
tested_on:
workshop:
remaining:
  - unverified: never seen running in game
session:    local_893d3a1c-6b23-490a-911f-243a435eb1a7
updated:    2026-09-12, by the thread that holds this mod
---

# Ancient Buildings Renew — status

A status sheet, read by a sweep over every mod rather than by asking each thread one at a time.
It lives at the root, never in `Mod/`, so Steam never receives it.

The fields above were deduced from disk on 2026-09-12 by that sweep, and the three it cannot
deduce are filled in here by the thread that holds this mod:

- **`stage: done`** — the content is finished and verified cold. Six defs, no C#, no patches, no
  dependencies. Six offline checkers pass, including `Check-ConfigErrors.ps1`, which was written
  for this mod and calibrated against the game's own 13 809 defs.
- **`tested_on`** — empty, and that is the honest state: this mod has never been loaded by
  RimWorld. `TESTING.md` says what the first run has to settle, and the one check that matters
  most cannot be made from a log — the concrete fence has to be dragged out in a line by hand.
- **`remaining`** — one entry, `unverified`, for exactly that reason. There is no known defect
  and no missing feature.

`detached: yes` since 2026-09-11: this folder is its own git repository, on `main`, with one
remote pointing at the public repository above. The monorepo ignores it and tracks none of its
files.

`showcase: complete` since 2026-09-11: `Mod/About/Preview.png` at 896 × 504 and
`Mod/About/ModIcon.png` at 128 × 128, both built from the full-resolution sources in `Art/` by
`_tools/build-about.sh`. Neither is SyndicateGamingNetwork's; theirs is no longer shipped.

`workshop` is empty because nothing has been uploaded. Read `PUBLISHING.md` before it is: the
name, the description and the `packageId` are frozen when the Workshop item is created, and
`SetItemDescription` never runs again.

Vocabulary for `licence`: `open` an explicit licence, `silent` no licence and a dead source,
`alive` no licence but a living source, `forbidden` a written refusal, `original` nothing reused.
