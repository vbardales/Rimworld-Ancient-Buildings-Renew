# The air conditioner in a wall, cooling one side and heating the other, asked of the game's own
# temperature simulation. Written 2026-09-27, not yet played: the exact wording of the shipped
# temperature step is unconfirmed here, and so is whether two open-air roofed cells, without a full
# room, are enough for the simulation to settle in the wait given. If either is wrong, the first replay
# says so and this scenario is fixed like any other, one ticket at a time.
#
# The unit is powered directly (Ancient Buildings Renew: ... is powered on), bypassing the grid: this
# scenario is about the two sides of the unit, not about power reaching it.
Feature: the air conditioner cools one side of a wall and heats the other

  @save @review
  Scenario: the air conditioner cools the roofed side it faces and warms the other
    Given the save "test-colony" is loaded
    And Ancient Buildings Renew: a constructed roof covers (141, 150)
    And Ancient Buildings Renew: a constructed roof covers (141, 152)
    And a "Wall" is built at (141, 151)
    And a "AB_AirConditioner" is built at (141, 151)
    When Ancient Buildings Renew: the "AB_AirConditioner" at (141, 151) is powered on
    And I wait 2500 ticks
    Then the temperature at (141, 150) is below 18
    And the temperature at (141, 152) is above 18
    When I move the camera to (141, 151)
    And I zoom all the way in
    And I take a screenshot "the air conditioner cooling one side of a wall"
