# The claims of TESTING.md that are a value of the def as the game loaded it, asked of the def.
#
# The barrier gives cover by its fill percent and lets pawns walk over it by its passability; the fence
# counts as a fence for an animal pen by its isFence flag and offers the pen marker and the gate as related
# commands; the stove short-circuits in rain by a flag of its power component. None of it is code of this mod:
# it is the vanilla behaviour the def switches on, so the def is what is under test.
Feature: the defs switch on the vanilla behaviour the mod promises

  Scenario: the barrier gives cover and can be walked over
    Given the main menu is open
    Then Ancient Buildings Renew: the def "ConcreteBarrier" has a fill percent of 0.5
    And Ancient Buildings Renew: the def "ConcreteBarrier" lets pawns walk over it

  Scenario: the fence is a fence for a pen and offers the marker and the gate
    Given the main menu is open
    Then Ancient Buildings Renew: the def "ConFence" counts as a fence for an animal pen
    And Ancient Buildings Renew: the def "ConFence" offers the related build command "PenMarker"
    And Ancient Buildings Renew: the def "ConFence" offers the related build command "FenceGate"

  Scenario: the stove short-circuits in rain
    Given the main menu is open
    Then Ancient Buildings Renew: the def "ABKitchenstove" short-circuits in rain
