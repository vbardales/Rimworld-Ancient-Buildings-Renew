---
mod:          Ancient Buildings Renew (unofficial)
packageId:    nelim.ancientbuildingsrenew
repo:         Rimworld-Ancient-Buildings-Renew
visibility:   public
detached:     yes
stage:        done
licence:      silent
licence_at:   four places, the About and the Steam page among them
dependencies: none
showcase:     complete
tested_on:
workshop:
remaining:
  - unverified: never seen running in game
session:      local_893d3a1c-6b23-490a-911f-243a435eb1a7
updated:      2026-09-12, by the thread that holds this mod
---

# Ancient Buildings Renew — status

A status sheet, read by a sweep over every mod rather than by asking each thread one at a time.
It lives at the root, never in `Mod/`, so Steam never receives it.

The sweep deduces from disk what disk can tell it. The fields it cannot are filled in here by the
thread that holds this mod:

- **`stage: done`** — the content is finished and verified cold. Six defs, no C#, no patches, no
  dependencies. Six offline checkers pass, including `Check-ConfigErrors.ps1`, which was written
  for this mod and calibrated against the game's own 13 809 defs.
- **`tested_on`** — empty, and that is the honest state: this mod has never been loaded by
  RimWorld. `TESTING.md` says what the first run has to settle, and the one check that matters
  most cannot be made from a log — the concrete fence has to be dragged out in a line by hand.
- **`remaining`** — one entry, `unverified`, for exactly that reason. There is no known defect
  and no missing feature.
- **`dependencies: none`** — the value means the mod needs nothing, as against `declared` when
  every mod it needs is named in the About's `modDependencies` and `to check` when a non-vanilla
  `loadAfter` suggests one that is not. Here it is literal: no dependency, no `loadAfter`, no DLC
  requirement, and the two Biotech recipes on the stove are `MayRequire`, which is inert when
  Biotech is absent. An undeclared dependency is not cosmetic: on 2026-09-11 Reequilibrage animaux
  took 47 vanilla animals down with it, Muffalo included, because the class it injects belongs to
  a mod that was not declared and not loaded.

`detached: yes` since 2026-09-11: this folder is its own git repository, on `main`, with one
remote pointing at the public repository above. The monorepo ignores it and tracks none of its
files.

`showcase: complete` since 2026-09-11: `Mod/About/Preview.png` at 896 × 504 and
`Mod/About/ModIcon.png` at 128 × 128, both built from the full-resolution sources in `Art/` by
`_tools/build-about.sh`. Neither is SyndicateGamingNetwork's; theirs is no longer shipped.

Preview overlay recomposed on 2026-09-12 according to `../STYLE_RIMWORLD.md`:

- Illustration retained unchanged. `Art/Preview.png` is the unlettered source, copied from
  `Art/Preview-source.png`, which remains preserved. No replacement illustration generated.
- Composition and layout: `Art/preview.html`; sole color reference: `Art/preview-palette.json`.
  Rebuild with `node Art/render-preview.cjs` (Node.js, playwright, sharp and Chrome required).
  `_tools/build-about.sh` delegates the preview to this renderer.
- The cool slate stone ground supplies the veil and the dominant blue family of the lighter
  secondary tag and title-suffix ink. The lamppost's warm light supplies the vivid amber accent,
  saturated for the rule and version badge; its warm orange family clearly contrasts with the
  dominant cool slate blue. Strong title words and summary use exactly the same primary ink.
  Renew remains in the title at 65% (29.9 px), weight 600, in secondary ink, using a direct span
  without nested scaling. The unofficial tag remains a separate line.
- The dark veil holds opacity across the full text area before fading, because the original
  short gradient failed contrast over the illuminated barrier. Layout starts at (50, 54),
  with a 46 px title, separate 24 px unofficial tag, 58 by 3 px rule and 430 px summary.
- Chrome's platform-font inspection confirms Segoe UI (Semibold title, Regular tag/summary,
  Bold badge), with no fallback. Capture waits for `document.fonts.ready` and the image.
  Badge version 1.6 is selected from the delivered About.xml's supportedVersions.
- Final output: `Mod/About/Preview.png`, 896 by 504, 616784 bytes. Visually checked at full
  size and at 268 px (`Art/preview-268.png`): no clipping or overlapping text, identifiable
  title/version, readable reduced Renew suffix and visible rule. The illustration's buildings
  remain distinguishable; amber accent remains distinct from the blue secondary ink.
- Contrast checked against the rendered background without text (`Art/preview-background.png`),
  across every pixel of each text bounding box, including corners: title 10.47:1,
  Renew suffix 8.25:1, tag 6.62:1, summary 6.21:1; badge 9.97:1 against its opaque fill.
  All exceed 4.5:1.
  Font, geometry, contrast and size measurements are retained in `Art/preview-qa.json`.
  Nothing published.

`workshop` is empty because nothing has been uploaded. Read `PUBLISHING.md` before it is: the
name, the description and the `packageId` are frozen when the Workshop item is created, and
`SetItemDescription` never runs again.

Vocabulary for `licence`: `open` an explicit licence, `silent` no licence and a dead source,
`alive` no licence but a living source, `forbidden` a written refusal, `original` owing nothing
to anyone — not a name, not an idea traceable to one mod, not a value derived from its assets.
