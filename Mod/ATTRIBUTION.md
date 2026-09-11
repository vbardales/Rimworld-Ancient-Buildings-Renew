# Ancient Buildings Renew — attribution

A 1.6 port of **"Ancient" Buildings**, by **SyndicateGamingNetwork**
([2566355159](https://steamcommunity.com/sharedfiles/filedetails/?id=2566355159)).

## Status: public

The source mod is **dead** — it declares 1.3 and nothing further — and **no licence is declared
anywhere**, checked at the four places one could be: no `LICENSE` file in the mod, no mention in
its `About.xml`, no linked repository (`<url>` is absent entirely), and nothing in the body of
the description on its Steam page. That last check is the one that matters: it is the one that
was skipped once on たたら製鉄, whose ban on redistribution turned out to be a sentence in its
description and nowhere else.

This is the usual convention for ports on the RimWorld Workshop: republished with **credit by
name** and **removal on request, without argument**. The `<author>` field reads
`SyndicateGamingNetwork - 1.6 port: nelim`, and the removal clause is in the description.

## What was carried over

Everything the mod defined, which is five `ThingDef`s and nothing else — no C#, no patch, no
research, no dependency:

| defName | label | tab |
|---|---|---|
| `ABKitchenstove` | simple kitchen stove | Production |
| `ABVending` | vending machine | Furniture |
| `AB_Lamppost` | lamppost | Structure |
| `ConcreteBarrier` | concrete barrier | Security |
| `ConFence` | concrete fence | Structure |

Their stats, costs, power draw, comps and graphics are SyndicateGamingNetwork's, unchanged. So
are the eight textures the mod ships, byte for byte.

**The two Workshop images are not theirs.** `About/Preview.png` is a banner made for this port:
the mod's own corner of road at dusk, with the fence, the barrier, the lamppost and the vending
machine in one frame, and the mod's name engraved on it. It replaced SyndicateGamingNetwork's own
showcase of the fence and the lampposts on 2026-09-11, and that image is no longer shipped. It is
still reachable in this repository's published history, at commit `dacc55f`, where it was
committed before the replacement; removing it going forward is a choice about what this mod hands
out, not an attempt to unpublish it.

`About/ModIcon.png` is the repository's mascot, the same character across every mod, which is
what makes the family read at 32 px in the mod list. An earlier icon — the mod's own lamppost
texture, cropped to its opaque bounds and scaled to 128 px — was removed on 2026-09-11 with the
rest of the off-style icons, and the mascot took its place. Nothing of SyndicateGamingNetwork's
is affected either way: the crop was of their texture, and the texture is still here.

## The one def that is not SyndicateGamingNetwork's

`AB_AirConditioner`, in `Defs/ThingDefs_Buildings/AB_Buildings_Temperature.xml`, is new — **the
def is, the art is not**. `AB_AirConditioner.png` shipped in the original mod, finished, 64×64: a
rusted condenser seen from above, a fan in a round housing over a vent grille. No def declared
it. It was the only piece of art in there the game never loaded, and the reason it is now in its
own file is so that the boundary between what was ported and what was added is visible in the
file listing rather than only in a comment.

It is a cooler, which is the design the other four dictate rather than one invented for it:
every building in this mod is a cheaper, cruder variant of something vanilla already has, and
each pays for what it saves. Against vanilla's cooler it costs 70 steel and 2 components instead
of 90 and 3, takes 1200 work instead of 1600 and skill 4 instead of 5; it draws 250 W instead of
200 and moves −16 instead of −21.

It keeps the `AirConditioning` research, deliberately, where the rest of the mod asks for none.
The difference is that nothing else here unlocks anything — a concrete fence is a fence — while
air conditioning is what stands between a colony and a walk-in freezer. Handing that over for
the price of one mod would change the game rather than furnish it.

## The defNames were kept, deliberately

Three of the five carry an author prefix (`AB*`); `ConcreteBarrier` and `ConFence` do not, which
is the kind of name that collides. It was checked rather than assumed, in three places:

- **Core and every DLC** — Core, Royalty, Ideology, Biotech, Anomaly, Odyssey. The nearest miss
  is vanilla's own `AncientConcreteBarrier`, a different name.
- **Every subscribed Workshop mod** — 10 360 of them, including *Fortifications - Medieval*, the
  fortification mod most likely to own a name like `ConFence`. The only file in all of them that
  defines any of these five defNames is the source mod itself.
- **This repository** — every other mod in it.

No collision, so no rename. That was the right way round to decide it: a rename is permanent in
a way a port is not. Renaming `ConcreteBarrier` would take every barrier already built out of
every existing save, and it would have bought nothing.

## What changed in the port

**One real breakage.** `ConFence` declared `<placingDraggableDimensions>1</…>`. RimWorld 1.4
replaced that field with the draw-style system and **deleted it outright** — not renamed, not
aliased; it appears nowhere in the 1.6 assembly and in no def the game ships. An XML element
that matches no field does not stop the loader: it logs one line and carries on with the field
unset. The fence would have loaded, built, linked and looked exactly right, and only refused to
be dragged into a line. `<drawStyleCategory>Defenses</drawStyleCategory>` restores it — the
category vanilla's own fence, sandbags and barricade all use.

**Three things time had left behind**, each of them a feature the game grew after this mod
stopped:

- `ABVending` had no `storageGroupTag`. Storage groups arrived in 1.4; without a tag, this is
  the one piece of storage in the game with no *link storage settings* gizmo, which reads as
  broken rather than as deliberate. It gets its own tag, not `Shelf`: its fixed filter is wider
  than a shelf's, and a shared group would hand shelves settings they cannot honour.
- `ABVending` had no `blueprintClass`. `Blueprint_Storage` is what lets the filter be set on the
  blueprint, before the thing is built. Every vanilla storage building in 1.6 declares one.
- `ABKitchenstove` copied the vanilla electric stove's bill list as it stood in 1.3. Biotech
  added `Make_BabyFood` and `Make_BabyFoodBulk` to it in 1.4; without them, a colony whose only
  stove is this one cannot make baby food at all. Both are added under `MayRequire`, exactly as
  vanilla writes them, so they are inert without Biotech.

**One change that is not a fix.** `ConcreteBarrier` never declared the old draggable field
either, so it was placed one cell at a time in 1.3 too. It is given `Defenses` all the same:
every low-cover piece in 1.6 has a draw style, and a road barrier laid one square per click is a
chore the game stopped asking for. This is the only place the port changes behaviour the
original had on purpose, and it is the easiest one to undo.

**The text.** Labels are lower case, as the game writes them and as vanilla's own *electric
stove*, *shelf* and *fence* are written; three of the five were Title Case. Descriptions gained
their final full stops, and "dark enviroments" became "dark environments". French was added.

## What did not change

The stats, the costs, the power draw, the construction skill requirements, the comps, the
storage filters, the link flags, the textures — and the five `defName`s, so a save moves between
the two mods without losing a building. The original is declared in `<incompatibleWith>`.

The balance was not touched, including two places where it is tempting:

- **`ABKitchenstove` has no `researchPrerequisites`.** The vanilla electric stove needs
  Electricity; this one is a 1×1 electric stove, cheaper and faster to build, available on day
  one. That is SyndicateGamingNetwork's design, not a bug, and gating it would change the game
  rather than port it.
- **It inherits `workTableRoomRole` = `Workshop` from `BenchBase`**, where the vanilla stove
  overrides it to `Kitchen`. This turns out to be inert: the room still reads as a kitchen —
  `RoomRoleWorker_Kitchen` scores on `isMealSource`, which this stove sets — and the work-speed
  penalty the field feeds is only reported when `workTableNotInRoomRoleFactor` differs from 1,
  which here it does not. Left alone.

## What was dropped from the published folder

Two files the game never loads.

- `AB_LamppostIcon.psd` — a Photoshop source. RimWorld cannot read `.psd`, and no def points at
  it. Kept in `Art/`, out of the published folder, so it is not lost from the repository.
- `AB_ConcreteBarrierIcon.png` — deleted outright, and it is the one file that could be. It is
  byte for byte the same as `AB_ConcreteBarrier.png`, which the mod still ships, and it is
  referenced by nothing: the barrier has no `uiIconPath`, so the game builds its menu icon from
  the texture itself.

`About/PublishedFileId.txt` was not carried over, for the obvious reason: it names
SyndicateGamingNetwork's Workshop item.

## Notes from the port

- **Five defs, and four of the five needed nothing.** `Check-XmlFields.ps1` reported exactly one
  unknown element across the whole mod, and it was the one that mattered. Every class the defs
  name — `Building_WorkTable_HeatPush`, `Building_Storage`, `CompHeatPusherPowered`,
  `PlaceWorker_NotUnderRoof`, `PlaceWorker_PreventInteractionSpotOverlap` — still exists in 1.6,
  and every def they reference still resolves.
- **`CompProperties_Glower` was checked, not assumed.** It still takes `glowRadius` and a 0-255
  `glowColor` with a zero alpha; the vanilla standing lamp writes `(214,148,94,0)` in the same
  shape. The lamppost carries no power comp on purpose — `CompGlower` looks for a
  `CompPowerTrader`, a `CompFlickable` or a `CompRefuelable` to decide whether to be lit, finds
  none, and lights. That is what makes it solar.
- **`BenchBase`, `BuildingBase` and `FurnitureWithQualityBase` all exist in Core**, not only in
  the DLC files that also define them. The mod needs no DLC, and does not declare any.

## Adoption

If I do not answer within a reasonable time after being contacted, anyone may freely update this
or any other of my mods, including publishing a continuation of it. All credit must be preserved.
