# A colonist cooks at the stove, by the game's own work giver (patch Mod/Patches/AB_Stove_WorkGiver.xml).
#
# The stove carries the electric stove's recipes, but the game only lets a colonist cook at the benches that
# the work giver DoBillsCook lists. The patch adds ABKitchenstove to that list. The step below asks the game's
# own DoBillsCook for the job it builds on the stove and starts it: without the patch the giver returns no job
# and the step stops the scenario, so a missing patch fails here and not in a gallery picture.
#
# Played in the Sanctuary (the save with a colonist, Nelim) in English; the stove is spawned, powered and given
# one meal bill, with potatoes on the floor beside it.
@requires:nelim.sanctuarybacklot @requires:nelim.pickletools.colonistrace
Feature: a colonist cooks at the stove

  Scenario: the game's own cooking work giver gives a colonist the bill of the stove
    Given the save "Nelims-tribe" is loaded
    And game speed is paused
    And Nelim's Pickle Tools: all humans but "Nelim" are removed
    And Nelim's Sanctuary: I am at the sanctuary "calm-zone"
    And Nelim's Pickle Tools: the building "ABKitchenstove" is spawned at (200, 189) facing East
    And Nelim's Pickle Tools: the building "ABKitchenstove" at (200, 189) is powered
    And Nelim's Pickle Tools: 10 of the item "RawPotatoes" are spawned at (199, 188)
    And Nelim's Pickle Tools: the building "ABKitchenstove" at (200, 189) has the bill "CookMealSimple"
    When Nelim's Pickle Tools: "Nelim" is forced into the work of the giver "DoBillsCook" on the building "ABKitchenstove" at (200, 189)
    And I wait 30 ticks
    Then Nelim's Pickle Tools: "Nelim" is at the building "ABKitchenstove" at (200, 189) and working
    And no errors were logged
