using System;
using System.Collections.Generic;
using System.Linq;
using RimWorks.Pickle;
using Verse;

namespace AncientBuildingsRenew.PickleSteps
{
    /// <summary>
    /// The two things Pickle's own steps cannot say about this mod, and both are about the log.
    ///
    /// Pickle's "no errors were logged" reads the errors recorded since the scenario was armed, and
    /// arming clears the buffer, so every error the game logged while it LOADED THE DEFS is gone
    /// before the first step runs. That is exactly where this mod can go wrong: a Config error on a
    /// def, a cross-reference that resolves to nothing, an unresolved recipe. Those lines are still
    /// in RimWorld's own in-memory log, Verse.Log.Messages, so these steps read that instead.
    ///
    /// Every step text starts with "Ancient Buildings Renew:". Pickle loads the steps of every
    /// active suite into one namespace, and two suites declaring the same text make healthy
    /// scenarios fail with "Ambiguous step". No text here uses parentheses or slashes, which
    /// Cucumber expressions read as optional text and alternatives.
    ///
    /// Both steps read errors AND warnings. Which of the two a given load failure is logged as
    /// differs between the failures this mod can hit, and the difference is not what a scenario is
    /// about. The limit is Log.Messages' own: it keeps a bounded number of recent messages, so a
    /// modlist that logs a great deal at startup can push an early line out. The passes of this suite
    /// stage a small set on purpose.
    /// </summary>
    [PickleSteps]
    public class LoggedMessageSteps
    {
        private static List<string> ErrorsAndWarnings()
        {
            return Log.Messages
                .Where(m => m.type == LogMessageType.Error || m.type == LogMessageType.Warning)
                .Select(m => m.text ?? string.Empty)
                .ToList();
        }

        private static string FirstLine(string text)
        {
            int cut = text.IndexOf('\n');
            return cut < 0 ? text : text.Substring(0, cut);
        }

        /// <summary>
        /// Fails when something logged as an error or a warning names the given text. Case
        /// insensitive. Used with a def name or an identifier of this mod, so a line about another
        /// mod, of which vanilla logs plenty, is never blamed on this one.
        /// </summary>
        [Then("Ancient Buildings Renew: nothing logged as an error or a warning names {string}")]
        public void NothingNames(PickleContext ctx, string text)
        {
            List<string> hits = ErrorsAndWarnings()
                .Where(line => line.IndexOf(text, StringComparison.OrdinalIgnoreCase) >= 0)
                .ToList();
            ctx.Assert(
                hits.Count == 0,
                "expected nothing logged as an error or a warning to name '" + text + "'; got " + hits.Count + ": "
                + string.Join(" | ", hits.Take(3).Select(FirstLine)));
        }

        /// <summary>
        /// Passes when something logged as an error or a warning contains all of the given texts.
        /// It is here for the declared incompatibility: the original mod still ships a field 1.6 removed, and
        /// the game logs that when it reads its def next to this mod's. The game does not log the shared defNames.
        /// </summary>
        [Then("Ancient Buildings Renew: an error or a warning was logged naming {string} and {string}")]
        public void SomethingNamesBoth(PickleContext ctx, string first, string second)
        {
            List<string> all = ErrorsAndWarnings();
            bool found = all.Any(line =>
                line.IndexOf(first, StringComparison.OrdinalIgnoreCase) >= 0
                && line.IndexOf(second, StringComparison.OrdinalIgnoreCase) >= 0);
            ctx.Assert(
                found,
                "expected an error or a warning naming '" + first + "' and '" + second + "'; the log holds "
                + all.Count + " of them: " + string.Join(" | ", all.Take(5).Select(FirstLine)));
        }
    }
}
