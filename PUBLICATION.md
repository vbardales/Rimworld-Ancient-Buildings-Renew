# Publication

What the Workshop page needs and the rest of the repository does not hold. It serves twice: for the
first release, and for whoever takes the mod over.

**Status: updated 2026-10-06.** Workshop item `3806708945` was created private by the `0.1.0` prepublication of
2026-09-23 and its `PublishedFileId.txt` is committed and pushed. No Git tag and no GitHub release exist, and none is
made by hand: the CI creates them after a successful upload. Nothing below has been posted or pasted anywhere. The stage
is `tested` (`STATUS.md`); the step to `prepublished` is what this file prepares.

## What blocks the publication

Not restated from `AUDIT.md`; only what is specific to this mod.

- The gallery is built but not approved: seven staged pictures (`15-gallery.feature`, ticket eb8e, 7 of 7 green, every capture
  opened) are in `Art/Gallery/` as `1-candidate-<name>.jpg` to `7-candidate-<name>.jpg` (JPEG, 3.9 MB with `0-preview.png`), in
  the order proposed on 2026-10-08: the six together, the lamppost at night, the air conditioner, the vending machine and stove,
  the road, the barrier and fence, the vending machine close. The owner accepts (the word "candidate" is dropped from the
  name), reorders or refuses (the file is deleted); see "Gallery".
- The owner's manual validations (table below) are hers.
- A dry-run of the publish workflow is owed on the final commit: `Mod/` changed after the green dry-run of 2026-09-25
  (French wording, lamppost light, ModIcon), so that SHA is void. `.github/publish-tag.yml` exists.
- The page still carries the description `0.1.0` sent, which lacks the pointer to `ATTRIBUTION.md` and the licence
  (see "Description").
- The rollback target is chosen (see "Fail fast").

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
Code, Codex for the audits, DALL-E for the preview background, the icon and the lamppost light cone), `THANKS`, the pointer to
`ATTRIBUTION.md` and the licence, and the `[url=...]Source code on GitHub[/url]` line, in the order
`PUBLISHING.md` sets.

## Images

- **Preview** (`Mod/About/Preview.png`, 896 x 504, under 1 MB): the mod's own corner of road at dusk, with the fence, the
  barrier, the lamppost and the vending machine in one frame, the name engraved, and the ModIcon cut-out in the
  bottom-right corner. It is built by the shared renderer from `Art/Preview.config.json` (`node ../scripts/Render-Preview.cjs`);
  `Art/Gallery/0-preview.png` is its byte-identical copy. Its checks are in `STATUS.md` (the owner's override of 2026-09-13
  on the comparison with a game capture).
- **ModIcon** (`Mod/About/ModIcon.png`, 128 x 128): the repository's mascot, delivered by the same renderer from
  `Art/ModIcon-source.png` (the owner's redrawn source). The 32 px readability control of the earlier icon is in `STATUS.md`;
  the redrawn one was looked at on 2026-10-06 and the owner decides.

## Screenshots, in this order

The gallery folder is `Art/Gallery/` (it was `Art/Workshop/`, with `01-`...). It holds only the images to upload, numbered on one
digit from `0-` (`PUBLISHING.md`, Images), nothing else, and it is the workflow's `--gallery-dir`:

- `0-preview.png`: a **byte-identical copy of `Mod/About/Preview.png`** (the Preview as it is now, with the ModIcon corner; the
  former "copy without the mascot" is dropped). Regenerated with the Preview.
- `1-`, `2-`... the staged pictures of the section "Gallery" below, in page order, each under 2 MB and all together under 8 MB
  (JPEG, `ffmpeg -q:v 3`). Steam shows the first one large under the Preview, so the order is the owner's choice and the first is
  the most demonstrative, not the prettiest. Every image is opened and looked at before it is listed: a green scenario proves the
  journey ran, not that the image shows anything.

The old candidate table (fence with a bend, lamppost, air conditioner with temperatures, link gizmo) is replaced by the staged
series below. The question whether Work Studio's showcase-colony rule applied is answered: the gallery is staged on the Sanctuary
(`PickleTools/docs/GALERIE.md`).

The gallery is uploaded by hand (`OPERATIONS.md`); the CI/CD session regenerates the workflow once the folder is final.

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
| 1 | The fence and the barrier drag out as a line in one gesture (`F1`, `B1`) | **Not applicable, accepted by the owner on 2026-09-28**: the engine has no press-drag-release primitive. The draw style and the cells a drag would lay are asserted by Pickle 08 |
| 2 | The lamppost stays lit all night, the vending machine keeps a meal sound over days, the stove warms and short-circuits in rain, the air conditioner cools across a wall | Time and physics |
| 3 | The French reads naturally | **Done**: the owner reviewed `FRENCH_REVIEW.md` on 2026-10-01 (`translation_fr: complete`) |
| 4 | Subscribe to item `3806708945`, start a game with the installed copy, build the six | The installed copy is what players get; the suite plays the working tree |
| 5 | The gallery: which captures, in which order, on which colony | A composition is a choice |
| 6 | The description read once more, on the page after the publish | The dry-run cannot read a private page |
| 7 | Then, and only then, the visibility, the comments subscription and "Watch all activity" of the mod and of its parents (`PUBLISHING.md`) | Steam, by hand, by the owner |

The save migration between the two mods is opportunistic and not a gate (`TESTING.md`); the description's
sentence that a save moves between them is a consequence of keeping the `defName`s, not a tested result.

## Mature content checkboxes

**None of them.** The mod adds six buildings and ships a road corner at dusk and a mascot. The staged gallery shows a colonist in
a jacket and a dog among concrete, a stove and a lamp: nothing adult, but the answer is final only after the owner has opened every
retained image.

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

**Target for 1.0.0, chosen by the owner on 2026-10-02: back to private visibility.** The item is private until she flips it, and this is the first real release, so there is no earlier good version worth republishing (0.1.0 was never tested). If the regression pass comes back red, she sets the item back to private by hand on Steam; the CI never sends visibility. The fix then goes out as a new version, never a re-publication of 1.0.0. The general rule below applies from the second release on.

A rollback is a **new publication**, not an unpublication: the workflow is dispatched with `ref` = the full
SHA of the last good commit and the next patch number, and the change note reads "Rolls back to <what>,
because <what failed>". The version numbers only go up and a tag that exists is refused. The CI never sends
visibility: making the item private again is a manual act of the owner on Steam.

`AUDIT.md`, `prepublished -> published`: before the `publish`, every scenario that failed has a green replay,
the gallery is done and the owner's manual validations are made. The regression pass may follow.

- Scenarios that failed and were replayed green (2026-09-24 to 28): the identifier scenario in English and French, the incompatibility
  scenario, the wall cooling (eight fix tickets), the lamppost cone and the French wording. Nothing red is open in the suite; the
  gallery scenarios are captures, not assertions.
- **The rollback target** is back to private visibility (above). Tag `v1.0.0` becomes the next target once it exists.

## Comments on other mods' pages

`WORKSHOP_COMMENTS.md` decides; it is keyed by Workshop id. Under 1,000 characters each, a bare URL on the
last line, to post **only after item 3806708945 is public**.

| Recipient | Id | State | Reason |
|---|---|---|---|
| "Ancient" Buildings (SyndicateGamingNetwork) | 2566355159 | drafted | The mod this one is a port of, declared incompatible and played by the pass `incompat-original` |
| Pickle | 3791648678 | `posted` | Covers already lists Ancient Buildings Renew in the registry (`WORKSHOP_COMMENTS.md`): nothing to post |
| RimLogging | 3733484696 | `posted` | Covers already lists this mod in the registry: nothing to post |
| PickleTools | 3806142401 | `not_applicable` | Same author, private page. No pass of this suite stages a piece of it |
| Harmony | 2009463077 | not concerned | The staging installs it; this mod uses none |

### "Ancient" Buildings, 2566355159

Draft in the shape `WORKSHOP_COMMENTS.md` asks for (one true detail, one thanks, a hidden link, 150 to 350 characters, one or two
emoticons). To post only after item 3806708945 is public; Virginie rewrites it in her own voice.

```
Your concrete fence, lamppost and vending machine are the worn, lived-in look I wanted in a colony, so they went to 1.6 as [url=https://steamcommunity.com/sharedfiles/filedetails/?id=3806708945]Ancient Buildings Renew (unofficial)[/url]: stats and textures untouched, credited to you, and your unused air-conditioner texture finally got a def :) If you'd rather it came down, say so and it does.
```

## Gallery: story and shot list (rule of 2026-10-02, reworked 2026-10-06 for the Sanctuary)

Draft by the session, to be ordered and approved by the owner. Nothing is final until she has opened the images. Scenarios:
`Tests/Pickle/Mod/Pickle/Features/15-gallery.feature`, pass `-DepMap wsl-deps.sanctuary.map`.

**Story.** *A day at the last stop of an old road*, told by Nelim (the fixture's one colonist: Virginie) and Shogun, her
labrador. The place is the same for the seven pictures, the calm zone of Nelim's tribe: a cream stone square, no roof, no
wall shadow, the one level light ground among the outdoor places. Time moves a little between pictures; each takes its own corner.

**Why this place.** The named places of `PickleTools/docs/SANCTUAIRE-LIEUX.md` were read one by one. The gravel yard is the most
road-like but is crowded with furniture and lamps; the free squares A to J and the emerald clearing are dark earth or a painted
carpet; the houses and gardens are not roads. The calm zone keeps concrete and a lit lamp legible. (Not photographed by this session
beforehand: the choice rests on the descriptions, and each image is read after the run.)

**Subject.** Nelim in a deep teal jacket (28, 98, 104), the complement of the lamp's amber and the grey concrete, so she stands out
in every picture. No tattoos. Her body and face are the fixture's, not rolled.

| # | Time | Picture | What it must prove |
|---|---|---|---|
| 1 | 06:00 | the barrier and the fence run as lines, Nelim arrives with Shogun | both drag out as lines |
| 2 | 09:00 | close on the barrier and the fence, Shogun at their foot | the pieces link and read as concrete |
| 3 | 11:00 | vending machine with meals in it, one-tile stove, Nelim cooks, Shogun waits | one tile each, meals inside |
| 4 | 12:00 | close on the vending machine, Nelim choosing a meal | the machine holds meals |
| 5 | 15:00 | the ancient air conditioner set in a wall, Nelim in the cooled shade | it fits in a wall |
| 6 | 19:00 | all six buildings together at dusk, Nelim and Shogun resting | the whole set |
| 7 | 23:00 | the lamppost lit, no conduit anywhere | it is lit, with no power |

**Allowance (owner, 2026-10-06):** anything RimWorld offers is allowed in a gallery picture (props, furniture, plants, set decor, pawns, hairstyles, clothes, animals), other mods included even if they are not hers. As many pictures as wanted, each under 2 MB and all together under 8 MB: the run's PNGs are about 4 MB, so the retained ones are converted to JPEG (`ffmpeg -i x.png -q:v 3 x.jpg`) before they go to `Art/Gallery/`.

Menus and windows are plain screen captures and are not staged.

**First run (ticket 8cf7, 2026-10-06, five scenarios, all green; the series is now seven).** The Pickle Tools steps worked (zoom 6, Nelim
placed and dressed, Shogun spawned). Reading the captures found: the "no power" status icon drawn on the stove, vending machine and
air conditioner despite the presentation mode (Pickle Tools fixed it; ticket ba88 confirmed it gone); a grey stain near Nelim (cleaned by `all filth
is cleaned`, added); the drawn light cone brown instead of yellow, so the cone texture was recoloured to a very pale yellow almost white by script on 2026-10-08 and kept (it had briefly been dropped on 2026-10-07). Ticket ba88 also showed a thought bubble over Shogun (2) and Nelim touching the barrier (7).
