# Protocols read, and in which version

A record for this mod's session, so that a document is not read again unless it moved. Written
2026-09-25 after a full pass (the request of the owner, and step 5 of `WELCOME.md`). The rule for using it:
**compare the version below with `git log -1` of the file; re-read only when it differs**, and only the
"Re-read when" part unless the file is short.

Where the versions come from:

- The protocol documents (`AGENTS.md`, `AUDIT.md`, `PUBLISHING.md`, `TRANSLATIONS.md`, `STYLE_RIMWORLD.md`,
  `scripts/SEARCHING.md`) left the monorepo on 2026-09-25 (monorepo commit `90d51374`). Their history is in
  the protocols repository: `git --git-dir=../rimworld-protocols.git --work-tree=../rimworld log -1 -- <file>`
  from `Documents`. None was modified and uncommitted (`git status --short` empty for all six).
- The tool repositories (`PickleTools`, `Rimworld-Release-Admin`, `Rimworld-Ticket-Dispatcher`) are repositories
  of their own: `git -C <folder> log -1`.
- This repository's own files: the commit that last touched them.

## What was read

| Document | Version read | Useful? | What matters for this mod | Re-read when |
|---|---|---|---|---|
| `AGENTS.md` | `3a1d2cb` 2026-09-24 | yes | the ordered gates, the evidence rules (one text line per run in `docs/runs/`, never a folder), CI-only publishing | its hash moves; it is 46 lines |
| `AUDIT.md` | `49cd841` 2026-09-25 | **essential** | the chain and every gate; the absolute rules on RimWorld; Pickle rules (passes, incompatibility passes that **assert**, `@requires`, `exitReason` first, evidence copies); the fail-fast policy of 2026-09-25 for the `1.0.0`; `tested` needs no `@wip`, every conditional scenario played, no manual test left; the session title | its hash moves. It is long: read the Pickle bullets, steps 9 to 11 and "fail fast" |
| `PUBLISHING.md` | `0743ff9` 2026-09-25 | yes, from `prepublished` on | description order and the ` (unofficial)` opening; the gallery folder numbered `01-`, `02-`; the AI and THANKS lines (Pickle and RimLogging are named as development-only); thanks comments and the registry `WORKSHOP_COMMENTS.md`; the Steam change note **starts with the version number**; topics and social preview; `PUBLICATION.md` | its hash moves, or before writing `PUBLICATION.md` or a change note |
| `TRANSLATIONS.md` | `b83933b` 2026-09-23 | little now | the gate is passed (`localization`, `translation_en`, `translation_fr` complete). The runtime display check is covered by Pickle `06` and `07` | a player-facing text, a Def or a language file changes |
| `STYLE_RIMWORLD.md` | `7311308` 2026-09-25 | **no** | image generation and the preview lettering: sessions generate no image and this mod's images are done. Only "ModIcon: control, not generation" and the file limits (Preview under 1 MB, icon 128 px) apply, and they are checked | `Preview.png` or `ModIcon.png` is touched |
| `scripts/SEARCHING.md` | `372c447` 2026-09-23 | **no** | corpus search. The defName collision sweep (10 360 mods) is done and recorded | a defName or a class is added |
| `PickleTools/README.md` | `d6d8db1` 2026-09-25 | some | the table of shared step tools. This suite stages none of them (no `path:PickleTools/...` line in its maps) | a step is needed that Pickle lacks |
| `PickleTools/Headless/README.md` | `d6d8db1` 2026-09-25 | yes, in part | the filter terms, one mod several passes, `-DepMap`, `-EvidenceDir`, the exit codes | the launcher or the filters change. Read only "Choosing what to run", "One mod, several passes", "A pass without a DLC" |
| `PickleTools/docs/steps.md` | `d6d8db1` 2026-09-25 | **no** | the steps of the PickleTools companions only; Pickle's own steps are elsewhere. Nothing here is used | a PickleTools step is considered |
| `Rimworld-Release-Admin/docs/OPERATIONS.md` | `d403592` 2026-09-25 | from `prepublished` on | `generate-publish-workflow.sh` with `--description-markdown Mod/README.template.md`; the dry-run cannot read a private item's page; the gallery stays manual; `documented` mode of the semantic-release path | before any workflow, tag, release or dry-run. Skip the credentials and queue sections |
| `Rimworld-Ticket-Dispatcher/docs/WELCOME.md` | `7af1f5a` 2026-09-25 | **essential** | one small ticket per fix, a full pass per validation; `-Filter` terms; `-DepMap`; deposit, never launch; never watch; a request carries no SHA, so **write the SHA in `-Label`**; clean evidence; re-read the docs and note the versions | its hash moves |
| `Rimworld-Ticket-Dispatcher/docs/SUBMIT.md` | `7af1f5a` 2026-09-25 | some | every option of `Submit-PickleRun.ps1`, the launcher exit codes, `-Extra` flags | an option beyond `-Filter`, `-Language`, `-DepMap`, `-EvidenceDir` is needed |
| `STATUS.md` | `feff89f`, then this commit | mine | the source of truth for the stage and the remaining work | every stage change |
| `README.md` | `d314759` | mine | | a def or a public claim changes |
| `CHANGELOG.md` | `b0b70a0` | mine | `[1.0.0]` unreleased above `[0.1.0]` | before a publication |
| `ATTRIBUTION.md` | `58785f6` | mine | | a source is added |
| `LICENSE` | `f6acfa2` | mine | | never expected |
| `TESTING.md` | `784a306` | mine | the manual run and the capture table | a scenario changes |
| `docs/runs/` | this commit | mine | the run lines of 2026-09-24 and 25 | after each run |
| `Tests/Pickle/` | this commit | mine | the suite and its README | a scenario or a pass changes |
| `Mod/About/About.xml` | `f040b46` (`Mod/` as a whole: `85165f2`) | mine | the frozen Steam description is this text; see the gaps below | a description change |

Documents named by the owner that **do not exist in this repository**: `PUBLICATION.md`, `BACKLOG.md`,
`NOTES.md`, `BUGS.md`. Not created to fill a list. `PUBLICATION.md` is required by `prepublished` and is
still to be written; the other three have no content to hold. The monorepo's `BACKLOG.md` was not read, as
asked. `WORKSHOP_COMMENTS.md` (the global registry of thanks comments) exists at the collection root and was
not read: it is read when `PUBLICATION.md` is written.

## What this pass found

Gaps in this repository, kept out of the fix list of this commit except the first:

1. **`Tests/Pickle/README.md` said "none has been run"** after four passes had played. Fixed in this commit.
2. **The Steam description credits no test tool.** `PUBLISHING.md` asks the thanks to name the test tools
   really used, Pickle notably, as development-only and never a dependency. This mod now has a Pickle suite,
   and neither `About.xml` nor `Mod/README.template.md` names Pickle. The frozen page cannot be edited from
   `About.xml`, but the template and the source should agree before the `1.0.0`. A thanks comment for
   Pickle's Workshop page belongs in `PUBLICATION.md` too, to be checked against `WORKSHOP_COMMENTS.md`.
3. **The `defect` "no workflow sends the template" has a route now.** `generate-publish-workflow.sh ... --description-markdown
   Mod/README.template.md` (`OPERATIONS.md`) writes a manual publish workflow that sends the converted
   description. It was not run, and it writes into `.github/`, so it waits for the owner's word.
   `PUBLICATION.md` also has to carry the `### <version>` change-note block for that path, and the note must
   begin with the version number.
4. **`-Label` carried no SHA** on most of this session's requests. `WELCOME.md` asks for it, since the tree
   is staged when the ticket plays. `Mod/` did not change between the first deposit (2026-09-24 16:46) and the
   last play (last commit touching it: `85165f2`, 10:05 that day), so no verdict depends on it. The Pickle
   companion and the suite did change twice (`d7e3bf9` at 22:47, `398fd63` at 00:01) and each run line says
   which side of that change its pass fell on. The next requests carry the SHA.
5. **A step the owner's documents name does not exist in the installed Pickle.** `AUDIT.md` (the incompatibility
   paragraph) and `Headless/README.md` list `an error matching {string} was logged`. 201 steps were read from
   the installed build by reflection and it is not among them, which is why this suite has two steps of its own
   (`Tests/Pickle/Source/LoggedMessageSteps.cs`). Either a newer Pickle has it or the documents are ahead of
   it; not settled here.
6. **The migration sentence is untested.** The README, `ATTRIBUTION.md` and the frozen description say a save moves
   between the two mods because the defNames match. `TESTING.md` records it as opportunistic and not a gate;
   the sentence is a consequence of keeping the names, not a result.

Checked and fine: the repository is public, has the three topics (`rimworld`, `rimworld-mod`, `mod`) and a
custom social preview image.

## What the requests to come must follow

- One small ticket per fix: `-Filter '::<scenario>'`. A full pass only for an initial or a final validation.
- No watcher, no Monitor, no heartbeat, no cron, no loop. `RUN_DONE` wakes the session; `exitReason` first.
- The tree is staged when the ticket plays: no change to the mod between deposit and `RUN_DONE`, and the
  SHA in `-Label`.
- Keep the four text files of a report, delete the rest, add one line to `docs/runs/`, and read the run's
  language and pass name from the launcher's log when the game's own log does not state them.
