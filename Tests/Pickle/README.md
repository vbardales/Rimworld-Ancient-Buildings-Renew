# Pickle suite for Ancient Buildings Renew

In-game scenarios for a mod that ships six `ThingDef`s, no code and no patch. **All four passes, features 08 to 11 and their fix tickets have
played, each scenario has a green run (2026-09-24 to 26, `../../docs/runs/`).** `../../TESTING.md` says what belongs here, what stays manual and
why. Nothing in this folder is part of `Mod/`, which is what Steam receives whole.

## What is asserted

| Feature | Pass | Asserts |
|---|---|---|
| `01-the-mod-loads` | every pass but the incompatibility one | the mod is loaded, its six defs exist, **nothing logged while the defs loaded names one of them**, and the fence and barrier carry `drawStyleCategory` `Defenses` |
| `02-placement` | minimal, English | the real build designator accepts the fence, barrier, vending machine and stove on an open map |
| `03-stove-with-biotech` | minimal, English | with Biotech the stove takes a meal bill **and** both baby-food bills |
| `04-stove-without-biotech` | `sans-biotech` | with Biotech left out, the two recipes do not exist and nothing logged names the stove or them |
| `05-original-mod-incompatibility` | `incompat-original` | with `ancientbld.core` beside it, the original still loads and still carries the field 1.6 removed (the game does not log the shared defNames) |
| `06-labels-en`, `07-labels-fr` | English pass, French pass | the six labels and six descriptions of the loaded defs, in the language the game started in |
| `08-fence-and-barrier-drag` | minimal, English, `@save @review` | the fence and the barrier offer the line style, and one drag from (140,155) to (150,155) lays blueprints at 140, 145 and 150; screenshots |
| `09-lamppost` | comps: every pass; refusal and night light: minimal, English | glower and no power or flick comp; a roofed cell is refused with the game's message; at 2 h the light two cells away goes from below 0.4 to above 0.4 once the lamp is built (the game caps it at 0.5); capture |
| `10-vending-machine` | minimal, English, `@save` | the built machine offers the link-storage command, its blueprint has storage settings, a meal on it does not deteriorate and the same meal on the ground does |
| `11-stove-and-air-conditioner` | stove and AC defs: every pass; research gate: minimal, English | the stove draws 300 W with a powered heat pusher and a flick comp; the AC draws 250 W with a temperature control and is hidden until `AirConditioning` is finished (research is undone first, the colony had it) |
| `12-def-claims` | every pass | the barrier's fill percent and passability, the fence's `isFence` flag with the pen marker and gate as related commands, the stove's `shortCircuitInRain` (written 2026-09-26, not yet played) |

Twelve features, twenty-six scenarios, generated from `Mod/Defs` and `Mod/Languages/French` where they are
text. Local steps: `Source/LoggedMessageSteps.cs` (two, for the log) and `Source/BuildingSteps.cs` (the rest, all
prefixed "Ancient Buildings Renew: ").

## Two limits worth knowing before reading a green

**Pickle's "no errors were logged" cannot see the errors this mod can produce.** It reads what is logged
after a scenario is armed, and arming clears the buffer; a def that fails to load logs its error at startup,
before any scenario. So `01` and `04` do not use it. They read RimWorld's own log, `Verse.Log.Messages`,
through this suite's two steps. That log is bounded, so a long modlist can push an early line out, which is
why every pass here stages a small set. `02` and `03` do use the shipped step, and it is right for them: they
ask about what happens after the map is loaded.

**The drag is tested through the game's own drawing style, not through the pointer.** The fence was broken in one
way: RimWorld 1.4 deleted the field that made it draggable, and the game loaded it with nothing set, so it built
and looked right and could not be pulled out in a line. `01` asserts the loaded field, and `08` asks the build
designator for its styles and ends a drag through the style worker. The shipped `I designate` step places a blueprint
on each cell directly and would pass on a fence that could not be dragged, so it is not used for this. What no
scenario reaches is the pointer's own press and release, which is the engine's.

## Passes

One request per pass, deposited from the collection root, never a launcher run by hand and never a process
kept in a session. `../../../AUDIT.md` first: the machine has one RimWorld, and nothing here launches the game
on Windows. `Rimworld-Ticket-Dispatcher/docs/WELCOME.md` is the protocol: a session registers once, deposits
a request and keeps nothing running, and the dispatcher wakes it by message.

The arguments below are the ones each request carries. Deposit each with
`Rimworld-Ticket-Dispatcher/scripts/Submit-PickleRun.ps1 -Mod AncientBuildingsRenew -Owner local_<session id> -Label "<what is tested>"`
and the `-Language`, `-DepMap`, `-Filter` and `-EvidenceDir` shown. **Which kind of ticket it is decides its
filter.** An exploration or a fix plays as little as possible, `-Filter '::<scenario name>'`. A first or a final
validation plays every scenario of its pass. The exclusion terms in the filters below are not a subset
chosen to save time: they keep out the scenarios that make no sense in that pass, such as the one that
asserts Biotech is absent from the passes that keep it.

```text
# minimal, English
-Language English -Filter 'Ancient Buildings Renew - Pickle tests,!@fr-only,!@without-biotech' -EvidenceDir AncientBuildingsRenew/Tests/Pickle/evidence/minimal-en

# minimal, French: no map to load, so no @save
-Language French -Filter 'Ancient Buildings Renew - Pickle tests,!@en-only,!@without-biotech,!@save' -EvidenceDir AncientBuildingsRenew/Tests/Pickle/evidence/minimal-fr

# Biotech left out
-DepMap wsl-deps.sans-biotech.map -Language English -Filter 'Ancient Buildings Renew - Pickle tests,!@fr-only,!@save' -EvidenceDir AncientBuildingsRenew/Tests/Pickle/evidence/sans-biotech

# the original mod beside it (its Workshop item is in the WSL cache since 2026-09-24)
-DepMap wsl-deps.incompat-original.map -Language English -Filter '05-original-mod-incompatibility' -EvidenceDir AncientBuildingsRenew/Tests/Pickle/evidence/incompat-original
```

| Pass | Scenarios it should play | Skipped by requirement |
|---|---|---|
| minimal, English | 21: `01` x4, `02`, `03`, `06` x2, `08` x2, `09` x3, `10` x2, `11` x3, `12` x3 | `05` (1) |
| minimal, French | 12: `01` x4, `07` x2, `12` x3, and the three that need no map: `09` comps, `11` stove, `11` AC defs | `05` (1) |
| sans-biotech | 14: `01` x4, `04` x2, `06` x2, `09` comps, `11` stove and AC defs, `12` x3 | `05` (1) |
| incompat-original | 1: `05` | none |

Compare those numbers with what a report says it discovered and played, and read `exitReason` before the
counts. A skipped scenario is not a passed one: `03` is skipped in the pass without Biotech, `05` in every
pass but its own, and each has to have run in the pass that gives it its condition.

Why the passes are these and not others. The mod declares no dependency and no `loadAfter`, so there is
no optional-mod pass to run. Biotech is the only DLC it touches, so it is the only one left out. The
`test-colony` fixture was written with every DLC active, which is why the pass without Biotech plays no map.
`../../TESTING.md` still describes the Core-alone run, which is not automated.

A session does not watch the queue: no `Monitor`, no heartbeat, no cron, no loop. The dispatcher wakes it
at `START`, at `END` (the lock returned, which is not the verdict) and, for a deposited request, with
`RUN_DONE`. A ticket launched directly from a session belongs to that session and can be lost with it.

## Before queuing

```powershell
dotnet build Tests/Pickle/Source/AncientBuildingsRenew.PickleSteps.csproj -c Release
powershell -NoProfile -ExecutionPolicy Bypass -File Tests/Pickle/Check-Steps.ps1
```

The build writes the step DLL into `Mod/Pickle/Assemblies/`, which git ignores: rebuild before every run,
because Pickle loads step DLLs when the game starts. `Check-Steps.ps1` matches every step line against
Pickle's own vocabulary read from the installed assemblies and against this suite's two steps, and fails on
an undefined or ambiguous one before a ticket is taken. It is static: it proves the text of a step exists,
not that the step does what the scenario hopes. Checked on 2026-09-26: 25 local patterns, 149 step lines, all resolved. A
deliberately wrong line was reported as undefined, so the check does bite.

## Not verified

- **Read the run history before trusting a value here**: `../../docs/runs/`. Four passes, fix tickets and features 08 to 11 have played (2026-09-24 to 26); the incompatibility scenario was rewritten after its first run.
- Confirmed by the first passes (2026-09-24): the fence prints `Defenses`, and the four cells on `test-colony` are free (the placement scenario passed).
- The first incompatibility run showed the game logs no duplicate for the shared defNames; scenario 05 now asserts the original's own
  `placingDraggableDimensions` error instead.
- `ancientbld.core` was downloaded into the WSL install's Workshop cache on 2026-09-24 (item 2566355159, 732 KB).
- `../../../PickleTools/Headless/README.md` lists a step, `an error matching ... was logged`, that the
  installed Pickle build does not have: 201 steps were read out of it by reflection and it is not among
  them. This suite does not depend on it.
