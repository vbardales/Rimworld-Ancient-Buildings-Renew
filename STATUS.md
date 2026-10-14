---
localization: complete
translation_en: complete
translation_fr: complete
settings_audit: not_applicable
mod:          Ancient Buildings Renew (unofficial)
packageId:    nelim.ancientbuildings
repo:         Rimworld-Ancient-Buildings-Renew
visibility:   public
detached:     yes
workflow_stage: playTests[1.1.0]
tested_1_7:   yes
licence:      silent
licence_at:   Audit/2026-09-13-rights/README.md
upstream_mod_remotes: N/A
dependencies: none
showcase:     complete
tested_on:    "2026-10-11 regression on 6f2b69a: tickets 8c0c (minimal-en-2), c967 (minimal-fr-2), ec53 (sans-biotech-2), f818 (incompat-original-2), all green; see docs/runs/2026-10-11.txt (earlier: 2026-10-08/09 on the 1.0.1 tree, docs/runs/2026-10-10.txt)"
pickle_scenarios: "28 scenarios in 14 features, every one has a green run (2026-09-24 to 28); 1.0.1 regression green (docs/runs/2026-10-10.txt)"
workshop:     "3806708945 (1.0.0 and 1.0.1 published by the CI, tags v1.0.0 and v1.0.1; the owner set the item public on 2026-10-08, her word in chat; this session cannot read the page)"
evidence:     "Pickle reports on disk, Tests/Pickle/evidence/<pass>/ (ignored by git). What to keep: docs/runs/README.md. Rights evidence: Audit/2026-09-13-rights/"
code_review_sha: bf7bca0096b858b07eea137e6ec698b27c6c5ca6
social_preview_sha256: 0ccf1b8222e9859c85a8c4af59b86f9d7743aa6074156bc9e491fee9d79954e6
echo_review_sha: fba2ab1a74f6ebc2e97697b4890b51282aec4bfc
publication_changelog_review_sha: a2f649a80f608af66bb5ea6fb174bac0f263bd93
remaining:
- unverified: "Known: the echo line art overlaps the subtitle 'Renew (unofficial)' on the Preview, accepted by the owner 2026-10-12."
  - unverified: "Steam page, item visibility and the new packageId on Steam are not readable by this session; the owner reported them done on 2026-10-08."
  - decided: "existing-save migration: dropped, owner decision 2026-10-11 (chat): backward compatibility with saves of the original ancientbld.core is not guaranteed and not tested. TESTING.md protocol kept for reference only. Open: Mod/About/About.xml line 50 still says a save moves between the two mods; corrected in the 1.1.0 changes (description, commit cd2ec4f, 2026-10-14)."
- open: "Workshop header image (og:image of the item) is still the Preview of before 2026-10-12: it goes with the 1.1.0 publish with --preview, now carrying the 1.7 badge (Mod/About/Preview.png sha256 0ccf1b82...954e6, commit 3ba3563, badge shifted 12.5% toward the corner; GitHub social preview uploaded and verified 2026-10-14; gallery slot 0 on the Steam page still shows the 2026-10-12 Preview and must be replaced by hand or by this session with the same file). 1.1.0 (1.7 declared, tested_1_7: yes since 2026-10-14) waits for: the owner's review of PUBLICATION.md and CHANGELOG.md for the 1.1.x line, code_review_sha, the dry-run date commit, then the CI publish."
- deferred: "No 1.0.2 now (owner decision 2026-10-11: not enough functional change to justify a release). The save-sentence fix (About.xml line 50, README.template.md line 38, README.md line 139, CHANGELOG.md line 94; text in PUBLICATION.md) and the CI template regeneration ride with the next functional version. CI template stale (CI/CD session, 2026-10-11): stamp 82de20b8aa50, current 7fb8f006c206 (Release-Admin 40f56f2, adds build-check.sh --ci and build.yml). Before the next dry-run (1.0.2): generate-publish-workflow.sh ../AncientBuildingsRenew --replace with the arguments of .github/publish.config.json. Never edit a copy by hand. .github/scripts, tests, workflows are copies of the Release-Admin template, none local."
  - validated: "ModIcon.png 32 px readability: validated by the owner in chat on 2026-10-11 (128 px icon opened by this session, winking mascot and column read well). Art/ModIcon-signature-candidate.png stays an untracked candidate, not this session's."
updated:      2026-10-11, non-reg tickets queued on 6f2b69a (minimal-en, minimal-fr, sans-biotech, incompat-original; ancientbld.core re-downloaded to the WSL cache), protocols re-read; before that 2026-10-10, dormant at the owner's word, cleanup of STATUS, TESTING, PUBLICATION, PROTOCOLS-READ and evidence done (WSL cleanup done)
session:      local_810f6b45-91d6-4f3f-b930-e68dc60d9da4
protocols_read_sha: 65e09838c8023b798d4ba0ff04df04284a96f11e
---

# Ancient Buildings Renew: status

**State: `dormant` (from `followUp[1.0.1]`, owner's order 2026-10-10).** 1.0.0 (CI run 37831089676, tag `v1.0.0`) and 1.0.1 (CI run 37836720872, SHA `1cd35ff94791f61330a0827d9694fb5f852943bd`, tag `v1.0.1`) are published by the CI on Workshop item 3806708945. 1.0.1 only renames the `packageId` to `nelim.ancientbuildings`. A new fix or a new RimWorld version reopens the chain at `code[x.y.z]`.

## Gates (audit of 2026-10-10, revision `2611536`)

| Gate | Result |
|---|---|
| Offline checks on `Mod/` | Re-run 2026-10-10, all clean: `Check-XmlFields` (3 files), `Check-DefRefs` (6 defs), `Check-XmlClasses` (19 types), `Check-TypeRefs` (no third-party reference), `Check-DefInjected` (12 keys, 0 errors), `Check-ConfigErrors` (6 of 6, 26 rules). No C# source, no assembly. |
| Dependencies | None. `incompatibleWith ancientbld.core` (the original). `MayRequire` Biotech on the two baby-food recipes. No `loadAfter`, no `LoadFolders`, no patch. |
| Settings | `not_applicable`: no assembly, no `ModSettings`, no `MainButtonDef`, so no empty page and no shortcut. |
| Translations | EN from the Defs, FR in `Mod/Languages/French` (12 of 12), reviewed by Virginie 2026-10-01, confirmed 2026-10-08. See `Translation audit` below. |
| Pickle | 28 scenarios in 14 features, all green once; 1.0.1 regression green (below). |
| Code review | `code_review_sha` = `0cec113` (re-set 2026-10-10 after the icon change: the only `Mod/` files changed since `2611536` are the regenerated `ModIcon.png` and `Preview.png`, both opened and read, no code). Since the previous review (`1159c8a`, 2026-10-08) the only change in `Mod/` is the `packageId` line of `Mod/About/About.xml` (commit `818be66`); the Pickle features and `About.xml` of the test mod moved to the new id in the same commit. No other use of the old id remains outside the CHANGELOG, the PUBLICATION change note and history. |
| Docs | `CHANGELOG.md` `[1.0.1]` dated 2026-10-08 (it still said `unreleased`). Description in `Mod/About/About.xml` opens with UNOFFICIAL, ends with `Source code on GitHub`, no em dash. `PUBLICATION.md` has the 1.0.0 and 1.0.1 change notes. |
| Licence | `silent`, evidence in `Audit/2026-09-13-rights/`. Original repository: none found (2026-10-01; GitLab and Codeberg not searched). |

## 1.0.1 regression (AUDIT.md 14.a)

Tickets 6598, ca1c and a8bb (deposited 2026-10-08 after the rename commit, all exit 0, summaries read 2026-10-10):

- 6598, pass minimal, EN: 32 scenarios, 24 passed, 0 failed, 8 skipped (`@requires` scenarios of other passes).
- ca1c, pass sans-biotech: 23 scenarios, 15 passed, 0 failed, 8 skipped.
- a8bb, pass incompat-original: 1 scenario, passed (the original still carries the removed field).

Not replayed: the French pass (no text changed in 1.0.1) and the gallery pass (gallery unchanged).

## Published versions

| Version | Date | What | Tag |
|---|---|---|---|
| 0.1.0 | 2026-09-23 | prepublication, creates the private item | none |
| 1.0.0 | 2026-10-08 | first release | `v1.0.0` |
| 1.0.1 | 2026-10-08 | `packageId` `nelim.ancientbuildingsrenew` to `nelim.ancientbuildings` | `v1.0.1` |

Rollback target: private visibility (the owner used it once on 2026-10-08, between 1.0.0 and 1.0.1; public again after 1.0.1).

## Gallery

`Art/Gallery/0` to `7`, contiguous, `0-preview.png` byte-identical to `Mod/About/Preview.png` (653 490 bytes), uploaded by hand by the owner on 2026-10-08. Order: 0 preview, 1 the six buildings together at dusk, 2 the lamppost at night, 3 the air conditioner in a wall, 4 the vending machine and the stove, 5 the road comes in, 6 the barrier and the fence up close, 7 the vending machine up close. Mature content boxes: none.

## Reviews

- PUBLICATION.md and CHANGELOG.md (1.0 line): confirmed by Virginie in chat on 2026-10-10, commit `8d24895fc4776d9e6ffcf79138824958d9fa82f7` (`publication_changelog_review_sha`).
- PUBLICATION.md and CHANGELOG.md (1.1.x line, 1.7 declaration and the 1.1.0 Steam notes): validated by Virginie in chat on 2026-10-14, commit `a2f649a80f608af66bb5ea6fb174bac0f263bd93` (`publication_changelog_review_sha`).
- Code review (AUDIT.md 8.m exception, 2026-10-14): `git diff 9a71538 HEAD -- Mod` read; it holds only the description text and `supportedVersions` of `About.xml`, the regenerated `Preview.png` and the `README.template.md` wording. Revue du diff : images et texte seuls. `code_review_sha` set to HEAD, no new playTests pass (the 1.7 passes already ran on the same defs).

- GitHub social preview (first upload 2026-10-10 with the previous Preview, 54b60b2f..., replaced the same day by the regenerated Preview, see remaining): upload confirmed by Virginie in chat on 2026-10-10; the repository page `og:image` (repository-images.githubusercontent.com/1365538522/70896796-...) downloaded by the session is byte-identical to `Mod/About/Preview.png`, sha256 `54b60b2f0c81b0ce6f9ab619f86e3e107cc5de76779970e7a9db0b976917575f` (`social_preview_sha256`).

- Echo (AUDIT.md 10.a): decision keep `Art/echo.png`, by Virginie in chat on 2026-10-10, with the regenerated Preview and the eight gallery images in hand (the line-art vending machine and lamppost match the gallery subjects). Commit `6a3d71d8f3f228c2789c3faef4e151fe10320074` (`echo_review_sha`).
- Echo, 2026-10-12: Preview regenerated with Art/echo-source.png (the line art derived from the gallery images, STYLE_RIMWORLD.md), accepted by Virginie in chat on 2026-10-12 after seeing the render, overlap with the subtitle included (her word: "c'est ok"). Code review re-set the same day: the only Mod/ file changed since 0cec113 is Mod/About/Preview.png, an image, no code. Both SHAs = the commit this change sits on (`echo_review_sha`, `code_review_sha`).

- WSL cleanup (AUDIT.md 14.c), 2026-10-10: under the machine lock (Use-Wsl.ps1, exit 0) removed `~/workshop-cache/steamapps/workshop/content/294100/2566355159` (ancientbld.core, 732K), named only by this mod's `wsl-deps.incompat-original.map`. Kept: the other 23 items of the cache (Sanctuary and Facial Animation set, named by 38 other maps). Verified gone.

## 1.1.0 chain confirmation (2026-10-13)

The 1.1.0 line reopens the chain at `code[1.1.0]` (AUDIT.md 15). The version changes only `supportedVersions` (`<li>1.7</li>`, after a green 1.7 run), so each state below is confirmed, not redone. Checks rerun 2026-10-13 on `Mod/` at `f926e8b` (`Mod/` unchanged since `0e5b766`, an image): all clean, no code touched.

- `code`: no C# source, no assembly; nothing built. `Check-XmlFields` (3 files, no unknown field), `Check-DefRefs` (6 defs, no missing reference), `Check-XmlClasses` (19 types resolved), `Check-TypeRefs` (no third-party type), `Check-ConfigErrors` (6 of 6, 26 rules, no config error). `CHANGELOG.md` gets its `[Unreleased]` section when 1.7 turns green.
- `declareDependencies`: unchanged (none; `incompatibleWith ancientbld.core`; `MayRequire` Biotech on two recipes). Not rechecked on 1.7 yet: it is what the 1.7 run decides.
- `settings`: `not_applicable` stands (no assembly, no `ModSettings`, no `MainButtonDef`).
- `localize`: `Check-Translations` PASS (12 source texts, French injections) and `Check-DefInjected` 12 keys, 0 errors. `translation_fr: complete` stands (Virginie 2026-10-01 and 2026-10-08); no text changed.
- `writeTests`: `Check-Steps` 15 feature files, 36 scenario blocks, 29 patterns compile, every step line resolves. The suite and its 1.7 maps (`Tests/Pickle/wsl-deps.minimal-17.map`, `wsl-deps.sans-biotech-17.map`) are written; `15-gallery` is not part of the 1.7 pass.
- Open, not a defect: `Check-ModBasics` flags `ATTRIBUTION.md` and `LICENSE` as different between root and `Mod/` (same content in git, line endings differ in the working tree after the 2026-10-13 restore); not rechecked on a clean checkout.
- `playTests[1.1.0]` is the 1.7 diagnostic: `f7fa` inconclusive (mod steps not built net10.0), `5079` (EN) 21 of 24 passed, 3 failures on the test side (5 s step timeouts, the suite mod's own "did not load any content" error); `a787` (FR) and `9ec4` (no Biotech) queued. See `docs/runs/2026-10-13.txt`.
- Rules read 2026-10-13 that touch the 1.1.0 commit (AGENTS.md, AUDIT.md, STYLE_RIMWORLD.md): (a) adding `<li>1.7</li>` makes the Preview badge stale: the Preview chain (`Render-Preview.cjs` reads the highest declared version, then the `0-` gallery copy, `Preview.ico`, and the GitHub social preview upload with a new `social_preview_sha256`) is redone in the same commit as the version change; `--version=1.7` may prepare it earlier but is never shipped before a green 1.7 run; (b) the `About.xml` description and the Steam description name no RimWorld version (`Check-Status` WARN `rimworld-version`, open now: "bring them forward to 1.6" in `Mod/About/About.xml` and `PUBLICATION.md`), fixed in the same `Mod/` change as the save-sentence fix.
- Full protocol read 2026-10-13 (AUDIT, AGENTS, PICKLE, PUBLISHING, CICD, README, scripts.md, steps.md, STYLE diffs). Owed for the 1.1.0 commit, none of it started: (1) `PUBLICATION.md` gets a `### 1.1.0` block under `## Steam change notes`, first line `[b]1.1.0[/b]` (the CI refuses otherwise), and the Steam description loses its "1.6"; (2) CI template: `.github` is in git at stamp `ba64b0c1b25d`, regenerate with `bash ../Rimworld-Release-Admin/scripts/generate-publish-workflow.sh . --regenerate` (CICD.md, dormant mods), then `Check-CiTemplate.ps1`; (3) `Tests/Pickle/Check-Steps.ps1` is a local script with no justification in `scripts/LOCAL_SCRIPTS.md` and the shared `scripts/Check-Steps.ps1` already does the job (it passes here): delete the local copy or justify it; (4) the 29 local step patterns (`Tests/Pickle/Source`) are absent from `steps.md`: declare them to NPT; (5) `docs/runs/README.md` still points at `Tests/Manual/evidence/`, stale; (6) 1.7 suite fixes from PICKLE.md: raise `TimeoutSeconds` on steps that wait ticks (5 s default), and the 1.7 "did not load any content" ERROR on the suite mod must not fail the "identifier appears in no error" scenario; (7) the 1.7 runs stage no No Version Warning (staging script lacks it), so proof is log and report, never the absence of a warning. `CICD.md` says the tree was emptied on purpose on 2026-10-12 and warns against `git checkout -- .`; it was restored on Virginie's explicit order on 2026-10-13.
- Items of the protocol read, status 2026-10-14 (commits 2298fc6, cd2ec4f): done: (1) `PUBLICATION.md` `### Next version: 1.1.0 (draft, not sent)` note block, descriptions (`Mod/README.template.md`, `Mod/About/About.xml` regenerated by `sync-about-description.mjs --write`, `README.md`) carry no "1.6" and no save-compatibility promise, `CHANGELOG.md` `[Unreleased]` records it (the 1.0.0 line stays, append-only); (2) `.github` regenerated at stamp `bb16e313d7ac`, `Check-CiTemplate` identical; (3) local `Tests/Pickle/Check-Steps.ps1` deleted, the shared one passes; (5) `docs/runs/README.md` fixed; (6) feature 01 `@timeout:30`, feature 13 `@timeout:60`, `LoggedMessageSteps` ignores the suite mod load ERROR; (7) noted. Waiting on others: Audit rebuilds the net10 DLL and copies the Features into `~/pt17/mods/AncientBuildingsSteps`, and drops the `Check-Steps` row from `LOCAL_SCRIPTS.md`; NPT declares the 29 local steps (4). Then EN, FR and no-Biotech 1.7 tickets are redeposited (a787 FR had no report, 5079 EN 21 of 24, 9ec4 5 of 6, failures all on the suite side).
- 7.a: the scenarios of the version live in `TESTING.md` (no `TEST_SCENARIOS.md`); its section "Existing-save migration" stays for reference only (owner decision 2026-10-11).

## History

The dated sections of this file (audits of 2026-09-13, 09-24 and 10-01, the Pickle suite notes, the publication and rollback notes of 2026-10-08) are folded into `docs/runs/2026-10-10.txt`; the old text is in git (`git log -p STATUS.md`).

## Translation audit

- **French review, 2026-10-01:** reviewer Virginie (her statement in chat, recorded by the session), revision reviewed `beeb97a` (texts of `FRENCH_REVIEW.md`, 12 entries), corrections requested and applied: barrier, lamppost, fence and air conditioner description; the air conditioner label kept as "climatiseur antique" at her word. Validated as it stands.
- **French review confirmed, 2026-10-08:** Virginie, in chat: "traduction validée". `Mod/Languages/French` unchanged since `adb5d0c`; `translation_fr: complete` stands.
- Scope: the whole published `Mod/` tree. Two Def files hold six ThingDefs; their six labels and six descriptions are the complete inventory of owned in-game text. No assembly, C# source, patch, LoadFolders, Keyed resource or grammar resource.
- English comes from the non-empty Def fields in `Mod/Defs/ThingDefs_Buildings/` (no English DefInjected copy needed). Both files under `Mod/Languages/French/DefInjected/ThingDef/` give all 12 French values. Checked again 2026-10-10: `Check-DefInjected` 12 keys, 0 errors.
- Gender agreement: all 12 French entries are building labels or descriptions; none addresses a pawn, so no three-segment gender switch applies.
- Runtime display in EN and FR is asserted by Pickle scenarios 06 and 07 (green).

Repeat this audit after a change to Defs or language resources; reset the affected translation fields to `unchecked` until revalidated.

Vocabulary for `licence`: `open` an explicit licence, `silent` no licence and a dead source, `alive` no licence but a living source, `forbidden` a written refusal, `original` owing nothing to anyone.

- GitHub social preview replaced 2026-10-14 by this session through Claude in Chrome (repository settings, Social preview) with the 1.7-badge `Mod/About/Preview.png` (652 798 bytes, sha256 d01f1843...2928542, commit 843532c); the served image (repository-images.githubusercontent.com/1365538522/a447e922-...) downloaded and found byte-identical.

- GitHub social preview replaced again 2026-10-14 by this session (Claude in Chrome) after the owner asked for the ModIcon badge to be shifted 12.5% toward the corner (`iconBadge.translate` in `Art/Preview.config.json`, commit 3ba3563): `Mod/About/Preview.png` 645 599 bytes, sha256 0ccf1b82...954e6; the served image (repository-images.githubusercontent.com/1365538522/9f65c5eb-...) downloaded and found byte-identical. Supersedes the d01f1843 upload of the same day.

- Echo (AUDIT.md 10.a), 2026-10-14: decision keep `Art/echo-source.png`, by Virginie in chat, after the Preview was regenerated with the 1.7 badge and the ModIcon shifted 12.5% toward the corner (commit 3ba3563). Only the badge and the corner image changed; the echo line art is the same. `echo_review_sha` set to HEAD.
