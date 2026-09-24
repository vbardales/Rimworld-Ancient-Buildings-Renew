# Test scenarios

In-game validation is pending and will be completed before publication. Everything below is
what that run has to settle. Record the game version, DLCs, date and results here after testing.

**Why this file is short, and why it still matters.** Six `ThingDef`s, no C#, no patch operations
and no dependencies: there is no modlist interaction to enumerate, so one run covers the lot. But
the defect this port exists to fix **cannot be seen in the log**. An XML element matching no field
does not stop the game — it logs one line at load and carries on with the field unset — so the
fence built and looked exactly right in 1.6 and simply refused to be dragged out in a line, one
cell per click, with nothing on screen to explain it. A run that ends with a clean `Player.log`
proves nothing about it. It has to be dragged by hand.

---

## Enabling it

No dependencies, no load-order constraint. It was added to the end of `activeMods` on 2026-09-11,
with the previous list saved beside it as `ModsConfig.xml.bak-20260911-abr`, and `Player.log` was
emptied at the same time.

```
nelim.ancientbuildingsrenew        this mod            anywhere in the list
```

Run the building scenarios with Core, this mod and Biotech enabled. Use a temporary test
colony. The stove's last two bills require Biotech.

### Without Biotech or any other DLC

- Restart with only Core and this mod enabled, and create a temporary test colony.
- Check the log for the errors listed below, especially unresolved baby-food recipes.
- Verify all six buildings can be built once their requirements are met.
- Build the stove: baby-food bills must be absent, while ordinary meal bills remain usable.
- Cook a simple meal successfully, then save and reload; the buildings and bills must persist.

## Existing-save migration from the original mod

Status: not executed. Run on disposable copies; preserve the original save and mod list.

Preconditions: an existing save containing the original mod's five buildings
(`ABKitchenstove`, `ABVending`, `AB_Lamppost`, `ConcreteBarrier`, `ConFence`). Record its
game version, DLCs and mod list. If no suitable save exists, create a baseline with the
original mod on a compatible game version and record that this is a constructed fixture.
Record building counts, materials, positions, stove bills and vending storage filters.
Separate any base-game version migration errors from this mod's replacement behavior.

1. Back up the save. Disable `ancientbld.core`, enable `nelim.ancientbuildingsrenew` on
   RimWorld 1.6 and retain the save's other required content. Never enable both mods together.
2. Load the copied save. Expect all five building types, counts, positions and materials
   to survive; existing bills and storage filters must remain usable. Investigate any
   missing def, duplicate def, exception or lost building in the log.
3. Exercise each building using the scenarios below, including fence dragging for newly
   placed segments and storage linking. Research AirConditioning and build the newly added
   cooler; it need not exist in the original save.
4. Save under a new name, restart and reload. Expect the buildings, bills and filters to
   persist and function. Repeat the relevant UI checks in English and French.

Record fixture identity, game versions, DLCs, mod lists, before/after observations, log
paths and pass/fail per action. No migration compatibility is certified until this run passes.

## What to search the log for

`Player.log` sits in
`%USERPROFILE%\AppData\LocalLow\Ludeon Studios\RimWorld by Ludeon Studios\Player.log`.

These are the exact strings the 1.6 assembly writes, read out of `Assembly-CSharp.dll` rather than
remembered. Each means something different here.

| String in the log | Written by | What it would mean for this mod |
|---|---|---|
| `Adding duplicate` | `DefDatabase.Add` | A `defName` collision. The five ported names carry no author prefix, and the sweep that cleared them covered Core, the DLCs, 10 360 subscribed Workshop mods and this repository — so this line would mean a mod installed since. |
| `Could not resolve cross-reference` | `DirectXmlCrossRefLoader` | A `defName` pointing at nothing: a recipe on the stove, the `AirConditioning` research, a stuff category, `FenceGate` or `PenMarker`. |
| `Error while resolving references for def` | `DefDatabase.ResolveAllReferences` | Same family, thrown during resolution, and it names the def. |
| `Could not find type named` | the `Class=` resolver | A `Class="..."` that does not exist — the four comps on the air conditioner, `CompProperties_Glower` on the lamppost. In 1.6 this loses the whole def, it does not degrade it. |
| `Could not find a type named` | `ParseHelper.ParseType` | A type named in element **text**: `thingClass`, `blueprintClass`, `inspectorTabs`, `placeWorkers`. Different message, different code path, same cause. |
| `Failed to find any textures at` | the graphic loader | A `texPath` with nothing behind it. All ten paths were checked against the files on disk, case included, so this would mean a packaging fault. |
| `Config error in` | `ThingDef.ConfigErrors` | The consistency rules the game applies only at load. Twenty-six of them are now replayed offline by `Check-ConfigErrors.ps1`, which this mod passes; the rest, listed at the end of that script's output, can still appear here. |

A clean run means **none of those naming `AB_`, `ConFence`, `ConcreteBarrier` or `ABVending`**.
Lines naming other mods are not ours to fix, and are worth leaving in the paste anyway.

---

## The check the log cannot make

**Drag the concrete fence.** Open Structure, pick *concrete fence*, click and hold, and pull.

- It must lay a **line of fence in one gesture**, like the vanilla fence, sandbags or a wall.
- One cell per click means `drawStyleCategory` did not take, and the port's whole reason for
  existing has failed.
- **The concrete barrier gets the same test**, in Security. It never declared the old field, so
  this one is not a repair but the single place the port changes behaviour the original had.

---

## Building by building

### concrete fence — Structure, from any metal

- Joins to **walls and rock** as well as to itself, with no gap in the drawn run.
- A **fence gate** can be placed in the line.
- It counts as a fence for an **animal pen**: put a pen marker inside a ring of it and the marker
  must report the pen enclosed, not leaking.
- Its build menu icon is the mod's own, not a squashed fence segment: it has a `uiIconPath`.

### concrete barrier — Security, from any metal

- Gives **cover** to a colonist standing behind it, half height, like sandbags.
- Colonists can **walk over it** rather than round it: it is `PassThroughOnly`, not a wall.

### lamppost — Structure, from stone

- **Refuses to be placed under a roof**, with the placement message, and takes a spot outdoors.
- Lights a **wide radius, with no power connection at all** and no conduit: that is what makes it
  solar. If it needs power, the glower has picked up a power comp from somewhere.
- It stays lit through the night and is not flickable.

### vending machine — Furniture

- Has the **storage tab**, and the filter defaults to **meals**.
- Has the *link storage settings* gizmo, and two of them can be linked into a group. This is the
  1.4 fix: without a `storageGroupTag` the gizmo is absent and it reads as broken.
- Its **blueprint** is selectable and its filter can be set **before it is built**.
- Meals stored in it, outdoors and unroofed, **do not deteriorate**, and their beauty does not
  count for the room.

### simple kitchen stove — Production, one cell

- The full cooking bill list is there: simple, fine, lavish, survival, their bulk forms, pemmican,
  and — Biotech being on — **baby food and bulk baby food**.
- Draws **300 W**, warms the room while it works, and short-circuits in rain if left outdoors.
- A meal cooked on it comes out the same as one from the vanilla stove.

### ancient air conditioner — Temperature, after research

- **Absent from the menu until `AirConditioning` is researched.** It is the only building here
  that asks for research at all.
- Placed **in a wall**, it cools the room on one side and dumps heat on the other, and the
  exhaust side is the one the texture's grille faces. Rotate it before building and the drawn
  grille must turn with it.
- Placed **in the open**, it does nothing but draw power. That is vanilla `Building_Cooler`
  behaviour — both its cells are then the same room — and it is not a fault to report.
- Can be flicked off, and can break down.

## English and French

Run this check in English, then restart in French. Check all six building labels and
descriptions in the build menus and information windows, including blueprints and buildings
made from different materials. The French labels are: *clôture en béton*,
*barrière en béton*, *lampadaire*, *distributeur automatique*, *cuisinière simple*, *vieux
climatiseur*. Twelve keys in all, six labels and six descriptions.

In both languages, exercise cooking bills (including baby food with Biotech), storage filters
and linking, temperature controls, power/flick gizmos, placement rejection messages and the
fence's related build commands. These interfaces use vanilla text. Check for raw keys,
unexpected English fallback in French, broken formatting and clipped text. Repeat the
DLC-free scenario in both languages. Record results separately from the offline translation
audit; these runtime checks have not yet been performed.

---

## Passing to `tested`

`tested` is claimed only when every line below is true. None is yet: the mod has never been loaded
by RimWorld, and `tested_on` in `STATUS.md` stays empty until then.

**The passes, and what each covers.** A vert on one says nothing about the others.

| Pass | Mods loaded | Covers |
|---|---|---|
| Minimal, with DLC | Core, the DLCs, this mod | the six buildings, the drag test, baby-food bills **present** |
| Without DLC | Core, this mod | baby-food bills **absent** and no unresolved-recipe error: the only conditional scenario the defs contain |
| Original mod replaced | Core, the original `ancientbld.core` first, then swapped for this mod, on a copy of a save | the existing-save migration protocol above |
| Incompatibility looked at | Core, this mod **and** `ancientbld.core` together, on a new throwaway colony and never on the migration save | that the declared incompatibility is still true: the five shared `defName`s must log `Adding duplicate`, and the mod list must flag the pair. A declaration ages; this is how it is read again |
| With optional mods | not applicable | the mod declares no `loadAfter` and needs nothing, so there is no optional set to stage |

**The three checks for `done -> tested`**, from `../AUDIT.md`:

1. **No scenario parked in `@wip`.** This mod has no Pickle suite and no `.feature` file, so
   nothing can be parked. Verified 2026-09-24: `find . -name '*.feature'` finds none, so there is
   no file in which the tag could sit. Search the `.feature` files only, because this file and
   `STATUS.md` name the tag in their prose and would answer a search of the whole tree. The check
   is vacuous today, and is written down so that it is not forgotten the day a suite is added. A
   `@wip` scenario is not a passed scenario: it is repaired and rerun, or deleted with its reason.
2. **Every conditional scenario has run, with its condition present.** For this mod the
   conditions are three: Biotech present and Biotech absent for the stove, and the original mod
   present for the migration. A scenario skipped for want of its condition is not a pass. Cite a
   report only after reading its set name and the scenario it shows: the report folder is shared by
   the whole machine.
3. **No manual test left to validate.** Every scenario in this file is green, or is listed here as
   not applicable with its reason. The capture of each state is opened and looked at: a green run
   says the path was followed, not that the image shows what it should.

**Which proofs to keep, and how to cut them down**, is written in
[`docs/runs/README.md`](docs/runs/README.md): one proof per check, the log of every pass as text,
nothing about a superseded revision, captures reviewed at full size and then minified. Evidence
stays on disk and is ignored by git; what is versioned is the day's summary in `docs/runs/`.

## Settled without the game

Rerun on 2026-09-12: all six checkers passed. Run again after changes to the defs or
translations. From this repository's root, with PowerShell 7 and RimWorld 1.6 installed:

```powershell
pwsh -NoProfile -File ../scripts/Check-XmlFields.ps1 -ModPath ./Mod
pwsh -NoProfile -File ../scripts/Check-DefRefs.ps1 -ModPath ./Mod
pwsh -NoProfile -File ../scripts/Check-XmlClasses.ps1 -ModPath ./Mod -TypeLists ../rw16_types.txt
pwsh -NoProfile -File ../scripts/Check-TypeRefs.ps1 -ModPath ./Mod
pwsh -NoProfile -File ../scripts/Check-DefInjected.ps1 -TransMod ./Mod
pwsh -NoProfile -File ../scripts/Check-ConfigErrors.ps1 -ModPath ./Mod
```

These scripts and the type index are shared workspace prerequisites, outside this Git
repository. A standalone clone does not include them. The scripts default to the Steam
RimWorld installation under `C:\Program Files (x86)\Steam\steamapps\common\RimWorld`;
consult their parameters for a different installation location.

- Every element maps to a real 1.6 field — `Check-XmlFields.ps1`. This is the check that found
  `placingDraggableDimensions`, and it is the only reason the drag test above exists.
- Every def and every `ParentName` resolves, and to the right **type** of def — `Check-DefRefs.ps1`.
- Every C# type named in the XML exists — `Check-XmlClasses.ps1`, 19 of them.
- No unguarded reference to a third-party type — `Check-TypeRefs.ps1`.
- All 12 translation keys land on something — `Check-DefInjected.ps1`.
- The six defs break none of the 26 load-time consistency rules that can be decided offline —
  `Check-ConfigErrors.ps1`, written for this mod on 2026-09-12 and calibrated against the game's
  own 13 809 defs. It is the one that would have caught the air conditioner had its `fillPercent`
  and its `isAirtight` disagreed.
- The ten `texPath` and `uiIconPath` values each point at a file that exists, case included.

The two Workshop images were checked the same day and are not part of the run either: the banner
read at 268 px with its title, its lamp pool and three separated concrete volumes, the icon read
at 32 px, and both are inside the weight limits at 612 KB and 22 KB.

## Known and accepted

- **The stove asks for no research**, where the vanilla electric stove needs Electricity. It is
  SyndicateGamingNetwork's balance, not an oversight, and it is left alone. In `ATTRIBUTION.md`.
- **It inherits `workTableRoomRole` = `Workshop`** rather than overriding to `Kitchen`. Checked
  and inert: the room is recognised as a kitchen through `isMealSource` anyway, and the speed
  penalty is only reported when `workTableNotInRoomRoleFactor` differs from 1.
- **The air conditioner in the open air is a no-op.** Above, and by design.
