# Publication

What the Workshop page needs and the rest of the repository does not hold. It serves twice: for the
first release, and for whoever takes the mod over.

**Status: drafted, 2026-09-25.** Workshop item `3806708945` was created private by the `0.1.0`
prepublication of 2026-09-23 and its `PublishedFileId.txt` is committed and pushed. No Git tag and no
GitHub release exist, and none is made by hand: the CI creates them after a successful upload. Nothing
below has been posted or pasted anywhere. The stage is `done`, not `prepublished` (see `STATUS.md`).

## What blocks the publication

Not restated from `AUDIT.md`; only what is specific to this mod.

- The manual scenarios of `TESTING.md` are not run (fence and barrier drag, storage gizmo, wall cooling,
  Core alone, English and French display). They are the owner's, sent as captures one at a time
  ("Manual run: what to send, and who checks what").
- The gallery does not exist (see below).
- The rollback target is not chosen (see "Fail fast").
- No dry-run of the publish workflow has run. `.github/publish-tag.yml` was generated on 2026-09-25 and
  pushed; the CI/CD session runs the dry-run once this file is on `main`.
- The page still carries the description `0.1.0` sent, which lacks the pointer to `ATTRIBUTION.md` and the
  licence (see "Description").

## Description

The description is **Markdown**, in `Mod/README.template.md`, and the publish workflow converts it to Steam
BBCode when it is dispatched with `update_description=true` (`.github/publish.config.json`, `description`).
`Mod/.steamignore` keeps that file, `README.md` and the `.dds` files out of what players receive. So there is
no second copy to keep in step with a BBCode block in this file.

`SetItemDescription` runs only at creation, so **the live page is still the text of `0.1.0`**, the
`About.xml` description of that commit. `update_description=true` replaces it, and it is the only way the
page is corrected without a hand edit. The private item cannot be read by the dry-run, so it prints the
converted text with its size and SHA-256 and shows **no diff against the page**: read the printed text once
against `Mod/README.template.md`, and the page after the publish. The converted text is about 5,550
characters, under Steam's 8,000-byte limit.

The template opens with the `UNOFFICIAL` paragraph, and ends with `IF I GO QUIET`, `AI-GENERATED` (Claude
Code, Codex for the audits, DALL-E for the preview background and the icon), `THANKS`, the pointer to
`ATTRIBUTION.md` and the licence, and the `[url=...]Source code on GitHub[/url]` line, in the order
`PUBLISHING.md` sets.

## Images

- **Preview** (`Mod/About/Preview.png`): the mod's own corner of road at dusk, with the fence, the barrier,
  the lamppost and the vending machine in one frame, and the name engraved. Its checks are in `STATUS.md`
  (the audit sections, and the owner's override of 2026-09-13 on the comparison with a game capture).
- **ModIcon** (`Mod/About/ModIcon.png`, 128 px): the repository's mascot. The 32 px readability control is
  recorded in `STATUS.md`. This session generates no image and did not touch either file.

## Screenshots, in this order

**Not settled.** No Workshop screenshot has been chosen or produced. Steam shows the first one large under
the Preview, so it must be the most demonstrative, not the prettiest, and every image is opened and looked
at before it is listed here: a green capture scenario proves the journey ran, not that the image shows
anything. The manual run of `TESTING.md` already asks the owner for captures (`F1`, `B2`, `L2`, `S1`, `A2`
...), some of which may serve. Candidates, in the order to try:

| Order | What it should show | Why there |
|---|---|---|
| 1 | The fence laid as a line by one drag, with a bend | It is the defect the port exists to fix, and the one thing the log cannot show |
| 2 | The lamppost lit at night with no conduit in frame | The mod's one unusual claim: solar, no power |
| 3 | The air conditioner in a wall, both room temperatures readable | The one building that is new |
| 4 | The vending machine with its link storage gizmo | The 1.4 fix a player can see |

The gallery is uploaded by hand (`OPERATIONS.md`): a folder that holds only the images to upload, numbered
`01-`, `02-`... in page order, no old version, no raw capture, no subfolder (`PUBLISHING.md`, Images). It
would be `Art/Workshop/`, which is also the workflow's `--gallery-dir` once it exists; the CI/CD session
regenerates the workflow then. **Open question for the owner:** Work Studio's rule is that shots are taken
on her showcase colony (`PickleTools/ScreenshotStudio`), not on the test fixture. Whether it applies here is
not written anywhere.

## Dependencies and DLCs

**No DLC is required, and no mod.** `supportedVersions` declares 1.6 only.

| Declared | Identifier | Actually required |
|---|---|---|
| `incompatibleWith` | `ancientbld.core` | Same five `defName`s as the original: run one or the other. The Pickle pass `incompat-original` plays them together and shows the original still loads and still carries the field 1.6 removed. Nothing is logged about the shared names |
| `MayRequire` on two recipes | `Ludeon.RimWorld.Biotech` | **No.** `Make_BabyFood` and `Make_BabyFoodBulk` are inert without Biotech. The pass `sans-biotech` plays that |
| `modDependencies`, `loadAfter` | none | The mod needs nothing and reads nothing from another mod |

## Manual validations of the owner

`AUDIT.md` asks for none at `tested` that a test could carry, and lists "the owner's manual validations"
among the things a `publish` does not skip without saying which. This is a proposal drawn from `TESTING.md`
and `PUBLISHING.md`; it is hers to change.

| # | What to look at | Why a test cannot |
|---|---|---|
| 1 | The fence and the barrier drag out as a line in one gesture (`F1`, `B1`) | The Pickle step that designates places blueprints cell by cell |
| 2 | The lamppost stays lit all night, the vending machine keeps a meal sound over days, the stove warms and short-circuits in rain, the air conditioner cools across a wall | Time and physics |
| 3 | The French reads naturally | The suite proves the strings are loaded, not that they read well |
| 4 | Subscribe to item `3806708945`, start a game with the installed copy, build the six | The installed copy is what players get; the suite plays the working tree |
| 5 | The gallery: which captures, in which order, on which colony | A composition is a choice |
| 6 | The description read once more, on the page after the publish | The dry-run cannot read a private page |
| 7 | Then, and only then, the visibility, the comments subscription and "Watch all activity" of the mod and of its parents (`PUBLISHING.md`) | Steam, by hand, by the owner |

The save migration between the two mods is opportunistic and not a gate (`TESTING.md`); the description's
sentence that a save moves between them is a consequence of keeping the `defName`s, not a tested result.

## Mature content checkboxes

**None of them.** The mod adds six buildings. The two pictures it ships are a road corner at dusk and a
mascot. The Workshop screenshots are not produced yet; each one must be opened before this answer is final.

## Steam change notes

Written at upload time, in the Change Notes tab. Unlike the description they go out again on every update.
The workflow sends the block below as written (BBCode), read from this file at the pinned commit. **The
version stands alone on the first line**, as `PUBLISHING.md` asks: Steam shows no version for a note that
does not say it.

### 1.0.0

```
[b]1.0.0[/b]

First release. Port of SyndicateGamingNetwork's "Ancient" Buildings to RimWorld 1.6.

[list]
[*]The concrete fence can be dragged out in a line again. RimWorld 1.4 removed the field it relied on, and nothing in the log said so. The concrete barrier drags too.
[*]The vending machine can be linked to others and its filter set on the blueprint.
[*]The stove offers the two baby-food recipes when Biotech is on.
[*]New: the ancient air conditioner, a wall cooler for the texture the original shipped and never used. It needs the air conditioning research.
[*]English and French.
[/list]

Nothing else was rebalanced. It cannot run beside the original mod.
```

## Fail fast: the rollback target

A rollback is a **new publication**, not an unpublication: the workflow is dispatched with `ref` = the full
SHA of the last good commit and the next patch number, and the change note reads "Rolls back to <what>,
because <what failed>". The version numbers only go up and a tag that exists is refused. The CI never sends
visibility: making the item private again is a manual act of the owner on Steam.

`AUDIT.md`, `prepublished -> published`: before the `publish`, every scenario that failed has a green replay,
the gallery is done and the owner's manual validations are made. The regression pass may follow.

- Scenarios that failed and were replayed green (2026-09-24 and 25): the identifier scenario, in English and in
  French, and the incompatibility scenario, rewritten. Nothing red is open in the Pickle suite.
- **The rollback target is not chosen.** The only earlier upload is the private `0.1.0` prepublication, made
  from the folder as it stood on 2026-09-23 and not from a tagged commit, so it cannot be reproduced. The
  first real target is the SHA of the `1.0.0` that passes its dry-run, written here at that moment.

## Comments on other mods' pages

`WORKSHOP_COMMENTS.md` decides; it is keyed by Workshop id. Under 1,000 characters each, a bare URL on the
last line, to post **only after item 3806708945 is public**.

| Recipient | Id | State | Reason |
|---|---|---|---|
| "Ancient" Buildings (SyndicateGamingNetwork) | 2566355159 | drafted | The mod this one is a port of, declared incompatible and played by the pass `incompat-original` |
| Pickle | 3791648678 | already `posted` | Test tool really used. The owner said on 2026-09-25 that the thanks is already placed; only `Covers` changes |
| RimLogging | 3733484696 | already `posted` | Staged by every Pickle pass. **Open question for the owner:** whether `Ancient Buildings Renew` is added to its `Covers`; the description names neither |
| PickleTools | 3806142401 | `not_applicable` | Same author, private page. No pass of this suite stages a piece of it |
| Harmony | 2009463077 | not concerned | The staging installs it; this mod uses none |

### "Ancient" Buildings, 2566355159

```
Hello SyndicateGamingNetwork! 🏗️

Thank you for the "Ancient" Buildings: the fence, the lamppost and the vending machine are exactly the worn, lived-in look I want in a colony, and I could not bear that they stopped at 1.3. I brought them forward to 1.6 as Ancient Buildings Renew (unofficial): your five defs, stats and textures are unchanged, the fence drags out in a line again, and I gave your unused air-conditioner texture a def of its own, plus French.

It is credited to you everywhere, and if you would rather it did not exist, just say so and it comes down, no argument, no delay. Thank you for the buildings 💛

https://steamcommunity.com/sharedfiles/filedetails/?id=3806708945
```
