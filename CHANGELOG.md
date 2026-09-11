# Changelog

All notable changes to this mod are documented here.

## [1.0.0] — 2026-09-05

First release. Port of SyndicateGamingNetwork's **"Ancient" Buildings** to RimWorld 1.6.

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
- `About/PublishedFileId.txt` dropped: it names SyndicateGamingNetwork's Workshop item.

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
- `About/Preview.png`, SyndicateGamingNetwork's own.
