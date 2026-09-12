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

## French

Switch the language and check the six labels and their descriptions: *clôture en béton*,
*barrière en béton*, *lampadaire*, *distributeur automatique*, *cuisinière simple*, *vieux
climatiseur*. Twelve keys in all, six labels and six descriptions.

---

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
