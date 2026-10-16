# Test scenarios

In-game validation done, mod published (1.0.0, 1.0.1). Below = what run must settle for new version; Pickle suite plays it. What ran on current revision: `docs/runs/2026-10-10.txt`.

**Why file short, why still matters.** Six `ThingDef`s, no C#, no patch operations, no dependencies: no modlist interaction to enumerate, so one run covers all. But defect this port exists to fix **cannot be seen in log**. XML element matching no field does not stop game — logs one line at load, carries on with field unset — so fence built and looked right in 1.6 yet refused to drag out in a line, one cell per click, nothing on screen to explain. Clean `Player.log` proves nothing about it. Must drag by hand.

---

## Enabling it

No dependencies, no load-order constraint. Added to end of `activeMods` on 2026-09-11, previous list saved beside it as `ModsConfig.xml.bak-20260911-abr`, `Player.log` emptied same time.

```
nelim.ancientbuildings        this mod            anywhere in the list
```

Run building scenarios with Core, this mod, Biotech enabled. Use temporary test colony. Stove's last two bills require Biotech.

### Without Biotech or any other DLC

- Restart with only Core and this mod enabled, create temporary test colony.
- Check log for errors listed below, especially unresolved baby-food recipes.
- Verify all six buildings buildable once requirements met.
- Build stove: baby-food bills must be absent, ordinary meal bills still usable.
- Cook simple meal, then save and reload; buildings and bills must persist.

## Existing-save migration from the original mod

Status: **dropped** (owner decision 2026-10-11, supersedes 2026-09-24 "opportunistic"): backward compatibility with saves from original mod not guaranteed, not tested. `tested` does not wait for run. Protocol below kept for reference only. Former status: opportunistic, not a gate (decision 2026-09-24). No migration run planned, `tested` does not wait for one. If save containing original mod's buildings turns up, run protocol below on disposable copy, record result in `docs/runs/`. For `tested` gate scenario **not applicable**, for that reason. Until run, description's sentence that save moves between the two mods is consequence of keeping `defName`s, not tested result.

When it runs: preserve original save and mod list, work on copies only.

Preconditions: existing save containing original mod's five buildings (`ABKitchenstove`, `ABVending`, `AB_Lamppost`, `ConcreteBarrier`, `ConFence`). Record game version, DLCs, mod list. If no suitable save, create baseline with original mod on compatible game version, record it is constructed fixture. Record building counts, materials, positions, stove bills, vending storage filters. Separate base-game version migration errors from this mod's replacement behavior.

1. Back up save. Disable `ancientbld.core`, enable `nelim.ancientbuildings` on RimWorld 1.6, keep save's other required content. Never enable both mods together.
2. Load copied save. Expect all five building types, counts, positions, materials survive; existing bills and storage filters stay usable. Investigate any missing def, duplicate def, exception, lost building in log.
3. Exercise each building using scenarios below, including fence dragging for newly placed segments and storage linking. Research AirConditioning, build newly added cooler; need not exist in original save.
4. Save under new name, restart, reload. Expect buildings, bills, filters persist and function. Repeat relevant UI checks in English and French.

Record fixture identity, game versions, DLCs, mod lists, before/after observations, log paths, pass/fail per action. No migration compatibility certified until run passes.

## What to search the log for

`Player.log` sits in
`%USERPROFILE%\AppData\LocalLow\Ludeon Studios\RimWorld by Ludeon Studios\Player.log`.

Exact strings 1.6 assembly writes, read out of `Assembly-CSharp.dll`, not remembered. Each means something different here.

| String in the log | Written by | What it would mean for this mod |
|---|---|---|
| `Adding duplicate` | `DefDatabase.Add` | `defName` collision. Five ported names carry no author prefix; sweep that cleared them covered Core, DLCs, 10 360 subscribed Workshop mods, this repository — so line would mean mod installed since. |
| `Could not resolve cross-reference` | `DirectXmlCrossRefLoader` | `defName` pointing at nothing: recipe on stove, `AirConditioning` research, stuff category, `FenceGate` or `PenMarker`. |
| `Error while resolving references for def` | `DefDatabase.ResolveAllReferences` | Same family, thrown during resolution, names the def. |
| `Could not find type named` | the `Class=` resolver | `Class="..."` that does not exist — four comps on air conditioner, `CompProperties_Glower` on lamppost. In 1.6 loses whole def, does not degrade it. |
| `Could not find a type named` | `ParseHelper.ParseType` | Type named in element **text**: `thingClass`, `blueprintClass`, `inspectorTabs`, `placeWorkers`. Different message, different code path, same cause. |
| `Failed to find any textures at` | the graphic loader | `texPath` with nothing behind it. All ten paths checked against files on disk, case included, so would mean packaging fault. |
| `Config error in` | `ThingDef.ConfigErrors` | Consistency rules game applies only at load. Twenty-six now replayed offline by `Check-ConfigErrors.ps1`, which this mod passes; rest, listed at end of script's output, can still appear here. |

Clean run means **none of those naming `AB_`, `ConFence`, `ConcreteBarrier` or `ABVending`**. Lines naming other mods not ours to fix, still worth leaving in paste.

---

## The check the log cannot make

**Drag the concrete fence.** Open Structure, pick *concrete fence*, click and hold, pull.

- Must lay **line of fence in one gesture**, like vanilla fence, sandbags or wall.
- One cell per click means `drawStyleCategory` did not take, port's whole reason for existing failed.
- **Concrete barrier gets same test**, in Security. It never declared old field, so this is not repair but single place port changes behaviour original had.

---

## Building by building

### concrete fence — Structure, from any metal

- Joins to **walls and rock** as well as itself, no gap in drawn run.
- **Fence gate** can be placed in line.
- Counts as fence for **animal pen**: put pen marker inside ring of it, marker must report pen enclosed, not leaking.
- Build menu icon is mod's own, not squashed fence segment: has `uiIconPath`.

### concrete barrier — Security, from any metal

- Gives **cover** to colonist standing behind, half height, like sandbags.
- Colonists can **walk over it** rather than round: `PassThroughOnly`, not wall.

### lamppost — Structure, from stone

- **Refuses placement under roof**, with placement message, takes spot outdoors.
- Lights **wide radius, no power connection at all**, no conduit: that makes it solar. If it needs power, glower picked up power comp from somewhere.
- Stays lit through night, not flickable.

### vending machine — Furniture

- Has **storage tab**, filter defaults to **meals**.
- Has *link storage settings* gizmo, two can be linked into group. This is 1.4 fix: without `storageGroupTag` gizmo absent, reads as broken.
- Its **blueprint** selectable, filter settable **before built**.
- Meals stored in it, outdoors and unroofed, **do not deteriorate**, beauty does not count for room.

### simple kitchen stove — Production, one cell

- Full cooking bill list there: simple, fine, lavish, survival, bulk forms, pemmican, and — Biotech on — **baby food and bulk baby food**.
- Draws **300 W**, warms room while working, short-circuits in rain if left outdoors.
- Meal cooked on it comes out same as vanilla stove.

### ancient air conditioner — Temperature, after research

- **Absent from menu until `AirConditioning` researched.** Only building here asking for research at all.
- Placed **in wall**, cools room one side, dumps heat other; exhaust side is the one texture's grille faces. Rotate before building, drawn grille must turn with it.
- Placed **in open**, does nothing but draw power. Vanilla `Building_Cooler` behaviour — both cells then same room — not fault to report.
- Can be flicked off, can break down.

## English and French

Run check in English, then restart in French. Check all six building labels and descriptions in build menus and information windows, including blueprints and buildings made from different materials. French labels: *clôture en béton*, *barrière en béton*, *lampadaire*, *distributeur automatique*, *cuisinière simple*, *vieux climatiseur*. Twelve keys in all, six labels, six descriptions.

In both languages, exercise cooking bills (including baby food with Biotech), storage filters and linking, temperature controls, power/flick gizmos, placement rejection messages, fence's related build commands. Interfaces use vanilla text. Check for raw keys, unexpected English fallback in French, broken formatting, clipped text. Repeat DLC-free scenario in both languages. Record results separately from offline translation audit. Six labels and six descriptions read side by side with English by owner 2026-09-28: she changed vending machine ("des ingrédients") and air conditioner ("climatiseur antique", "appareil de climatisation remis en état", "il se construit plus vite et avec moins"), validated rest, recorded as her statement. On 2026-10-01 she applied further review: barrier, lamppost, fence, air conditioner wording changed (label kept "climatiseur antique" by her word, same day; "dispositif de gestion du trafic" gone). 2026-09-28 wordings quoted above superseded. Pickle 07 asserts loaded texts, replayed after that change.

## The plan: the game is not launched by a person, Pickle plays it

Owner does not launch game (2026-09-25), nor does this session. Every check of sections above that running game can answer is Pickle scenario, played by dispatcher; session reads report and captures, then shows those that matter to owner. No series of captures to send any more, no ID (`F1`, `B2`, ...) to quote. Earlier draft of this section had them; replaced.

**What is automated, by building.** Feature files in [`Tests/Pickle/`](Tests/Pickle/README.md).

| Building | Check | Scenario | State |
|---|---|---|---|
| fence, barrier | offers line style; one drag from (140,155) to (150,155) lays blueprints at 140, 145, 150 | `08` | green |
| lamppost | solar (glower, no power comp, no flick comp) | `09` | green |
| lamppost | refuses roofed cell with game's message, accepts open one | `09` | green |
| lamppost | at 2 h ground two cells away goes from below 0.4 to above 0.4 once built; capture kept | `09` | green (2026-09-26) |
| vending machine | offers link-storage command; blueprint has storage settings; meal on it does not deteriorate, same meal on ground does | `10` | green |
| stove | 300 W, heat pusher, flickable | `11` | green |
| stove | bill list with and without Biotech | `03`, `04` | green |
| air conditioner | hidden until `AirConditioning` finished, then shown | `11` | green |
| air conditioner | 250 W and temperature control | `11` | green |
| all six | labels and descriptions, English and French | `06`, `07` | green |
| all six | load without error naming them; fence and barrier carry `Defenses` | `01` | green |
| all six | real designator accepts them on open map | `02` | green |
| original mod | beside it, original still loads with field 1.6 removed | `05` | green |

**Not automated, and what happens to each.** Check neither here nor in table is not "passed": listed below with reason, or pending work.

| Check | Why not | Status |
|---|---|---|
| pointer's own press-and-drag | engine's input, not mod; scenario drives same style worker and designator pointer ends in. PickleTools confirmed 2026-09-28 (decompiled installed Pickle) its input backends expose only MoveTo, Click (one press and release at one point), Key, GetMouseLocation: no separate mouse-down, mouse-up or drag, none planned that it could find | **not applicable: engine**, accepted by owner 2026-09-28 |
| cooling through wall, room each side | needs walls, roofs, power | scenario `13`, green since 2026-09-27 (`docs/runs/`); took eight fix tickets: forced roof outside enclosed room does not hold, `Building_Cooler.TickRare` reads only own north/south neighbours (decompiled to find this), per-step wait timeout, z increasing northward, not southward |
| grille turned with rotation | drawing, not value | scenario `14`, green since 2026-09-28: two units side by side, grille bar visibly moved from bottom edge to left edge between North and East |
| air conditioner in open does nothing but draw power | vanilla `Building_Cooler` behaviour, not mod's | proposed not applicable: vanilla |
| stove short-circuits in rain outdoors | weather event over time; flag `shortCircuitInRain` of its power component asserted instead | scenario `12`, green since 2026-09-26 |
| barrier gives cover; pawn walks over it | vanilla behaviour of `fillPercent` and `passability`, asserted on def | scenario `12`, green since 2026-09-26 |
| fence gate, pen enclosed | vanilla pen logic: `isFence` and related build commands `PenMarker`, `FenceGate`, asserted on def | scenario `12`, green since 2026-09-26 |
| fence joins to wall and rock | vanilla link logic of atlas texture; drawing | pending: capture `@review`, or not applicable |
| French reads naturally | judgement | validated by owner 2026-09-28 (her statement), after her edits; scenario `07` asserts final texts |
| lamppost light reads as lit | looks: wide soft glow, no cone (owner asked for it, chose 2026-09-26 to keep light points as they are) | **decided: no change** |
| existing-save migration | dropped (2026-10-11) | not applicable, as above |

**How a capture is used.** Scenario tagged `@review` writes screenshot. Session opens it at full size, writes what it shows **and what it does not show** in day's line of `docs/runs/`, then keeps JPEG next to four text files of report. Still never proves gesture or duration; those asserted by steps (`I wait N ticks`, the hour) or listed above. Developer mode used by Pickle to set hour and finish research, scenario says so.

**What a capture can never settle:** that something holds over long time, that it feels right, whether translation reads well. Those are owner's to say, recorded as her statement.

---

## What belongs in Pickle, and what does not

`../AUDIT.md` asks that only what running game can show stays in Gherkin. Suite in [`Tests/Pickle/`](Tests/Pickle/README.md): eleven features, twenty-three scenarios, all with green run (2026-09-24 to 26, `docs/runs/`). Running them, reading reports, looking at what they capture was `done -> tested`.

**Why some checks use steps written for this suite** (`Tests/Pickle/Source/`):

- Pickle's `no errors were logged` reads what is logged after scenario armed, arming clears its buffer, so error logged while defs loaded gone before first step. That is where this mod can fail, so `01` and `04` read RimWorld's own log through two local steps. Shipped step kept for `02` and `03`.
- Pickle's `I designate` step places blueprint on each cell directly, would pass on fence that could not be dragged. `08` therefore asks designator for drawing styles, ends drag through game's own style worker, so loaded field exercised, not only read.
- Lamp, vending machine, air conditioner asked of game (light on glow grid, deterioration rate, designator visibility) through local steps in `Source/BuildingSteps.cs`.

**Not tested at all:** what RimWorld does with declaration itself, such as warning for missing dependency or load order. `../AUDIT.md`: game not what is under test.

## The passes and the conditional scenarios

All played green on 1.0.0, replayed green on 1.0.1 (`docs/runs/2026-10-10.txt`).

**The passes, and what each covers.** Vert on one says nothing about others. Commands, filters, number of scenarios each should play in [`Tests/Pickle/README.md`](Tests/Pickle/README.md).

| Pass | Mods loaded | Covers |
|---|---|---|
| Minimal, English | Core, the DLCs, this mod | Pickle `01`, `02`, `03`, `06`; by hand, fence and barrier drag, gizmo, wall cooling |
| Minimal, French | Core, the DLCs, this mod, French | Pickle `01`, `07`; by hand, French labels in menus |
| Without Biotech | Core, other DLCs, this mod | Pickle `01`, `04`, `06`: baby-food recipes **absent**, no unresolved-recipe error |
| Core alone | Core, this mod | **by hand only**: every other DLC left out too, meal bills still usable on stove |
| Incompatibility looked at | Core, this mod **and** `ancientbld.core` together | Pickle `05`: declared incompatibility still true: original still loads beside this mod, still carries field 1.6 removed. Game logs no duplicate for shared defNames (seen 2026-09-24). Declaration ages; this is how it is read again |
| 1.7, minimal, English | Core, DLCs, this mod, 1.7 build of Pickle steps (`wsl-deps.minimal-17.map`), RimWorld 1.7 | Pickle `01`, `02`, `03`, `06`, all features but `15-gallery`; green 2026-10-14, 24 of 24 (`docs/runs/2026-10-13.txt`) |
| 1.7, without Biotech | as above, Biotech left out (`wsl-deps.sans-biotech-17.map`) | Pickle `01`, `04`, `06`; green 2026-10-14, 6 of 6 |
| 1.7, incompatibility looked at | as 1.7 minimal plus `ancientbld.core` (`wsl-deps.incompat-original-17.map`) | Pickle `05`, filter `05-original-mod-incompatibility`; green 2026-10-15, 1 of 1 (`docs/runs/2026-10-13.txt`) |
| 1.7, French | not applicable | 1.7 install ships English only (`-Language French` stops at launch); labels unchanged since 1.6 French green. Replay when French 1.7 pack exists. `tested_1_7: yes` holds for English only |
| Original mod replaced | Core, original `ancientbld.core` first, then swapped for this mod, on copy of save | **opportunistic, not a gate**: existing-save migration protocol above, only if suitable save turns up |
| With optional mods | not applicable | mod declares no `loadAfter`, needs nothing, so no optional set to stage |

**Conditions for new version** (`../AUDIT.md`, `playTests`):

1. **No scenario parked in `@wip`.** Suite has seven `.feature` files, none carries tag: `grep -rn "@wip" Tests/Pickle/Mod/Pickle/Features` finds nothing, checked 2026-09-24. Search that folder only, because this file and `STATUS.md` name tag in prose and would answer search of whole tree. `@wip` scenario is not passed scenario: repaired and rerun, or deleted with its reason.
2. **Every conditional scenario has run, with its condition present.** Three conditions, each a tag on a feature. `03` needs `@requires:Ludeon.RimWorld.Biotech`, plays in minimal pass, skipped in pass without Biotech. `04` is `@without-biotech`, plays only in that pass, left out of others by filter. `05` needs `@requires:ancientbld.core`, plays only in own pass, skipped everywhere else. **Skipped scenario is not passed one:** each must appear as played in pass giving it its condition, and report cited only after reading its set name and scenarios it shows, because report folder shared by whole machine. Migration opportunistic, not applicable to this gate.
3. **No manual test left to validate.** Every manual scenario in this file green, or listed here as not applicable with reason. Listed so far: existing-save migration, opportunistic by decision 2026-09-24. Capture of each state opened and looked at: green run says path followed, not that image shows what it should. No Pickle scenario here tagged `@review`, so no capture of theirs owed.

**Which proofs to keep, how to cut them down**, written in [`docs/runs/README.md`](docs/runs/README.md): one proof per check, log of every pass as text, nothing about superseded revision, captures reviewed at full size then minified. Evidence stays on disk, ignored by git; versioned is day's summary in `docs/runs/`.

## Settled without the game

Rerun 2026-10-10 on revision `2611536`: all six checkers passed. Run again after changes to defs or translations. From this repository's root, with PowerShell 7 and RimWorld 1.6 installed:

```powershell
pwsh -NoProfile -File ../scripts/Check-XmlFields.ps1 -ModPath ./Mod
pwsh -NoProfile -File ../scripts/Check-DefRefs.ps1 -ModPath ./Mod
pwsh -NoProfile -File ../scripts/Check-XmlClasses.ps1 -ModPath ./Mod -TypeLists ../rw16_types.txt
pwsh -NoProfile -File ../scripts/Check-TypeRefs.ps1 -ModPath ./Mod
pwsh -NoProfile -File ../scripts/Check-DefInjected.ps1 -TransMod ./Mod
pwsh -NoProfile -File ../scripts/Check-ConfigErrors.ps1 -ModPath ./Mod
```

These scripts and type index are shared workspace prerequisites, outside this Git repository. Standalone clone does not include them. Scripts default to Steam RimWorld installation under `C:\Program Files (x86)\Steam\steamapps\common\RimWorld`; consult their parameters for different install location.

- Every element maps to real 1.6 field — `Check-XmlFields.ps1`. This check found `placingDraggableDimensions`, only reason drag test above exists.
- Every def and every `ParentName` resolves, to right **type** of def — `Check-DefRefs.ps1`.
- Every C# type named in XML exists — `Check-XmlClasses.ps1`, 19 of them.
- No unguarded reference to third-party type — `Check-TypeRefs.ps1`.
- All 12 translation keys land on something — `Check-DefInjected.ps1`.
- Six defs break none of 26 load-time consistency rules decidable offline — `Check-ConfigErrors.ps1`, written for this mod 2026-09-12, calibrated against game's own 13 809 defs. Would have caught air conditioner had its `fillPercent` and `isAirtight` disagreed.
- Ten `texPath` and `uiIconPath` values each point at existing file, case included.
- Pickle suite statically sound: shared `scripts/Check-Steps.ps1` resolves all 80 step lines to exactly one step each in installed Pickle build, compiles suite's two local patterns, step project builds. Deliberately undefined line reported, so check bites. Static: proves text of step exists, not that scenario passes.
Two Workshop images checked 2026-10-10, not part of run: Preview and icon opened and read (icon at 128 px), both inside weight limits (Preview 661 234 bytes, icon 33 635 bytes).

## Known and accepted

- **Stove asks for no research**, where vanilla electric stove needs Electricity. SyndicateGamingNetwork's balance, not oversight, left alone. In `ATTRIBUTION.md`.
- **Inherits `workTableRoomRole` = `Workshop`** rather than overriding to `Kitchen`. Checked, inert: room recognised as kitchen through `isMealSource` anyway, speed penalty only reported when `workTableNotInRoomRoleFactor` differs from 1.
- **Air conditioner in open air is no-op.** Above, by design.