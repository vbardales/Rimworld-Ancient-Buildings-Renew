# Steps of Ancient Buildings Renew

The Pickle steps this repository ships. **Pickle's own steps are in its catalogue:**
[Docs/steps.md](https://github.com/RimWorks/Rimworld-Pickle/blob/main/Docs/steps.md). The generic tools (overlay hiding, rectangle framing, waiting, apparel) are in
[Nelim's Pickle Tools](https://github.com/vbardales/Rimworld-Nelim-Pickle-Tools/blob/main/docs/steps.md). Every step here starts with `Ancient Buildings Renew:` (see `Tests/Pickle/README.md`).

This file is **generated** from the `[Given]`, `[When]` and `[Then]` attributes of `Tests/Pickle/Source/` and the summary above them: do not edit it,
run `scripts/Generate-Steps.ps1 -ModRoot AncientBuildingsRenew` of the protocols repository (`-Check` verifies that it is current). 29 steps. Pickle matches on the text alone, so a scenario may use
`Given`, `When`, `Then` or `And` as it reads best.

| Step | Does |
| --- | --- |
| `Ancient Buildings Renew: a {string} is built at \({int}, {int}\) facing {word}` (When) | The shipped "a {string} is built at" step gives no way to set a rotation, and the air conditioner's grille (TESTING.md: "rotate it before building and the drawn grille must turn with it") is a drawing, not a value a def-reading step can check. |
| `Ancient Buildings Renew: the def {string} carries a component of class {string}` (Then) | Passes when the def has a component whose class, or whose properties class, has this name. |
| `Ancient Buildings Renew: the def {string} carries no component of class {string}` (Then) | The reverse: the lamppost has no power component, and that is what makes it solar. |
| `Ancient Buildings Renew: the def {string} draws {int} watts` (Then) | Passes when the def carries a power trader comp whose base consumption is the given number of watts. |
| `Ancient Buildings Renew: the def {string} draws the texture {string} at size {float} by {float}` (Then) | Diagnostic for the lamppost's light cone (2026-09-27): the capture showed no cone, so this reads graphicData back from the loaded def, which the shipped "def field" step cannot reach since it is nested. Separates "the def did not load what the source says" from "it loaded but did not render". |
| `Ancient Buildings Renew: the def {string} short-circuits in rain` (Then) | The stove's rain short circuit is a flag of its power component, read as the game loaded it. |
| `Ancient Buildings Renew: the def {string} has a fill percent of {float}` (Then) | Cover and walking over are the def's fill percent and passability, not the mod's own code. |
| `Ancient Buildings Renew: the def {string} lets pawns walk over it` (Then) | Passes when the def has the passability PassThroughOnly, which lets pawns cross its cell. |
| `Ancient Buildings Renew: the def {string} counts as a fence for an animal pen` (Then) | An animal pen counts a def as a fence by its building.isFence flag. |
| `Ancient Buildings Renew: the def {string} offers the related build command {string}` (Then) | Passes when the def lists the named designator among its related build commands. |
| `Ancient Buildings Renew: the build designator for {string} offers the drawing style {string}` (Then) | Passes when the designator a player picks for this building offers the named drawing style. A building whose draw style category did not load offers none, and can only be placed one cell at a time: the defect this port exists to fix. |
| `Ancient Buildings Renew: I drag out the build designator for {string} from \({int}, {int}\) to \({int}, {int}\) in the {word} style` (When) | A drag, without the pointer. The game asks the selected draw style for the cells between the press and the release, then hands them to DesignateMultiCell: this does the same, with the style named. It fails, saying so, when the building offers no such style, which is how a fence that cannot be dragged shows up. |
| `Ancient Buildings Renew: the build designator for {string} accepts \({int}, {int}\)` (Then) | Passes when the real build designator for the def accepts the given cell on the current map. |
| `Ancient Buildings Renew: the build designator for {string} refuses \({int}, {int}\) saying the text of {string}` (Then) | The refusal a player reads, given by its translation key so that it holds in any language. |
| `Ancient Buildings Renew: the build designator for {string} is available` (Then) | Whether the architect menu would show this building now. Research gates it: the game hides the designator of a building whose research is not finished. |
| `Ancient Buildings Renew: the build designator for {string} is not available` (Then) | Passes when the build designator for the def is not shown, as while its research is unfinished. |
| `Ancient Buildings Renew: no research is finished` (Given) | Puts every research back to unfinished. The test colony is a late one and has AirConditioning done, so a scenario about a research gate has to start by undoing it. Finishing a project finishes its prerequisites too, so the step that finishes AirConditioning afterwards still works. |
| `Ancient Buildings Renew: a constructed roof covers \({int}, {int}\)` (Given) | Roofs the given cell with a constructed roof, so a scenario can test a refused placement. |
| `Ancient Buildings Renew: the {string} at \({int}, {int}\) is powered on` (When) | Turns a built thing's power comp on directly, without a grid, a conduit or a generator: the wall cooling scenario asks only whether the air conditioner cools and heats once powered, not whether power reaches it, which the shipped power-net simulation already covers for every building. |
| `Ancient Buildings Renew: \({int}, {int}\) and \({int}, {int}\) are in different rooms` (Then) | Diagnostic for the wall-cooling scenario (2026-09-27): two temperature readings came back equal, as if the two rooms the walls were meant to separate were really one. This asks the game's own room system directly, which is what CompTempControl exchanges heat between, rather than trusting a coincidence of numbers. |
| `Ancient Buildings Renew: the light on the ground at \({int}, {int}\) is above {float}` (Then) | Passes when the light level on the ground at the cell is above the given value. |
| `Ancient Buildings Renew: the light on the ground at \({int}, {int}\) is below {float}` (Then) | Passes when the light level on the ground at the cell is below the given value. |
| `Ancient Buildings Renew: the {string} at \({int}, {int}\) is glowing` (Then) | Passes when the thing of the given def at the cell has a glower comp that currently glows. |
| `Ancient Buildings Renew: the {string} at \({int}, {int}\) does not deteriorate` (Then) | The deterioration rate the game computes for the item where it lies. A meal in the vending machine is zero, and the same meal on bare ground is not: the two are asked in the same scenario. |
| `Ancient Buildings Renew: the {string} at \({int}, {int}\) deteriorates` (Then) | Passes when the thing of the given def at the cell loses hit points over time. |
| `Ancient Buildings Renew: the {string} at \({int}, {int}\) offers the command that links its storage settings` (Then) | Passes when the built thing at the cell offers the gizmo that links its storage settings. |
| `Ancient Buildings Renew: the blueprint for {string} at \({int}, {int}\) has storage settings` (Then) | Passes when the blueprint is one whose storage settings can be set before the building exists. |
| `Ancient Buildings Renew: nothing logged as an error or a warning names {string}` (Then) | Fails when something logged as an error or a warning names the given text. Case insensitive. Used with a def name or an identifier of this mod, so a line about another mod, of which vanilla logs plenty, is never blamed on this one. |
| `Ancient Buildings Renew: an error or a warning was logged naming {string} and {string}` (Then) | Passes when something logged as an error or a warning contains all of the given texts. It is here for the declared incompatibility: the original mod still ships a field 1.6 removed, and the game logs that when it reads its def next to this mod's. The game does not log the shared defNames. |
