# The stove's two baby-food recipes, which the port added under MayRequire Biotech because the recipe list was
# the vanilla stove's as it stood in 1.3. With Biotech they have to be there and usable. The bill step adds a
# bill only if the bench's recipe list holds the recipe, and stops the scenario with the list it does hold
# when it does not, so a stove that lost the two recipes fails here, not silently.
#
# Skipped by requirement in a pass without Biotech, where it counts as skipped and not as passed; the other
# half is 04-stove-without-biotech.
@save @requires:Ludeon.RimWorld.Biotech
Feature: with Biotech the stove can cook baby food

  Scenario: both baby-food recipes can be queued, beside an ordinary meal
    Given the save "test-colony" is loaded
    And a "ABKitchenstove" is built at (152, 155)
    When I add bill "CookMealSimple" to the "ABKitchenstove"
    And I add bill "Make_BabyFood" to the "ABKitchenstove"
    And I add bill "Make_BabyFoodBulk" to the "ABKitchenstove"
    Then the "ABKitchenstove" has 3 bills
    And no errors were logged
