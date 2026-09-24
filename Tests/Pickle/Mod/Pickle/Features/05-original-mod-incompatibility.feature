# A pass of its own: this file plays only when the original mod (Workshop 2566355159) is staged, with
#
#   Run-PickleWsl.ps1 -Mod AncientBuildingsRenew -DepMap wsl-deps.incompat-original.map `
#     -Filter '05-original-mod-incompatibility'
#
# and is skipped by requirement in every other pass, where it counts as skipped and not as passed.
#
# About.xml declares the two incompatible because they define the same five defNames. RimWorld does not
# refuse two mods that do: it logs each duplicate and keeps one copy. So the symptom asserted is exactly
# that, and it stays green while the incompatibility is still true. If the original stops defining them, or
# stops loading on 1.6, the scenario goes red, and that is the day the incompatibleWith line can be
# reconsidered.
#
# It starts from the main menu, not from a save: the conflict is settled while the defs load, and a save that
# failed to load because of it would end the scenario before it could show the symptom.
#
# The duplicate is asserted, not merely tolerated, and a passing scenario is what says so. The tag below
# stops the errors it is about from failing it on their own account. Pickle's own vocabulary has no step for
# "an error was logged", so this uses this suite's own, which reads RimWorld's log.
@requires:ancientbld.core @allow-errors
Feature: the declared incompatibility with the original mod is still true

  Scenario: the two mods define the same buildings and the game logs the duplicates
    Given the main menu is open
    Then mod "ancientbld.core" is loaded
    And mod "nelim.ancientbuildingsrenew" is loaded
    And Ancient Buildings Renew: an error or a warning was logged naming "duplicate" and "ConFence"
    And Ancient Buildings Renew: an error or a warning was logged naming "duplicate" and "ABVending"
