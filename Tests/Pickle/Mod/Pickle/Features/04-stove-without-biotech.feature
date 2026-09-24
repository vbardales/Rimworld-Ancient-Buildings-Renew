# Played only by the pass -DepMap wsl-deps.sans-biotech.map, which leaves Biotech out of ModsConfig. The stove
# lists Make_BabyFood and Make_BabyFoodBulk under MayRequire, and without Biotech those two entries must drop
# out of its recipe list and leave nothing behind: no unresolved recipe, no error naming the stove.
#
# No save is loaded: test-colony was written with every DLC active, and its own errors about missing Biotech
# content would be read as this mod's. What is asserted is the start of the game and its load of the mod. That
# the ordinary meal bills remain usable on the stove needs a map, and stays a manual check in TESTING.md.
#
# Tagged @without-biotech so the passes that keep Biotech leave it out with !@without-biotech: in one of them
# its first line would fail, which is the line that stops a staging accident from passing as this pass.
@without-biotech
Feature: without Biotech the stove's baby-food recipes stay out of the way

  Scenario: Biotech is left out, and so are its recipes
    Given the main menu is open
    Then mod "ludeon.rimworld.biotech" is not loaded
    And mod "nelim.ancientbuildingsrenew" is loaded
    And no def "Make_BabyFood" exists
    And no def "Make_BabyFoodBulk" exists

  Scenario: the stove loaded without an unresolved recipe
    Given the main menu is open
    Then def "ABKitchenstove" of type "ThingDef" exists
    And Ancient Buildings Renew: nothing logged as an error or a warning names "ABKitchenstove"
    And Ancient Buildings Renew: nothing logged as an error or a warning names "Make_BabyFood"
