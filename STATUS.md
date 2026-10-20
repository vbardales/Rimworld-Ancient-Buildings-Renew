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
workflow_stage: followUp[1.1.0]
tested_1_7:   yes
licence:      silent
licence_at:   Audit/2026-09-13-rights/README.md
upstream_mod_remotes: N/A
dependencies: none
showcase:     complete
tested_on:    "2026-10-14 RimWorld 1.7 (English only) on 76a7b44: minimal 608f 24/24, without Biotech d218 6/6, both green, French pass 8d50 ran nothing (no French pack on 1.7); see docs/runs/2026-10-13.txt. Before that 2026-10-11 regression on 6f2b69a: tickets 8c0c (minimal-en-2), c967 (minimal-fr-2), ec53 (sans-biotech-2), f818 (incompat-original-2), all green; see docs/runs/2026-10-11.txt (earlier: 2026-10-08/09 on the 1.0.1 tree, docs/runs/2026-10-10.txt)"
pickle_scenarios: "28 scenarios in 14 features, every one has a green run (2026-09-24 to 28); 1.0.1 regression green (docs/runs/2026-10-10.txt); 1.7 English passes green 2026-10-14 (docs/runs/2026-10-13.txt)"
workshop:     "3806708945 (1.0.0 and 1.0.1 published by the CI, tags v1.0.0 and v1.0.1; the owner set the item public on 2026-10-08, her word in chat; this session cannot read the page)"
evidence:     "Pickle reports on disk, Tests/Pickle/evidence/<pass>/ (ignored by git). What to keep: docs/runs/README.md. Rights evidence: Audit/2026-09-13-rights/"
code_review_sha: 3aa55ebb4752013a5ce64f46b810afab963c47c5
social_preview_sha256: 0ccf1b8222e9859c85a8c4af59b86f9d7743aa6074156bc9e491fee9d79954e6
echo_review_sha: fba2ab1a74f6ebc2e97697b4890b51282aec4bfc
publication_changelog_review_sha: 5a74e6dab3bc8020aa387e64336afc39df92efc4
remaining:
- unverified: "Known: the echo line art overlaps the subtitle 'Renew (unofficial)' on the Preview, accepted by the owner 2026-10-12."
  - unverified: "Steam page, item visibility and the new packageId on Steam are not readable by this session; the owner reported them done on 2026-10-08."
  - decided: "existing-save migration: dropped, owner decision 2026-10-11 (chat): backward compatibility with saves of the original ancientbld.core is not guaranteed and not tested. TESTING.md protocol kept for reference only. Open: Mod/About/About.xml line 50 still says a save moves between the two mods; corrected in the 1.1.0 changes (description, commit cd2ec4f, 2026-10-14)."
- open: "Workshop header image (og:image of the item) is still the Preview of before 2026-10-12: it goes with the 1.1.0 publish with --preview, now carrying the 1.7 badge (Mod/About/Preview.png sha256 0ccf1b82...954e6, commit 3ba3563, badge shifted 12.5% toward the corner; GitHub social preview uploaded and verified 2026-10-14; gallery slot 0 on the Steam page still shows the 2026-10-12 Preview and must be replaced by hand or by this session with the same file). 1.1.0 (1.7 declared, tested_1_7: yes since 2026-10-14) waits for: the owner's review of PUBLICATION.md and CHANGELOG.md for the 1.1.x line, code_review_sha, the dry-run date commit, then the CI publish."
- deferred: "No 1.0.2 now (owner decision 2026-10-11: not enough functional change to justify a release). The save-sentence fix (About.xml line 50, README.template.md line 38, README.md line 139, CHANGELOG.md line 94; text in PUBLICATION.md) and the CI template regeneration ride with the next functional version. CI template stale (CI/CD session, 2026-10-11): stamp 82de20b8aa50, current 7fb8f006c206 (Release-Admin 40f56f2, adds build-check.sh --ci and build.yml). Before the next dry-run (1.0.2): generate-publish-workflow.sh ../AncientBuildingsRenew --replace with the arguments of .github/publish.config.json. Never edit a copy by hand. .github/scripts, tests, workflows are copies of the Release-Admin template, none local."
  - validated: "ModIcon.png 32 px readability: validated by the owner in chat on 2026-10-11 (128 px icon opened by this session, winking mascot and column read well). Art/ModIcon-signature-candidate.png stays an untracked candidate, not this session's."
updated:      2026-10-11, non-reg tickets queued on 6f2b69a (minimal-en, minimal-fr, sans-biotech, incompat-original; ancientbld.core re-downloaded to the WSL cache), protocols re-read; before that 2026-10-10, dormant at the owner's word, cleanup of STATUS, TESTING, PUBLICATION, PROTOCOLS-READ and evidence done (WSL cleanup done)
session:      local_03bde249-3cf4-43eb-8e1b-d37f223b9025
protocols_read_sha: 95bda8ea39b1836050f489905e28a649c841e9ab
---
# Ancient Buildings Renew: status

**State: `followUp[1.1.0]` (reopened from `dormant` for the 1.7 declaration; 1.1.0 dry-run on `a90ba6f` green, publish waits for owner).** Previous state: `dormant` from `followUp[1.0.1]` (owner's order 2026-10-10). 1.0.0 (CI run 37831089676, tag `v1.0.0`) and 1.0.1 (CI run 37836720872, SHA `1cd35ff94791f61330a0827d9694fb5f852943bd`, tag `v1.0.1`) published by CI on Workshop item 3806708945. 1.0.1 only renames `packageId` to `nelim.ancientbuildings`. New fix or new RimWorld version reopens chain at `code[x.y.z]`.

## Gates (audit of 2026-10-10, revision `2611536`)

| Gate | Result |
|---|---|
| Offline checks on `Mod/` | Re-run 2026-10-10, all clean: `Check-XmlFields` (3 files), `Check-DefRefs` (6 defs), `Check-XmlClasses` (19 types), `Check-TypeRefs` (no third-party reference), `Check-DefInjected` (12 keys, 0 errors), `Check-ConfigErrors` (6 of 6, 26 rules). No C# source, no assembly. |
| Dependencies | None. `incompatibleWith ancientbld.core` (original). `MayRequire` Biotech on two baby-food recipes. No `loadAfter`, no `LoadFolders`, no patch. |
| Settings | `not_applicable`: no assembly, no `ModSettings`, no `MainButtonDef`, so no empty page, no shortcut. |
| Translations | EN from Defs, FR in `Mod/Languages/French` (12 of 12), reviewed by Virginie 2026-10-01, confirmed 2026-10-08. See `Translation audit` below. |
| Pickle | 28 scenarios in 14 features, all green once; 1.0.1 regression green (below). |
| Code review | `code_review_sha` = `0cec113` (re-set 2026-10-10 after icon change: only `Mod/` files changed since `2611536` are regenerated `ModIcon.png` and `Preview.png`, both opened and read, no code). Since previous review (`1159c8a`, 2026-10-08) only `Mod/` change is `packageId` line of `Mod/About/About.xml` (commit `818be66`); Pickle features and test mod `About.xml` moved to new id in same commit. No other use of old id remains outside CHANGELOG, PUBLICATION change note, history. |
| Docs | `CHANGELOG.md` `[1.0.1]` dated 2026-10-08 (still said `unreleased`). Description in `Mod/About/About.xml` opens with UNOFFICIAL, ends with `Source code on GitHub`, no em dash. `PUBLICATION.md` has 1.0.0 and 1.0.1 change notes. |
| Licence | `silent`, evidence in `Audit/2026-09-13-rights/`. Original repository: none found (2026-10-01; GitLab and Codeberg not searched). |

## 1.0.1 regression (AUDIT.md 14.a)

Tickets 6598, ca1c, a8bb (deposited 2026-10-08 after rename commit, all exit 0, summaries read 2026-10-10):

- 6598, pass minimal, EN: 32 scenarios, 24 passed, 0 failed, 8 skipped (`@requires` scenarios of other passes).
- ca1c, pass sans-biotech: 23 scenarios, 15 passed, 0 failed, 8 skipped.
- a8bb, pass incompat-original: 1 scenario, passed (original still carries removed field).

Not replayed: French pass (no text changed in 1.0.1), gallery pass (gallery unchanged).

## Published versions

| Version | Date | What | Tag |
|---|---|---|---|
| 0.1.0 | 2026-09-23 | prepublication, creates private item | none |
| 1.0.0 | 2026-10-08 | first release | `v1.0.0` |
| 1.0.1 | 2026-10-08 | `packageId` `nelim.ancientbuildingsrenew` to `nelim.ancientbuildings` | `v1.0.1` |

Rollback target: private visibility (owner used once 2026-10-08, between 1.0.0 and 1.0.1; public again after 1.0.1).

## Gallery

`Art/Gallery/0` to `7`, contiguous, `0-preview.png` byte-identical to `Mod/About/Preview.png` (645 599 bytes since 1.7 badge, commit 3ba3563; 653 490 bytes when owner uploaded by hand 2026-10-08). Order: 0 preview, 1 six buildings together at dusk, 2 lamppost at night, 3 air conditioner in wall, 4 vending machine and stove, 5 road comes in, 6 barrier and fence up close, 7 vending machine up close. Mature content boxes: none.

## Reviews

- PUBLICATION.md and CHANGELOG.md (1.0 line): confirmed by Virginie in chat 2026-10-10, commit `8d24895fc4776d9e6ffcf79138824958d9fa82f7` (`publication_changelog_review_sha`).
- PUBLICATION.md and CHANGELOG.md (1.1.x line, 1.7 declaration and 1.1.0 Steam notes): validated by Virginie in chat 2026-10-14, commit `a2f649a80f608af66bb5ea6fb174bac0f263bd93` (`publication_changelog_review_sha`).
- Code review (AUDIT.md 8.m exception, 2026-10-15, owner agreed in chat): `git diff bf7bca0 HEAD -- Mod` read; only `Mod/ATTRIBUTION.md` wording (.psd removal) and `Preview.png`. Revue du diff : images et texte seuls. `code_review_sha` = `3aa55eb`.
- Code review (AUDIT.md 8.m exception, 2026-10-14): `git diff 9a71538 HEAD -- Mod` read; holds only description text and `supportedVersions` of `About.xml`, regenerated `Preview.png`, `README.template.md` wording. Revue du diff : images et texte seuls. `code_review_sha` set to HEAD, no new playTests pass (1.7 passes already ran on same defs).

- GitHub social preview (first upload 2026-10-10 with previous Preview, 54b60b2f..., replaced same day by regenerated Preview, see remaining): upload confirmed by Virginie in chat 2026-10-10; repository page `og:image` (repository-images.githubusercontent.com/1365538522/70896796-...) downloaded by session, byte-identical to `Mod/About/Preview.png`, sha256 `54b60b2f0c81b0ce6f9ab619f86e3e107cc5de76779970e7a9db0b976917575f` (`social_preview_sha256`).

- Echo (AUDIT.md 10.a): decision keep `Art/echo.png`, by Virginie in chat 2026-10-10, with regenerated Preview and eight gallery images in hand (line-art vending machine and lamppost match gallery subjects). Commit `6a3d71d8f3f228c2789c3faef4e151fe10320074` (`echo_review_sha`).
- Echo, 2026-10-12: Preview regenerated with Art/echo-source.png (line art derived from gallery images, STYLE_RIMWORLD.md), accepted by Virginie in chat 2026-10-12 after seeing render, overlap with subtitle included (her word: "c'est ok"). Code review re-set same day: only Mod/ file changed since 0cec113 is Mod/About/Preview.png, image, no code. Both SHAs = commit this change sits on (`echo_review_sha`, `code_review_sha`).

- WSL cleanup (AUDIT.md 14.c), 2026-10-10: under machine lock (Use-Wsl.ps1, exit 0) removed `~/workshop-cache/steamapps/workshop/content/294100/2566355159` (ancientbld.core, 732K), named only by this mod's `wsl-deps.incompat-original.map`. Kept: other 23 items of cache (Sanctuary and Facial Animation set, named by 38 other maps). Verified gone.

## 1.1.0 chain confirmation (2026-10-13)

1.1.0 line reopens chain at `code[1.1.0]` (AUDIT.md 15). Version changes only `supportedVersions` (`<li>1.7</li>`, after green 1.7 run), so each state below confirmed, not redone. Checks rerun 2026-10-13 on `Mod/` at `f926e8b` (`Mod/` unchanged since `0e5b766`, image): all clean, no code touched.

- `code`: no C# source, no assembly; nothing built. `Check-XmlFields` (3 files, no unknown field), `Check-DefRefs` (6 defs, no missing reference), `Check-XmlClasses` (19 types resolved), `Check-TypeRefs` (no third-party type), `Check-ConfigErrors` (6 of 6, 26 rules, no config error). `CHANGELOG.md` gets `[Unreleased]` section when 1.7 turns green.
- `declareDependencies`: unchanged (none; `incompatibleWith ancientbld.core`; `MayRequire` Biotech on two recipes). Not rechecked on 1.7 yet: 1.7 run decides.
- `settings`: `not_applicable` stands (no assembly, no `ModSettings`, no `MainButtonDef`).
- `localize`: `Check-Translations` PASS (12 source texts, French injections), `Check-DefInjected` 12 keys, 0 errors. `translation_fr: complete` stands (Virginie 2026-10-01 and 2026-10-08); no text changed.
- `writeTests`: `Check-Steps` 15 feature files, 36 scenario blocks, 29 patterns compile, every step line resolves. Suite and 1.7 maps (`Tests/Pickle/wsl-deps.minimal-17.map`, `wsl-deps.sans-biotech-17.map`) written; `15-gallery` not part of 1.7 pass.
- Open, not defect: `Check-ModBasics` flags `ATTRIBUTION.md` and `LICENSE` as different between root and `Mod/` (same content in git, line endings differ in working tree after 2026-10-13 restore); not rechecked on clean checkout.
- `playTests[1.1.0]` is 1.7 diagnostic: `f7fa` inconclusive (mod steps not built net10.0), `5079` (EN) 21 of 24 passed, 3 failures on test side (5 s step timeouts, suite mod's own "did not load any content" error); `a787` (FR) and `9ec4` (no Biotech) queued. See `docs/runs/2026-10-13.txt`.
- Protocol items status 2026-10-14 (commits 2298fc6, cd2ec4f): done: (1) `PUBLICATION.md` `### Next version: 1.1.0 (draft, not sent)` note block, descriptions (`Mod/README.template.md`, `Mod/About/About.xml` regenerated by `sync-about-description.mjs --write`, `README.md`) carry no "1.6" and no save-compatibility promise, `CHANGELOG.md` `[Unreleased]` records it (1.0.0 line stays, append-only); (2) `.github` regenerated at stamp `bb16e313d7ac`, `Check-CiTemplate` identical; (3) local `Tests/Pickle/Check-Steps.ps1` deleted, shared one passes; (5) `docs/runs/README.md` fixed; (6) feature 01 `@timeout:30`, feature 13 `@timeout:60`, `LoggedMessageSteps` ignores suite mod load ERROR; (7) noted. Waiting on others: Audit rebuilds net10 DLL, copies Features into `~/pt17/mods/AncientBuildingsSteps`, drops `Check-Steps` row from `LOCAL_SCRIPTS.md`; NPT declares 29 local steps (4). Then EN, FR, no-Biotech 1.7 tickets redeposited (a787 FR no report, 5079 EN 21 of 24, 9ec4 5 of 6, failures all suite side).
- 7.a: scenarios of version live in `TESTING.md` (no `TEST_SCENARIOS.md`); section "Existing-save migration" stays for reference only (owner decision 2026-10-11).

## History

Dated sections of this file (audits of 2026-09-13, 09-24, 10-01, Pickle suite notes, publication and rollback notes of 2026-10-08) folded into `docs/runs/2026-10-10.txt`; old text in git (`git log -p STATUS.md`).

## Translation audit

- **French review, 2026-10-01:** reviewer Virginie (her statement in chat, recorded by session), revision reviewed `beeb97a` (texts of `FRENCH_REVIEW.md`, 12 entries), corrections requested and applied: barrier, lamppost, fence, air conditioner description; air conditioner label kept "climatiseur antique" at her word. Validated as it stands.
- **French review confirmed, 2026-10-08:** Virginie, in chat: "traduction validée". `Mod/Languages/French` unchanged since `adb5d0c`; `translation_fr: complete` stands.
- Scope: whole published `Mod/` tree. Two Def files hold six ThingDefs; six labels and six descriptions are complete inventory of owned in-game text. No assembly, C# source, patch, LoadFolders, Keyed resource, grammar resource.
- English from non-empty Def fields in `Mod/Defs/ThingDefs_Buildings/` (no English DefInjected copy needed). Both files under `Mod/Languages/French/DefInjected/ThingDef/` give all 12 French values. Checked again 2026-10-10: `Check-DefInjected` 12 keys, 0 errors.
- Gender agreement: all 12 French entries are building labels or descriptions; none addresses a pawn, so no three-segment gender switch applies.
- Runtime display in EN and FR asserted by Pickle scenarios 06 and 07 (green).

Repeat audit after change to Defs or language resources; reset affected translation fields to `unchecked` until revalidated.

Vocabulary for `licence`: `open` explicit licence, `silent` no licence and dead source, `alive` no licence but living source, `forbidden` written refusal, `original` owing nothing to anyone.

- GitHub social preview replaced 2026-10-14 by this session through Claude in Chrome (repository settings, Social preview) with 1.7-badge `Mod/About/Preview.png` (652 798 bytes, sha256 d01f1843...2928542, commit 843532c); served image (repository-images.githubusercontent.com/1365538522/a447e922-...) downloaded, byte-identical.

- GitHub social preview replaced again 2026-10-14 by this session (Claude in Chrome) after owner asked ModIcon badge shifted 12.5% toward corner (`iconBadge.translate` in `Art/Preview.config.json`, commit 3ba3563): `Mod/About/Preview.png` 645 599 bytes, sha256 0ccf1b82...954e6; served image (repository-images.githubusercontent.com/1365538522/9f65c5eb-...) downloaded, byte-identical. Supersedes d01f1843 upload of same day.

- Echo (AUDIT.md 10.a), 2026-10-14: decision keep `Art/echo-source.png`, by Virginie in chat, after Preview regenerated with 1.7 badge and ModIcon shifted 12.5% toward corner (commit 3ba3563). Only badge and corner image changed; echo line art same. `echo_review_sha` set to HEAD.


- Review of PUBLICATION.md and CHANGELOG.md for 1.1.x line, 2026-10-15: owner confirmed in chat ("je valide"), commit read `ae3e4fa13d1d3edd702a486746f394eeb97fd306`. External read (Codex) checked same day: French provenance holds, `git diff beeb97a HEAD -- Mod/Languages` and `git diff df0d478 HEAD -- Mod/Languages` empty (both commits ancestors of HEAD), `Mod/Defs` changes since `df0d478` touch only lamppost shader and glow, no label or description, so `translation_fr: complete` stands. 1.0.0 CHANGELOG sentence "a save moves between the two mods" stays (append-only); 1.1.0 entry corrects it.

- Publish 1.1.0, 2026-10-15: CI run 38761642762 on 72f6af2c17d79d1914cf380ef776e47e31b7628f (dry-run 38761474920 green on same SHA, owner approved steam-production). Steam upload "Success" on Workshop item 3806708945 with update_preview, update_description, update_tags (tags Mod, 1.6, 1.7); jobs publish and tag-and-release green, tag v1.1.0 and release exist. Session cannot read Steam page: owner verifies public page (header image with 1.7 badge, description, tags) and replaces gallery slot 0 by hand with Mod/About/Preview.png (645 599 bytes).
- Steam page 1.1.0, 2026-10-16: owner confirmed in chat header image shows 1.7 badge ("c'est 1.7"). Description, tags, gallery slot 0 still not confirmed.
- Gallery reshoots (2026-10-17, 2026-10-18), studied and their folders deleted 2026-10-19: bb37 (scene 7 timed out on a 5 s wait) and ticket 6168 (6 of 7 passed; scene 4 `I frame the cell (199, 188) at zoom 2.2` timed out after 40 s). Read from the six captures of 6168: composition holds (scenes 1, 5, 6 good), but the faces are red and angry (heat blush and combat face), Shogun is in profile (not held facing South), and the carried meal or bottle hides the face (scenes 3 and 5). Fixes in the feature: Shogun held by `the animal ... stands at ... facing South`, `facial expression is "normal+blink"` after the frame, small carried items (pemmican, silver, cloth), scene 4 zoom 2.8. Ticket 20261019-155444-938-6beb ran 2026-10-19, exit=5 (game process `Killed` after scenes 1-4 of 7, exitReason in-progress, no verdict; folder studied and deleted). Read from its four captures: faces still red and angry (scenes 3 and 4, heat blush and combat face persist despite `normal+blink`), Shogun still in profile facing East in scene 3 (the facing step did not hold), scene 4 `Framing by cell ((199, 188) at zoom 2.8)` warns to name a place instead. Next: fix facing and expression, reshoot with a named place for scene 4; find why the game was killed (memory?) before refiling.
- Pending from other sessions, 2026-10-17: Audit (local_10336624) asked to review the mod-workflow skills (resume-mod, close-turn, review-gallery; five frictions listed), queued, no answer needed here. Skills compress-restore: BACKLOG, STATUS, TESTING compressed again 2026-10-17 (originals in %LOCALAPPDATA%\caveman-compress\backups\AncientBuildingsRenew; earlier ones kept as *.original.prev-20261017.md).

## Shotlist rating (Audit rule 2026-10-18, criteria a to j of GALLERY.md; audit of GALLERY-SHOTLIST-AUDIT.md answered)

Stage followUp[1.1.0]. Scores are estimates before playing; the plan, outfits, decor, actions and risks are written in the header of `15-gallery.feature`. Earlier ticket cd2d cancelled (scenes were under 4 by the audit). Fixes against the audit: a different outfit, hairstyle and face kit per scene; an action per scene (carries log, steel bar, meal, silver, drink, pemmican, chocolate); decor named per scene and removed after each shot; plants (daylily, rose, bush on the soil ring) and Shogun facing South in every scene; scenes 4 and 5 are a triangle and a diagonal, not a row; each risk has a plan. Redone images stay candidates; the published gallery is replaced only if Virginie accepts them.

| Scene | a | b | c | d | e | f | g | h | i | j | k | Score |
|---|---|---|---|---|---|---|---|---|---|---|---|---|
| 1 dawn, road comes in | y | torches, daylilies, removed | dog, plants | rust parka, mustard tuque, Flowy (long, loose), calm | carries a log | zoom 3.6, barrier back | y | y | y | barrier, fence | y, one story in the header | 4 |
| 2 barrier and fence close | y | stool, roses, removed | dog, roses | cream shirt, brown trousers, Wavy, neutral | carries a steel bar | zoom 3.4, barrier upper third | y | y | y | barrier, fence | y, one story in the header | 4 |
| 3 stop at eleven | y | stool, bush, removed | dog, bush | teal jacket, Fringe, smile | leaves the stove with a meal | zoom 2.8 | y | y | y | machine, stove | y, one story in the header | 4 |
| 4 vending machine close | y | standing lamp, stool, removed | dog, Ravi | purple robe, Cute, smug; Ravi smile | chooses a meal, Ravi pays | zoom 2.2, triangle | y | y | y | machine | y, one story in the header | 4 |
| 5 air conditioner at three | y | stool, daylilies, removed | dog, Mei, daylilies | white shirt, shade cone, Cleopatra (long, loose), calm | holds a cold drink in the shade | zoom 3.2, diagonal | y | y | y | air conditioner | y, one story in the header | 4 |
| 6 six buildings at dusk | y | torches, daylilies, removed | dog, Ravi | burgundy cape, Long, calm | eats pemmican | zoom 4.4, tableau | y | y | y | all six | y, one story in the header | 4 |
| 7 lamppost at night | y | bushes, removed | dog, bushes | violet jacket, Bob, neutral | carries chocolate through the light | zoom 4.5 | y | y | y | lamppost | y, one story in the header | 4 |

Criterion k (2026-10-18): the header of the feature tells one story (who, where, which day, rhythm, seven episodes). Hat rule: Nelim wears a hat only with long loose hair (Flowy, Cleopatra).

Weakest points (still a 4): f (foreground and background are not separate planes on a flat stone square), and the dusk and night light of scenes 6 and 7.

## Pickle evidence state (2026-10-20, Inbox migration redone: all six folders moved to Inbox, Prune-Evidence -Apply, the three nr-* greens (8 skipped by tag counted red by the script) minified and moved back by hand; Inbox and Parked empty, Evidence 1.67 MB; gallery replay ticket 50fd queued, evidence to Tests/Pickle/Inbox/gallery-2026-10-19-2)

Inbox and Parked empty; pickle-reports-archive holds nothing of this mod. Evidence/ (1.55 MB, each folder has RELEASE.md with its condition): nr-minimal-en-2, nr-minimal-fr-2, nr-sans-biotech-2 (1.6 non-regression of 2026-10-15, defs unchanged since 2026-10-08), p17-minimal-en-3, p17-sans-biotech-2, p17-incompat-original (1.7, 2026-10-14 and 2026-10-15). Prune-Evidence is blind to the game version: it flags the 1.7 folders as superseded by the 1.6 ones, and it removed nr-incompat-original-2 (1.6 incompatibility, replaced only by the 1.7 run); do not -Apply again without reading. History lines: docs/runs/.
