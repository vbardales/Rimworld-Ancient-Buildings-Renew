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

Status: **opportunistic, and not a gate** (decision of 2026-09-24). No migration run is planned, and
`tested` does not wait for one. If a save that contains the original mod's buildings turns up, the
protocol below is what to run on a disposable copy, and its result is recorded in `docs/runs/`. For
the `tested` gate the scenario is **not applicable**, for that reason. Until it has run, the
description's sentence that a save moves between the two mods is a consequence of keeping the
`defName`s, not a tested result.

When it does run: preserve the original save and mod list, and work on copies only.

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

## Manual run: what to send, and who checks what

The manual scenarios above are run by a person, in the game. The session that keeps this repository
cannot play the game and only sees what is sent to it. So the run is a series of **captures, sent one at
a time**, and each one is read for what it can show. What it cannot show stays the person's to say, and
stays pending until it is said.

**How it goes.**

1. One capture per message: **one image at a time, one video at a time**, in the order of the tables
   below, named by its ID (`F1`, `B2`, ...). The session looks at each at full size before anything else,
   writes what it saw **and what the capture does not show** in the day's summary (`docs/runs/`), then
   minifies or deletes it by the rules of `docs/runs/README.md`. The files go under
   `Tests/Manual/evidence/<date>/<check>/`, ignored by git.
2. A still shows a state, never a gesture or a duration. A video is asked for **only** where the check
   is a gesture or the passing of time, and the table says so.
3. A check is green only when a capture shows it, or when the person says so in words ("yes, one gesture",
   "no, it stayed dark after midnight") and the summary records that as their statement, not as something
   seen. Nothing is inferred from a capture that does not show it.
4. Setup: Core, Biotech and this mod, a temporary test colony. The developer mode is fine to spawn
   colonists, skip research, or speed time; say so in the message when it was used.

**The tables.** *I read* is what the session verifies from the capture. *Only you* is what it cannot, and
the person answers yes or no in the same message.

Fence (Structure)

| ID | Send | I read | Only you |
|---|---|---|---|
| F1 | image: the run of fence blueprints laid by **one** press-and-drag, ten cells or more, with a bend | the blueprints form a continuous line and how many there are | that it was **one gesture** and not ten clicks. If you cannot say for sure, send `F1v` |
| F1v | video, only if F1 leaves a doubt: press, pull, release | the line appearing while the button is held | nothing more |
| F2 | image: the fence joined to a wall on one end and to rock on the other | no gap in the drawn run | that the joins look right |
| F3 | image: a fence gate placed in the line | the gate is part of the line | that it opens and closes |
| F4 | image: a pen marker inside a ring of fence, its inspect text open | the text says the pen is enclosed | nothing more |
| F5 | image: the build menu, fence icon in view | the icon is not a stretched fence segment | whether it reads as the mod's own icon |

Barrier (Security)

| ID | Send | I read | Only you |
|---|---|---|---|
| B1 | image: the run of barrier blueprints laid by one press-and-drag | same as F1 | that it was one gesture (`B1v` if in doubt) |
| B2 | image: the barrier selected, its information window open | the cover figure and the stats as printed | that a colonist standing behind it is actually protected in a shooting test |
| B3 | video, five seconds: a colonist ordered across the barrier | the pawn crossing the barrier cell | that it walks over rather than round |

Lamppost (Structure)

| ID | Send | I read | Only you |
|---|---|---|---|
| L1 | image: the placement refused under a roof, with the message on screen | the refusal text | nothing more |
| L2 | image: placed outdoors, at night, no conduit in frame, the clock visible | lit, wide radius, the hour | that it **stays lit all night**: say yes or no |
| L3 | image: the lamppost selected | no power tab, no flick gizmo | nothing more |

Vending machine (Furniture)

| ID | Send | I read | Only you |
|---|---|---|---|
| V1 | image: the storage tab open | the filter defaults to meals | nothing more |
| V2 | image: the link storage gizmo visible, then a second image with two machines linked | the gizmo and the group | nothing more |
| V3 | image: the blueprint selected with its filter already set, before it is built | the filter on the blueprint | nothing more |
| V4 | image: a meal stored in it, outdoors, inspected | no deterioration line, the room stats without its beauty | that a meal stays sound after **several days**: say yes or no |

Stove (Production)

| ID | Send | I read | Only you |
|---|---|---|---|
| S1 | image: the bill list **with Biotech** | every meal bill, baby food and bulk baby food included | nothing more |
| S2 | image: the bill list **without Biotech** | the same list with **no** baby food, ordinary meals present | nothing more |
| S3 | image: the stove selected | the 300 W draw as printed | that it warms the room, and short-circuits in rain outdoors |
| S4 | image: a meal it cooked, inspected, beside one from a vanilla stove | the two are the same meal | nothing more |

Air conditioner (Temperature)

| ID | Send | I read | Only you |
|---|---|---|---|
| A1 | two images: the menu before `AirConditioning` is researched, and after | absent, then present | nothing more |
| A2 | image: the unit in a wall, both room temperatures readable | one side cooled, the other heated | nothing more |
| A3 | image: the blueprint rotated before building | the drawn grille turned with it | whether the grille faces the exhaust side |
| A4 | image: the unit built in the open | it does nothing but draw power | nothing more |
| A5 | nothing to send | | that it can be flicked off and that it breaks down: yes or no |

English and French

| ID | Send | I read | Only you |
|---|---|---|---|
| EN1..EN6 | six images, one per building: its label in the build menu and its description in the information window, in **English** | the text against the twelve keys, raw keys, clipped text | nothing more |
| FR1..FR6 | the same six, in **French** | the text against the twelve keys, raw keys, English fallback, clipped text | whether the French reads naturally and is right for a player |
| LG | one image per language of the cooking bills, the storage filters, the placement refusal and the power gizmos | raw keys, fallback, clipping | nothing more |

Core alone, and the log

| ID | Send | I read | Only you |
|---|---|---|---|
| C1 | image: with Core and this mod only, the stove's bill list | ordinary meal bills present, none for baby food | nothing more |
| C2 | image: the same colony after a save and a reload, the buildings and their bills visible | they are all still there | nothing more |
| P1 | text: the `Player.log` of each pass, as a file | searched for the strings in "What to search the log for" | nothing more |

**What a capture can never settle**, whatever is sent: that a gesture was one gesture, that something
holds over time, that something feels right, and whether a translation reads well. Those are the person's
to say. The session records them as statements. The offline checkers and the Pickle passes have already
settled what a file or the log can prove, so none of these tables asks for a capture of it.

---

## What belongs in Pickle, and what does not

`../AUDIT.md` asks, for `preTest -> done`, that Pickle scenarios be written and their scope
justified: only what a running game can show stays in Gherkin. They are written, in
[`Tests/Pickle/`](Tests/Pickle/README.md): seven features, thirteen scenarios, and **none has been
run**. Running them, reading their reports and looking at what they capture is `done -> tested`.

**In Pickle, because only a loaded game shows it and a person should not have to read a log:**

| Feature | Pass | Asserts |
|---|---|---|
| `01` the mod loads | every pass but the incompatibility one | the six defs exist and **nothing logged while the defs loaded names one of them**; the fence and barrier carry `drawStyleCategory` `Defenses` |
| `02` placement | minimal | the real build designator accepts the fence, barrier, vending machine and stove |
| `03` stove with Biotech | minimal | the stove takes a meal bill and both baby-food bills |
| `04` stove without Biotech | `sans-biotech` | the two recipes do not exist, and nothing logged names the stove or them |
| `05` original mod | `incompat-original` | with `ancientbld.core` beside it, the original still loads and still carries the field 1.6 removed (the game does not log the shared defNames) |
| `06`, `07` labels | English pass, French pass | the six labels and six descriptions of the loaded defs, in the language the game started in |

The French check is an assertion on the loaded defs, not a capture: a language folder the game does
not find fails silently, and a def label read back in the wrong language is what shows it. An earlier
draft of this section asked for one `@review` capture per building. It is replaced, and no capture is
owed for it.

**Two things Pickle's shipped steps cannot do here, and what stands in for them.**

- Pickle's `no errors were logged` reads what is logged after a scenario is armed, and arming clears
  its buffer, so an error logged while the defs loaded is gone before the first step. That is where this
  mod can fail, so `01` and `04` read RimWorld's own log through two local steps in
  `Tests/Pickle/Source/`. The shipped step is kept for `02` and `03`, which ask about what happens after
  a map is loaded.
- The shipped `I designate` step places a blueprint on each cell directly, so it would pass on a fence
  that could not be dragged. The drag stays manual. What Pickle can assert is the loaded field, which
  is `(null)` in the state the original port was in.

**Not in Pickle, and why:** the fence and barrier drag, and the storage-link gizmo, need a real drag or a
gizmo click the shipped steps do not give; cooling across a wall is a temperature reading a person takes
once; the existing-save migration is opportunistic and is not planned at all (see its section). The drag,
the gizmo and the wall cooling stay manual scenarios in this file. That is a cost decision, not a
judgement that the check matters less. One manual half remains for the stove: with Biotech left out, that
an ordinary meal bill still works needs a map, and the map fixture was written with every DLC active.

**Not tested at all:** what RimWorld does with the declaration itself, such as its warning for a
missing dependency or its load order. `../AUDIT.md`: the game is not what is under test.

## Passing to `tested`

`tested` is claimed only when every line below is true. None is yet: the mod has never been loaded
by RimWorld, and `tested_on` in `STATUS.md` stays empty until then.

**The passes, and what each covers.** A vert on one says nothing about the others. The commands, the
filters and the number of scenarios each should play are in
[`Tests/Pickle/README.md`](Tests/Pickle/README.md).

| Pass | Mods loaded | Covers |
|---|---|---|
| Minimal, English | Core, the DLCs, this mod | Pickle `01`, `02`, `03`, `06`; by hand, the fence and barrier drag, the gizmo, the wall cooling |
| Minimal, French | Core, the DLCs, this mod, French | Pickle `01`, `07`; by hand, the French labels in the menus |
| Without Biotech | Core, the other DLCs, this mod | Pickle `01`, `04`, `06`: baby-food recipes **absent**, no unresolved-recipe error |
| Core alone | Core, this mod | **by hand only**: every other DLC left out too, meal bills still usable on the stove |
| Incompatibility looked at | Core, this mod **and** `ancientbld.core` together | Pickle `05`: the declared incompatibility is still true: the original still loads beside this mod and still carries the field 1.6 removed. The game logs no duplicate for the shared defNames (seen 2026-09-24). A declaration ages; this is how it is read again |
| Original mod replaced | Core, the original `ancientbld.core` first, then swapped for this mod, on a copy of a save | **opportunistic, not a gate**: the existing-save migration protocol above, only if a suitable save turns up |
| With optional mods | not applicable | the mod declares no `loadAfter` and needs nothing, so there is no optional set to stage |

**The three checks for `done -> tested`**, from `../AUDIT.md`:

1. **No scenario parked in `@wip`.** The suite has seven `.feature` files and none carries the tag:
   `grep -rn "@wip" Tests/Pickle/Mod/Pickle/Features` finds nothing, checked 2026-09-24. Search that
   folder only, because this file and `STATUS.md` name the tag in their prose and would answer a search
   of the whole tree. A `@wip` scenario is not a passed scenario: it is repaired and rerun, or deleted
   with its reason.
2. **Every conditional scenario has run, with its condition present.** The conditions are three,
   and each is a tag on a feature. `03` needs `@requires:Ludeon.RimWorld.Biotech`, so it plays in the
   minimal pass and is skipped in the pass without Biotech. `04` is `@without-biotech`, so it plays only
   in that pass and is left out of the others by filter. `05` needs `@requires:ancientbld.core`, so it
   plays only in its own pass and is skipped everywhere else. **A skipped scenario is not a passed one:**
   each has to appear as played in the pass that gives it its condition, and a report is cited only
   after reading its set name and the scenarios it shows, because the report folder is shared by the
   whole machine. The migration is opportunistic and not applicable to this gate.
3. **No manual test left to validate.** Every manual scenario in this file is green, or is listed here as
   not applicable with its reason. Listed so far: the existing-save migration, opportunistic by
   decision of 2026-09-24. The capture of each state is opened and looked at: a green run
   says the path was followed, not that the image shows what it should. No Pickle scenario here is
   tagged `@review`, so no capture of theirs is owed.

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
- The Pickle suite is statically sound: `Tests/Pickle/Check-Steps.ps1` resolves all 80 step lines to
  exactly one step each in the installed Pickle build and compiles the suite's two local patterns, and
  the step project builds. A deliberately undefined line was reported, so the check bites. Static: it
  proves the text of a step exists, not that a scenario passes.

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
