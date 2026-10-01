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
| `AUDIT.md` | `49cd841`, then the diff to `448991f` (2026-09-25) | **essential** | the chain and every gate; the absolute rules on RimWorld; Pickle rules (passes, incompatibility passes that **assert**, `@requires`, `exitReason` first, evidence copies); the fail-fast policy of 2026-09-25 for the `1.0.0`; `tested` needs no `@wip`, every conditional scenario played, no manual test left; the session title | its hash moves. It is long: read the Pickle bullets, steps 9 to 11 and "fail fast" |
| `PUBLISHING.md` | `0743ff9`, then the diff to `16f3c59` (2026-09-25) | yes, from `prepublished` on | description order and the ` (unofficial)` opening; the gallery folder numbered `01-`, `02-`; the AI and THANKS lines (Pickle and RimLogging are named as development-only); thanks comments and the registry `WORKSHOP_COMMENTS.md`; the Steam change note **starts with the version number**; topics and social preview; `PUBLICATION.md` | its hash moves, or before writing `PUBLICATION.md` or a change note |
| `TRANSLATIONS.md` | `b83933b`, then the diff to `f5c2d9d` (2026-09-25) | little now | the gate is passed (`localization`, `translation_en`, `translation_fr` complete). The runtime display check is covered by Pickle `06` and `07` | a player-facing text, a Def or a language file changes |
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
2. **The Steam description names no test tool.** `PUBLISHING.md` asks the thanks to name the test tools really used,
   Pickle notably. Neither `About.xml` nor `Mod/README.template.md` does. The owner answered on 2026-09-25 that the
   thanks to Pickle has already been placed, so nothing is to be added here; recorded as her statement, not
   as something found in these files.
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

## What moved after the first reading (2026-09-25)

- `AUDIT.md` `448991f`: for any upload done by the CI (an update, or a `1.0.0` on an item a `0.1.0` prepublication created) the tag and the GitHub release follow the upload, and the description can be corrected by the CI (`update_description`), never from `About.xml`. Consistent with this repository.
- `PUBLISHING.md` `16f3c59`: **one source for the Steam description**, decided by the owner today. It is written once, in Markdown, in a fenced block under `## Steam description` of `PUBLICATION.md`; the CI converts it to BBCode and generates the plain `<description>` of `About.xml` from it, and every dry-run stops if they differ. Not adopted here yet: this repository uses `Mod/README.template.md` as a whole-file source, which keeps working. Adopting it changes the SHA, so it waits for the next publication or the owner's word. A change note may also start with `[h3]1.0.0[/h3]`.
- `TRANSLATIONS.md` `f5c2d9d`: rules for counts and plurals in Keyed text. This mod has no Keyed text and no counted phrase, so nothing applies.

## What the requests to come must follow

- One small ticket per fix: `-Filter '::<scenario>'`. A full pass only for an initial or a final validation.
- No watcher, no Monitor, no heartbeat, no cron, no loop. `RUN_DONE` wakes the session; `exitReason` first.
- The tree is staged when the ticket plays: no change to the mod between deposit and `RUN_DONE`, and the
  SHA in `-Label`.
- Keep the four text files of a report, delete the rest, add one line to `docs/runs/`, and read the run's
  language and pass name from the launcher's log when the game's own log does not state them.

## 2026-10-01 (audit against `AUDIT.md` 7fd7475)

Versions from the protocols repository (`git --git-dir=../rimworld-protocols.git --work-tree=../rimworld log -1 -- <file>`, from `Documents`). Re-read only when the hash differs.

| Document | Version now | Read how | Useful? | What changed for this mod |
|---|---|---|---|---|
| `AGENTS.md` | `7fd7475` 2026-09-29 | whole | yes | evidence rule compressed, same content; after publication trim `docs/runs/history.md` to what proves the published state (this mod has no `history.md`, runs are daily files) |
| `AUDIT.md` | `7fd7475` 2026-09-29 | whole | **essential** | `workflow_stage` and the session title rule; cleanup steps for `published`; `tested` criteria (no `@wip`, every `@requires` played, no manual test); absolute rules on RimWorld launching (deposit with `Submit-PickleRun.ps1`, never launch) |
| `PUBLISHING.md` | `e0411cc` 2026-09-29 | diff from `16f3c59` | yes from `prepublished` | gallery numbered `0-`, `1-`… with `0-` a copy of the Preview; Preview carries the ModIcon corner badge; PR to the original repo when one exists (none here); thank comments in the owner's voice, hidden link; semantic-release retired, versions and pre-releases of the manual workflow |
| `TRANSLATIONS.md` | `ebadb99` 2026-09-30 (working tree of the protocols repo holds an uncommitted edit) | diff from `f5c2d9d` | yes | French gender switch (no text here addresses a pawn); French review by Virginie, `FRENCH_REVIEW.md` at the root generated by script; every French mod reset to `unchecked` |
| `MOD_SETTINGS.md` | `b83933b` 2026-09-23 | not re-read, unchanged since the first reading | little | `settings_audit: not_applicable` stands |
| `STYLE_RIMWORLD.md` | `ef7e7a9` 2026-09-29 (uncommitted edit in the working tree) | not read | **no** | image generation; sessions generate none. Re-read only if `Preview.png` or `ModIcon.png` is touched |
| `WORKSHOP_COMMENTS.md` | `7fd7475` 2026-09-29 | not read | **no** | read when the thank comment for 2566355159 is written |
| `scripts/SEARCHING.md` | `50de695` 2026-09-28 | not read | **no** | corpus search, defName sweep done |
| `PickleTools/README.md`, `Headless/README.md`, `docs/steps.md` | PickleTools `b7620cb` 2026-09-29 | commit list only | no | new steps (coats, gizmo-by-key, DefFields, volume) not used by this suite; Headless: `-ThenWithout`, exit 139 (Mono GC segfault at start, not a mod fault) |
| `Rimworld-Release-Admin/docs/OPERATIONS.md` | `b70348b` 2026-09-28 | commit list and diff head | from `prepublished` | rewritten shorter; `dispatch-publish.sh` refuses a workflow file changed since the dry-run; change note starts with `[b]1.0.0[/b]` or `[h1]`-`[h3]`; manual workflow accepts pre-releases |
| `Rimworld-Ticket-Dispatcher/docs/WELCOME.md`, `SUBMIT.md` | `623b15b` 2026-09-30 | not re-read | needed before the next deposit | re-read at that point; `-Label` must carry the SHA |
| `./STATUS.md`, `CHANGELOG.md`, `TESTING.md`, `PUBLICATION.md`, `ATTRIBUTION.md`, `README.md`, `LICENSE`, `Mod/About/About.xml`, `docs/runs/`, `Tests/Pickle/` | this repository | `STATUS.md`, `CHANGELOG.md`, `docs/runs/` read; the rest by grep | mine | `Mod/About/About.xml` checked for packageId and `incompatibleWith` only |

`BACKLOG.md`, `NOTES.md`, `BUGS.md` do not exist in this repository and are not created without content (no pull request is due: the original has no git repository).

## 2026-10-01, later: protocols moved again

- `PUBLISHING.md` `02394c0` (2026-10-01): the animal-mod integrations go from three to four (Dogs mate). **Not applicable**: this mod adds no animal.
- `STYLE_RIMWORLD.md` / `TRANSLATIONS.md` `c105a43` (2026-10-01, pending edits: preview title font and summary width, echo line-art, translation rules). Not read in full: the Preview is made by the art commits, not by this session; the translation rules were not diffed, the French was validated by the owner on `beeb97a`.
- Preview changed by art commits (`4298a20`…`7c6c60d`): now `Mod/About/Preview.png` 896 x 504, 653 490 bytes (under 1 MB), byte-identical to `Art/Gallery/0-preview.png`. Opened: title, "Renew (unofficial)", 1.6 badge, ModIcon in the right corner. No defect seen.
