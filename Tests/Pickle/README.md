# Pickle suite for Ancient Buildings Renew

In-game scenarios for a mod that ships six `ThingDef`s, no code and no patch. They are **written and
statically checked; none has been run.** `../../TESTING.md` says what belongs here, what stays manual and
why. Nothing in this folder is part of `Mod/`, which is what Steam receives whole.

## What is asserted

| Feature | Pass | Asserts |
|---|---|---|
| `01-the-mod-loads` | every pass but the incompatibility one | the mod is loaded, its six defs exist, **nothing logged while the defs loaded names one of them**, and the fence and barrier carry `drawStyleCategory` `Defenses` |
| `02-placement` | minimal, English | the real build designator accepts the fence, barrier, vending machine and stove on an open map |
| `03-stove-with-biotech` | minimal, English | with Biotech the stove takes a meal bill **and** both baby-food bills |
| `04-stove-without-biotech` | `sans-biotech` | with Biotech left out, the two recipes do not exist and nothing logged names the stove or them |
| `05-original-mod-incompatibility` | `incompat-original` | with `ancientbld.core` beside it, the game logs a duplicate for the shared defNames |
| `06-labels-en`, `07-labels-fr` | English pass, French pass | the six labels and six descriptions of the loaded defs, in the language the game started in |

Seven features, thirteen scenarios, generated from `Mod/Defs` and `Mod/Languages/French` where they are
text. There is no local step for anything Pickle already says: two, in `Source/LoggedMessageSteps.cs`.

## Two limits worth knowing before reading a green

**Pickle's "no errors were logged" cannot see the errors this mod can produce.** It reads what is logged
after a scenario is armed, and arming clears the buffer; a def that fails to load logs its error at startup,
before any scenario. So `01` and `04` do not use it. They read RimWorld's own log, `Verse.Log.Messages`,
through this suite's two steps. That log is bounded, so a long modlist can push an early line out, which is
why every pass here stages a small set. `02` and `03` do use the shipped step, and it is right for them: they
ask about what happens after the map is loaded.

**The drag is not tested.** The fence was broken in one way: RimWorld 1.4 deleted the field that made it
draggable, and the game loaded it with nothing set, so it built and looked right and could not be pulled out
in a line. `01` asserts the loaded field, which comes back as `(null)` in that state. It cannot show the drag
itself, because the shipped `I designate` step places a blueprint on each cell directly and would pass on a
fence that could not be dragged. The drag stays a manual scenario.

## Passes

One at a time, from the collection root, each through the shared queue and never by hand. Read
`../../../AUDIT.md` first: the machine has one RimWorld, and nothing here launches the game on Windows.

```powershell
# minimal, English
powershell.exe -ExecutionPolicy Bypass -File scripts/Run-PickleWsl.ps1 -Mod AncientBuildingsRenew -Language English -Filter 'Ancient Buildings Renew - Pickle tests,!@fr-only,!@without-biotech' -EvidenceDir AncientBuildingsRenew/Tests/Pickle/evidence/minimal-en

# minimal, French: no map to load, so no @save
powershell.exe -ExecutionPolicy Bypass -File scripts/Run-PickleWsl.ps1 -Mod AncientBuildingsRenew -Language French -Filter 'Ancient Buildings Renew - Pickle tests,!@en-only,!@without-biotech,!@save' -EvidenceDir AncientBuildingsRenew/Tests/Pickle/evidence/minimal-fr

# Biotech left out
powershell.exe -ExecutionPolicy Bypass -File scripts/Run-PickleWsl.ps1 -Mod AncientBuildingsRenew -DepMap wsl-deps.sans-biotech.map -Language English -Filter 'Ancient Buildings Renew - Pickle tests,!@fr-only,!@save' -EvidenceDir AncientBuildingsRenew/Tests/Pickle/evidence/sans-biotech

# the original mod beside it
powershell.exe -ExecutionPolicy Bypass -File scripts/Run-PickleWsl.ps1 -Mod AncientBuildingsRenew -DepMap wsl-deps.incompat-original.map -Language English -Filter '05-original-mod-incompatibility' -EvidenceDir AncientBuildingsRenew/Tests/Pickle/evidence/incompat-original
```

| Pass | Scenarios it should play | Skipped by requirement |
|---|---|---|
| minimal, English | 8: `01` x4, `02`, `03`, `06` x2 | `05` (1) |
| minimal, French | 6: `01` x4, `07` x2 | `05` (1) |
| sans-biotech | 8: `01` x4, `04` x2, `06` x2 | `05` (1) |
| incompat-original | 1: `05` | none |

Compare those numbers with what a report says it discovered and played, and read `exitReason` before the
counts. A skipped scenario is not a passed one: `03` is skipped in the pass without Biotech, `05` in every
pass but its own, and each has to have run in the pass that gives it its condition.

Why the passes are these and not others. The mod declares no dependency and no `loadAfter`, so there is
no optional-mod pass to run. Biotech is the only DLC it touches, so it is the only one left out. The
`test-colony` fixture was written with every DLC active, which is why the pass without Biotech plays no map.
`../../TESTING.md` still runs Core alone by hand.

A session waits for its ticket with the `Monitor` tool on a read-only poll of `scripts/Pickle-Status.ps1`,
which is what a heartbeat is under Codex, never with a cron and never with a script launched in the
background from a shell.

## Before queuing

```powershell
dotnet build Tests/Pickle/Source/AncientBuildingsRenew.PickleSteps.csproj -c Release
powershell -NoProfile -ExecutionPolicy Bypass -File Tests/Pickle/Check-Steps.ps1
```

The build writes the step DLL into `Mod/Pickle/Assemblies/`, which git ignores: rebuild before every run,
because Pickle loads step DLLs when the game starts. `Check-Steps.ps1` matches every step line against
Pickle's own vocabulary read from the installed assemblies and against this suite's two steps, and fails on
an undefined or ambiguous one before a ticket is taken. It is static: it proves the text of a step exists,
not that the step does what the scenario hopes. Checked on 2026-09-24: 80 step lines, all resolved. A
deliberately wrong line was reported as undefined, so the check does bite.

## Not verified

- **Nothing has been run.** Every scenario, including its expected values, is unverified until a pass plays it.
- The value `Defenses` for the fence is what a `DrawStyleCategoryDef` prints as, its `defName`, and a
  reading of the step's source rather than of a run.
- The cells `(140..152, 155)` on `test-colony` come from Adaptive Storage Neolithic's suite on the same
  fixture; whether a stove's interaction cell is free there is not known.
- Whether the duplicate is logged as an error or a warning is not known, which is why the incompatibility
  step reads both.
- `ancientbld.core` has not been downloaded into the WSL install's Workshop cache.
- `../../../PickleTools/Headless/README.md` lists a step, `an error matching ... was logged`, that the
  installed Pickle build does not have: 201 steps were read out of it by reflection and it is not among
  them. This suite does not depend on it.
