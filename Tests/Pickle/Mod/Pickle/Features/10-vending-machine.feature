# The vending machine's two 1.4 repairs and its promise about spoilage, asked of the game.
#
# The link command is what a player sees in the gizmo row of a built machine: it is there only if the def
# carries a storage group tag. The blueprint check is what lets the filter be set before the machine exists.
# Spoilage is the deterioration rate the game computes for a meal where it lies: zero on the machine, and
# above zero on bare ground in the same scenario, so the comparison cannot pass on an item that never
# deteriorates anywhere.
@save
Feature: the vending machine can be linked, filtered early, and keeps what is in it

  Scenario: a built machine offers the link command and its blueprint has settings to set
    Given the save "test-colony" is loaded
    When I use the build designator for "ABVending" at (148, 155)
    Then a blueprint for "ABVending" is at (148, 155)
    And Ancient Buildings Renew: the blueprint for "ABVending" at (148, 155) has storage settings
    When a "ABVending" is built at (150, 155)
    Then Ancient Buildings Renew: the "ABVending" at (150, 155) offers the command that links its storage settings

  Scenario: a meal on the machine does not deteriorate and the same meal on the ground does
    Given the save "test-colony" is loaded
    When a "ABVending" is built at (142, 155)
    And I spawn a "MealSimple" at (142, 155)
    And I spawn a "MealSimple" at (144, 155)
    Then Ancient Buildings Renew: the "MealSimple" at (142, 155) does not deteriorate
    And Ancient Buildings Renew: the "MealSimple" at (144, 155) deteriorates
