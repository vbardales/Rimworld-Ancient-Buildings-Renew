using System;
using System.Collections.Generic;
using System.Linq;
using RimWorks.Pickle;
using RimWorld;
using Verse;

namespace AncientBuildingsRenew.PickleSteps
{
    /// <summary>
    /// What the six buildings do, asked of the game itself, so that no person has to play to see it.
    ///
    /// Every answer is read from the objects the game uses: the build designator a player would pick, the
    /// draw styles it offers, the cells a drag would designate, the glow grid, the deterioration rate the
    /// game computes for an item, the gizmos a building offers. None of it is the mod's declaration read
    /// back: a declaration that the game ignores (the fence's old field, which the loader dropped) is
    /// exactly what these steps are here to catch.
    ///
    /// One thing is not reproduced: the pointer. A drag is a press, a pull and a release, and the game
    /// ends it by handing the cells its draw style computed to DesignateMultiCell. The step for the drag
    /// asks the same draw style for the same cells and hands them to the same method, so it goes through
    /// everything the mouse would except the mouse.
    ///
    /// Every step text starts with "Ancient Buildings Renew:", like the log steps of this suite, so that no
    /// step of another suite or of Pickle can be ambiguous with it. No text uses parentheses or slashes
    /// except the escaped cell coordinates, which Cucumber expressions read as they do in Pickle's own.
    /// </summary>
    [PickleSteps]
    public class BuildingSteps
    {
        private static ThingDef Def(PickleContext ctx, string name)
        {
            ThingDef def = DefDatabase<ThingDef>.GetNamedSilentFail(name);
            ctx.Assert(def != null, "no ThingDef named '" + name + "' is loaded");
            return def;
        }

        private static Thing BuiltThingAt(string defName, int x, int z)
        {
            Map map = Find.CurrentMap;
            if (map == null) return null;
            return map.thingGrid.ThingsListAt(new IntVec3(x, 0, z))
                .FirstOrDefault(t => t.def.defName.Equals(defName, StringComparison.OrdinalIgnoreCase));
        }

        private static Thing BlueprintAt(string defName, int x, int z)
        {
            Map map = Find.CurrentMap;
            if (map == null) return null;
            return map.thingGrid.ThingsListAt(new IntVec3(x, 0, z))
                .FirstOrDefault(t => t is Blueprint b
                    && b.def.entityDefToBuild != null
                    && b.def.entityDefToBuild.defName.Equals(defName, StringComparison.OrdinalIgnoreCase));
        }

        private static string Names(IEnumerable<string> names)
        {
            string joined = string.Join(", ", names);
            return joined.Length == 0 ? "none" : joined;
        }

        // ---- what a def carries ----------------------------------------------------------------

        private static IEnumerable<string> ComponentClasses(ThingDef def)
        {
            if (def.comps == null) yield break;
            foreach (CompProperties props in def.comps)
            {
                if (props.compClass != null) yield return props.compClass.Name;
                yield return props.GetType().Name;
            }
        }

        /// <summary>Passes when the def has a component whose class, or whose properties class, has this name.</summary>
        [Then("Ancient Buildings Renew: the def {string} carries a component of class {string}")]
        public void CarriesComponent(PickleContext ctx, string defName, string className)
        {
            ThingDef def = Def(ctx, defName);
            List<string> have = ComponentClasses(def).Distinct().ToList();
            ctx.Assert(
                have.Any(n => n.Equals(className, StringComparison.OrdinalIgnoreCase)),
                defName + " carries no component of class '" + className + "'; its components: " + Names(have));
        }

        /// <summary>The reverse: the lamppost has no power component, and that is what makes it solar.</summary>
        [Then("Ancient Buildings Renew: the def {string} carries no component of class {string}")]
        public void CarriesNoComponent(PickleContext ctx, string defName, string className)
        {
            ThingDef def = Def(ctx, defName);
            List<string> have = ComponentClasses(def).Distinct().ToList();
            ctx.Assert(
                !have.Any(n => n.Equals(className, StringComparison.OrdinalIgnoreCase)),
                defName + " carries a component of class '" + className + "'; its components: " + Names(have));
        }

        [Then("Ancient Buildings Renew: the def {string} draws {int} watts")]
        public void DrawsWatts(PickleContext ctx, string defName, int watts)
        {
            ThingDef def = Def(ctx, defName);
            CompProperties_Power power = def.GetCompProperties<CompProperties_Power>();
            ctx.Assert(power != null, defName + " has no power component");
            ctx.Assert(
                Math.Abs(power.PowerConsumption - watts) < 0.5f,
                defName + " draws " + power.PowerConsumption + " watts, not " + watts);
        }

        // ---- the build designator, and the drag ------------------------------------------------

        private static Designator_Build DesignatorFor(PickleContext ctx, string defName)
        {
            return new Designator_Build(Def(ctx, defName));
        }

        /// <summary>
        /// Passes when the designator a player picks for this building offers the named drawing style. A
        /// building whose draw style category did not load offers none, and can only be placed one cell at a
        /// time: the defect this port exists to fix.
        /// </summary>
        [Then("Ancient Buildings Renew: the build designator for {string} offers the drawing style {string}")]
        public void OffersStyle(PickleContext ctx, string defName, string style)
        {
            Designator_Build des = DesignatorFor(ctx, defName);
            DrawStyleCategoryDef category = des.DrawStyleCategory;
            ctx.Assert(
                category != null && !category.styles.NullOrEmpty(),
                "the build designator for " + defName + " offers no drawing style, so it can only be placed one cell at a time");
            List<string> names = category.styles.Select(s => s.defName).ToList();
            ctx.Assert(
                names.Any(n => n.Equals(style, StringComparison.OrdinalIgnoreCase)),
                "the build designator for " + defName + " offers the styles " + Names(names) + ", not '" + style + "'");
        }

        /// <summary>
        /// A drag, without the pointer. The game asks the selected draw style for the cells between the press
        /// and the release, then hands them to DesignateMultiCell: this does the same, with the style named.
        /// It fails, saying so, when the building offers no such style, which is how a fence that cannot be
        /// dragged shows up.
        /// </summary>
        [When("Ancient Buildings Renew: I drag out the build designator for {string} from \\({int}, {int}\\) to \\({int}, {int}\\) in the {word} style")]
        public void DragOut(PickleContext ctx, string defName, int x1, int z1, int x2, int z2, string style)
        {
            Designator_Build des = DesignatorFor(ctx, defName);
            DrawStyleCategoryDef category = des.DrawStyleCategory;
            ctx.Assert(
                category != null && !category.styles.NullOrEmpty(),
                "the build designator for " + defName + " offers no drawing style, so it cannot be dragged out");
            DrawStyleDef def = category.styles.FirstOrDefault(s => s.defName.Equals(style, StringComparison.OrdinalIgnoreCase));
            ctx.Assert(
                def != null,
                "the build designator for " + defName + " offers the styles " + Names(category.styles.Select(s => s.defName)) + ", not '" + style + "'");
            List<IntVec3> cells = new List<IntVec3>();
            def.DrawStyleWorker.Update(new IntVec3(x1, 0, z1), new IntVec3(x2, 0, z2), cells);
            ctx.Assert(cells.Count >= 2, "the " + style + " style gave " + cells.Count + " cell(s) between the press and the release");
            des.DesignateMultiCell(cells);
        }

        [Then("Ancient Buildings Renew: the build designator for {string} accepts \\({int}, {int}\\)")]
        public void Accepts(PickleContext ctx, string defName, int x, int z)
        {
            AcceptanceReport report = DesignatorFor(ctx, defName).CanDesignateCell(new IntVec3(x, 0, z));
            ctx.Assert(report.Accepted, "the build designator for " + defName + " refuses (" + x + ", " + z + "): " + report.Reason);
        }

        /// <summary>The refusal a player reads, given by its translation key so that it holds in any language.</summary>
        [Then("Ancient Buildings Renew: the build designator for {string} refuses \\({int}, {int}\\) saying the text of {string}")]
        public void Refuses(PickleContext ctx, string defName, int x, int z, string key)
        {
            AcceptanceReport report = DesignatorFor(ctx, defName).CanDesignateCell(new IntVec3(x, 0, z));
            ctx.Assert(!report.Accepted, "the build designator for " + defName + " accepts (" + x + ", " + z + ")");
            string expected = key.Translate().ToString();
            ctx.Assert(
                string.Equals(report.Reason, expected, StringComparison.Ordinal),
                "the build designator for " + defName + " refuses (" + x + ", " + z + ") saying '" + report.Reason + "', not '" + expected + "'");
        }

        /// <summary>
        /// Whether the architect menu would show this building now. Research gates it: the game hides the
        /// designator of a building whose research is not finished.
        /// </summary>
        [Then("Ancient Buildings Renew: the build designator for {string} is available")]
        public void IsAvailable(PickleContext ctx, string defName)
        {
            ctx.Assert(DesignatorFor(ctx, defName).Visible, "the build designator for " + defName + " is hidden");
        }

        [Then("Ancient Buildings Renew: the build designator for {string} is not available")]
        public void IsNotAvailable(PickleContext ctx, string defName)
        {
            ctx.Assert(!DesignatorFor(ctx, defName).Visible, "the build designator for " + defName + " is shown");
        }

        [Given("Ancient Buildings Renew: a constructed roof covers \\({int}, {int}\\)")]
        public void RoofCovers(PickleContext ctx, int x, int z)
        {
            Map map = Find.CurrentMap;
            ctx.Assert(map != null, "no map is loaded");
            map.roofGrid.SetRoof(new IntVec3(x, 0, z), RoofDefOf.RoofConstructed);
        }

        // ---- what a built thing does -----------------------------------------------------------

        [Then("Ancient Buildings Renew: the light on the ground at \\({int}, {int}\\) is above {float}")]
        public void LightAbove(PickleContext ctx, int x, int z, float level)
        {
            float glow = Find.CurrentMap.glowGrid.GroundGlowAt(new IntVec3(x, 0, z), false, false);
            ctx.Assert(glow > level, "the light on the ground at (" + x + ", " + z + ") is " + glow + ", not above " + level);
        }

        [Then("Ancient Buildings Renew: the light on the ground at \\({int}, {int}\\) is below {float}")]
        public void LightBelow(PickleContext ctx, int x, int z, float level)
        {
            float glow = Find.CurrentMap.glowGrid.GroundGlowAt(new IntVec3(x, 0, z), false, false);
            ctx.Assert(glow < level, "the light on the ground at (" + x + ", " + z + ") is " + glow + ", not below " + level);
        }

        [Then("Ancient Buildings Renew: the {string} at \\({int}, {int}\\) is glowing")]
        public void IsGlowing(PickleContext ctx, string defName, int x, int z)
        {
            Thing thing = BuiltThingAt(defName, x, z);
            ctx.Assert(thing != null, "no " + defName + " stands at (" + x + ", " + z + ")");
            CompGlower glower = thing.TryGetComp<CompGlower>();
            ctx.Assert(glower != null, defName + " has no glower");
            ctx.Assert(glower.Glows, defName + " at (" + x + ", " + z + ") is not glowing");
        }

        /// <summary>
        /// The deterioration rate the game computes for the item where it lies. A meal in the vending machine
        /// is zero, and the same meal on bare ground is not: the two are asked in the same scenario.
        /// </summary>
        [Then("Ancient Buildings Renew: the {string} at \\({int}, {int}\\) does not deteriorate")]
        public void DoesNotDeteriorate(PickleContext ctx, string defName, int x, int z)
        {
            Thing thing = BuiltThingAt(defName, x, z);
            ctx.Assert(thing != null, "no " + defName + " lies at (" + x + ", " + z + ")");
            float rate = SteadyEnvironmentEffects.FinalDeteriorationRate(thing);
            ctx.Assert(rate <= 0f, defName + " at (" + x + ", " + z + ") deteriorates at " + rate + " per day");
        }

        [Then("Ancient Buildings Renew: the {string} at \\({int}, {int}\\) deteriorates")]
        public void Deteriorates(PickleContext ctx, string defName, int x, int z)
        {
            Thing thing = BuiltThingAt(defName, x, z);
            ctx.Assert(thing != null, "no " + defName + " lies at (" + x + ", " + z + ")");
            float rate = SteadyEnvironmentEffects.FinalDeteriorationRate(thing);
            ctx.Assert(rate > 0f, defName + " at (" + x + ", " + z + ") does not deteriorate, so the comparison with the vending machine proves nothing");
        }

        // ---- storage ---------------------------------------------------------------------------

        [Then("Ancient Buildings Renew: the {string} at \\({int}, {int}\\) offers the command that links its storage settings")]
        public void OffersLinkCommand(PickleContext ctx, string defName, int x, int z)
        {
            Thing thing = BuiltThingAt(defName, x, z);
            ctx.Assert(thing != null, "no " + defName + " stands at (" + x + ", " + z + ")");
            string label = "LinkStorageSettings".Translate().ToString();
            List<string> offered = new List<string>();
            foreach (Gizmo gizmo in ((Building)thing).GetGizmos())
            {
                Command command = gizmo as Command;
                if (command == null) continue;
                offered.Add(command.defaultLabel);
                if (string.Equals(command.defaultLabel, label, StringComparison.Ordinal)) return;
            }
            ctx.Assert(false, defName + " at (" + x + ", " + z + ") offers no '" + label + "' command; it offers: " + Names(offered));
        }

        /// <summary>Passes when the blueprint is one whose storage settings can be set before the building exists.</summary>
        [Then("Ancient Buildings Renew: the blueprint for {string} at \\({int}, {int}\\) has storage settings")]
        public void BlueprintHasStorageSettings(PickleContext ctx, string defName, int x, int z)
        {
            Thing blueprint = BlueprintAt(defName, x, z);
            ctx.Assert(blueprint != null, "no blueprint for " + defName + " stands at (" + x + ", " + z + ")");
            IStoreSettingsParent parent = blueprint as IStoreSettingsParent;
            ctx.Assert(parent != null, "the blueprint for " + defName + " is a " + blueprint.GetType().Name + ", which has no storage settings to set");
            ctx.Assert(parent.GetStoreSettings() != null, "the blueprint for " + defName + " has no storage settings");
        }
    }
}
