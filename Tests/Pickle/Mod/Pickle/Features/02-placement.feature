# The designators of the mod's own buildings accept them on an open map: the placement rules run, the
# blueprints land. It covers what the port changed on the vending machine, a storage building that had no
# Blueprint_Storage and no storage group before 1.4, and what the fence and the barrier share with the game's
# other defences.
#
# @save: it loads test-colony, which was written with every DLC active, so it is not played in the pass that
# leaves Biotech out. The cells are the ones Adaptive Storage Neolithic's suite already places on this same
# fixture. The lamppost and the air conditioner are left out: the lamppost refuses to be placed under a roof,
# and which cells of this map are roofed is not known; the air conditioner has to stand in a wall.
@save
Feature: the mod's buildings can be placed on an open map

  Scenario: the fence, the barrier, the vending machine and the stove accept a blueprint
    Given the save "test-colony" is loaded
    When I use the build designator for "ConFence" at (140, 155)
    And I use the build designator for "ConcreteBarrier" at (144, 155)
    And I use the build designator for "ABVending" at (148, 155)
    And I use the build designator for "ABKitchenstove" at (152, 155)
    Then a blueprint for "ConFence" is at (140, 155)
    And a blueprint for "ConcreteBarrier" is at (144, 155)
    And a blueprint for "ABVending" is at (148, 155)
    And a blueprint for "ABKitchenstove" is at (152, 155)
    And no errors were logged
