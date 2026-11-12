# Protocols judged useless for this mod

Rule (`../AGENTS.md`): read the protocols at the start of a session and before each change of `workflow_stage`, then run
`scripts/Mark-ProtocolsRead.ps1 -Mod AncientBuildingsRenew`. `Check-Status.ps1` lists what changed since `protocols_read_sha`.
This file keeps only the documents judged useless here, with the trigger that makes them useful again.

| Document | Why not needed | Read again when |
|---|---|---|
| `STYLE_RIMWORLD.md` | no image generation by a session; the images are the owner's. Only the file limits apply (Preview under 1 MB, icon 128 px), checked | the Preview or ModIcon is regenerated |
| `scripts/SEARCHING.md` | corpus search; the defName collision sweep is done | a defName or a class is added |
| `MOD_SETTINGS.md` | no assembly, no settings, `not_applicable` justified in `STATUS.md` | a setting is added |
| `ANIMALS.md` | the mod adds no animal | an animal is added |
| `PickleTools/docs/steps.md` | the suite uses no PickleTools companion step | a PickleTools step is considered |
