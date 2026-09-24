# Runs

One text file per day of testing, written by hand from what was seen. It is the only record of a
run that lives in git.

This mod has never been run in the game, so this folder holds nothing else yet. The first line of
history goes here the day `TESTING.md` is executed.

The evidence itself - `Player.log`, screenshots, films - stays **on disk**, under
`Tests/Manual/evidence/<date>/<check>/`, and is ignored by git. `<check>` is `fence`, `barrier`,
`lamppost`, `vending`, `stove`, `air-conditioner`, `l10n` or `migration`, the sections of
`TESTING.md`. It is not backed up: if the machine is lost, the summaries here and the history are
what remains.

A summary must carry, since the media are not beside it:

- the game version and DLCs, the mod list, and the revision of this repository that was tested
- for each scenario of `TESTING.md`, pass or fail, and for a failure the cause as read from the
  log, not the assumed one
- what a person actually opened and saw in each capture, and what it did not show
- where the media are on disk, so the next reader can find them

A summary without those is a claim, not a record. One text line per run is enough for the history;
never a folder per run.

## What to keep, and how

The disk is shared by every mod, and evidence of a superseded build proves nothing about the
current one. So a run's evidence is cut down as soon as a newer one replaces it.

**Keep, for the revision now in the repository, one proof per check:**

| Check | The one proof to keep |
|---|---|
| The fence drags out as a line | one capture of the finished run of blueprints. The summary says how many gestures laid it: one press-and-drag, N blueprints. A still cannot show the drag, so a film only if a reader could not tell a dragged run from N single clicks |
| The barrier drags the same way | the same, on the barrier |
| Lamppost lights with no power, refuses a roof | one capture lit at night with no conduit in frame, one of the placement refusal |
| Vending machine: link gizmo, blueprint filter | one capture of the gizmo, one of the filter set on the blueprint |
| Stove: baby-food bills | one capture of the bill list **with** Biotech, one **without**. Both, or the conditional scenario has not run |
| Air conditioner: cools across a wall | one capture of the two room temperatures, one of the unit built in the open doing nothing |
| English and French | one capture per building of its label and description in each language: twelve in all, not one per action |
| Existing-save migration, **only if it is ever run** (opportunistic, not a gate) | the mod list and counts before and after as text, the load log, and one capture of the reloaded colony |
| Every pass | its `Player.log`, as text |
| Every Pickle pass | the four text files of its report (`summary.json`, `summary.md`, `junit.xml`, `Player.log`), copied by the launcher's `-EvidenceDir` under `Tests/Pickle/evidence/<pass>/`, with `exitReason` and the played and discovered counts read before anything else. The launcher's `report.html` and `messages.ndjson` are deleted: they are large and add nothing the four files do not carry. No Pickle scenario here is `@review`, so no capture is owed |

**Keep an older report only** when it is the sole proof of a check the latest run did not repeat.

**Delete** anything about a revision the latest run replaced, failed attempts once their cause is
written in the day's summary, and a second capture of a state that one capture already shows.

**Minify what stays.** Review a capture at full size **before** converting it, then keep it as JPEG:

```bash
ffmpeg -i capture.png -q:v 3 capture.jpg && rm capture.png
```

About 250 KB instead of 3 MB, and small text stays legible at native size. A capture is evidence of
what was seen, not of pixels, so lossy is fine here. It is not fine for anything that will be
measured or diffed later.

**Before deleting a report, check that no `STATUS.md` field points at it**, repoint the field
first, and list what goes and what stays. Then add its line to the day's summary in this folder.

## Git

`Tests/Manual/evidence/`, `Tests/Pickle/evidence/` and any `evidence/` are ignored, and so is
`*.dds`. Nothing under them is ever tracked. If a capture is needed in a commit, write what it shows
in the summary instead.
