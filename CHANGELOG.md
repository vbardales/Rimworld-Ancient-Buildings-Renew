# Changelog

All notable changes to this mod are documented here.

## [1.0.0] — unreleased

On release: create the `v1.0.0` tag and the matching GitHub release. The Workshop item so far holds
only the private `0.1.0` prepublication below, which created it.

First release of the port. Port of SyndicateGamingNetwork's **"Ancient" Buildings** to RimWorld 1.6.

### Fixed

- `ConFence`: `placingDraggableDimensions` replaced by
  `<drawStyleCategory>Defenses</drawStyleCategory>`. RimWorld 1.4 replaced the field with the
  draw-style system and deleted it — it is in no def the game ships and in no string of the 1.6
  assembly. Left alone, the element would have matched no field, the loader would have logged
  one line and carried on, and the fence would have loaded and built correctly while quietly
  refusing to be dragged into a line. This was the only unknown element in the whole mod.

### Changed

- `ABVending`: `<storageGroupTag>ABVending</storageGroupTag>` added. Storage groups arrived in
  1.4; a storage building without a tag is the only piece of storage in the game with no *link
  storage settings* gizmo. Its own tag rather than `Shelf`, because its fixed filter is wider
  than a shelf's and a shared group would hand shelves settings they cannot honour.
- `ABVending`: `<blueprintClass>Blueprint_Storage</blueprintClass>` added, so the filter can be
  set on the blueprint before the machine is built, as on every vanilla storage building.
- `ABKitchenstove`: `Make_BabyFood` and `Make_BabyFoodBulk` added under
  `MayRequire="Ludeon.RimWorld.Biotech"`. The recipe list was the vanilla electric stove's as it
  stood in 1.3; Biotech added these two to it in 1.4, and without them a colony whose only stove
  is this one cannot make baby food. Inert when Biotech is absent.
- `ConcreteBarrier`: `<drawStyleCategory>Defenses</drawStyleCategory>` added. Unlike the fence,
  this def never declared the old field, so this is not a regression being repaired — it is the
  one place the port changes behaviour the original had. Every low-cover piece in 1.6 carries a
  draw style, sandbags and barricades included.
- Labels written lower case, as the game writes them: *simple kitchen stove*, *vending machine*,
  *lamppost*, *concrete fence*. Three of the five were Title Case.
- Descriptions given their final full stops, and "dark enviroments" corrected to "dark
  environments" in the lamppost's.
- `packageId` changed from `ancientbld.core` to `nelim.ancientbuildingsrenew`.
- `<supportedVersions>` set to 1.6.
- The Steam description gains the pointer to `ATTRIBUTION.md` and the licence, its AI-generated and
  thanks sections and the closing source link, and is carried by `Mod/README.template.md`, so a
  publish that sends a description corrects the page. The `0.1.0` text was frozen without them.
- `About/PublishedFileId.txt` dropped: it names SyndicateGamingNetwork's Workshop item. This mod's
  own arrives with `0.1.0`, below.

### Added

- **`AB_AirConditioner`**, in a file of its own, `Defs/ThingDefs_Buildings/AB_Buildings_Temperature.xml`.
  The def is new; the art is not. `AB_AirConditioner.png` shipped in the original mod, finished,
  and no def declared it — the only piece of art in there the game never loaded. It is a wall
  cooler: cheaper and quicker to build than vanilla's (70 steel + 2 components, 1200 work,
  skill 4, against 90 + 3, 1600 and skill 5) and thirstier and weaker to run (250 W and −16
  against 200 W and −21). It keeps the `AirConditioning` research where the rest of the mod asks
  for none, because it is the only building here that would unlock anything.
- `Languages/French/`, 12 keys.
- `<incompatibleWith>ancientbld.core</incompatibleWith>`: the `defName`s are unchanged, so the
  two mods cannot load together.
- `About/Preview.png`, made for this port: the mod's own corner of road at dusk, fence, barrier,
  lamppost and vending machine in one frame, with the name engraved on it. It replaces
  SyndicateGamingNetwork's showcase, which is no longer shipped.
- `About/ModIcon.png`, the repository's mascot. An earlier icon, a crop of the mod's own lamppost
  texture, was dropped for being off that style.

### Removed

- `AB_LamppostIcon.psd`, a Photoshop source RimWorld cannot read that no def points at, moved to
  `Art/` where it stays out of the published folder.
- `AB_ConcreteBarrierIcon.png` deleted: byte for byte the same file as `AB_ConcreteBarrier.png`,
  which the mod still ships, and referenced by nothing — the barrier has no `uiIconPath`, so the
  game builds its menu icon from the texture itself.

### Unchanged

- Every stat, cost, power draw, comp, storage filter and link flag, and the eight textures the
  defs load.
- The five `defName`s — `ABKitchenstove`, `ABVending`, `AB_Lamppost`, `ConcreteBarrier`,
  `ConFence` — so a save moves between the two mods without losing a building. Checked against
  Core, every DLC, all 10 360 subscribed Workshop mods and this repository: nothing else defines
  any of them.
- The balance, including the two places it invites a change: the stove has no research
  prerequisite, and it inherits `workTableRoomRole` = `Workshop` rather than `Kitchen`. See
  [ATTRIBUTION.md](ATTRIBUTION.md) for why both were left alone.

## [0.1.0] — 2026-09-23

Creation of a publishIdFile. The prepublication whose only purpose is to create the Workshop item,
which Steam creates private: RimWorld never calls `SetItemVisibility`, so going public is a manual
step and this version is not public.

- `About/PublishedFileId.txt` created and committed (`3806708945`). It is what ties this repository
  to that item: lose it and the next upload creates a second item rather than updating this one.
- The upload was `Mod/` as it stands at the commit that adds that file, and nothing else changed
  since. The description on the Steam page is the `<description>` of `About/About.xml` at that
  commit, and is not sent again by later updates.
- The folder sent also held eight `.dds` files, one beside each texture, generated on 2026-09-23 at
  14:12 and never part of the source. Each has a tracked `.png` twin, which is what the game loads.
  They are ignored by git and by `Mod/.steamignore` from now on, so no upload made from a checkout
  carries them. An in-game upload made from a working folder that still holds them would, because
  the game sends the folder as it is on disk.
