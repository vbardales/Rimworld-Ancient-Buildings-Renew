# The air conditioner in a wall, cooling one side and heating the other, asked of the game's own
# temperature simulation.
#
# First written 2026-09-27 with two bare roofed cells and no enclosing walls: the roof held long enough
# for the designator check of `09` but not for this scenario's wait, and the replay read "roofed=False"
# at the check. RimWorld's room system does not keep a roof that is not part of an actual enclosed room:
# an unenclosed forced roof is stripped when the regions recompute. Fixed by building two real one-cell
# rooms, walled on every side, with the air conditioner itself as the shared wall between them (it is
# Impassable and blockWind, like the def's own comment on its use in the open says).
#
# The replay after that fix read "roofed=True" (the room holds), but the cooled side read 21.6C against a
# bound of "below 18": CompProperties_TempControl cools toward a target temperature, defaulted around 21C
# like the vanilla cooler's own default, not indefinitely. 18 was never reachable. The bounds below are set
# against the outdoor temperature the run itself reported (22.6-22.7C), not a number picked from nowhere.
#
# The replay after that (343c) read 21.6C on BOTH sides, the exact value the cooled side had read before: a
# coincidence that reads like the two rooms are really one. A direct check of the game's own room system
# (CompTempControl exchanges heat between rooms, not between fixed cells) now runs before the wait, so a
# merged room fails with its own clear message instead of a numeric coincidence.
#
# The unit is powered directly (Ancient Buildings Renew: ... is powered on), bypassing the grid: this
# scenario is about the two sides of the unit, not about power reaching it.
Feature: the air conditioner cools one side of a wall and heats the other

  @save @review
  Scenario: the air conditioner cools the room it faces and warms the other
    Given the save "test-colony" is loaded
    And a "Wall" is built at (139, 150)
    And a "Wall" is built at (140, 150)
    And a "Wall" is built at (141, 150)
    And a "Wall" is built at (142, 150)
    And a "Wall" is built at (143, 150)
    And a "Wall" is built at (144, 150)
    And a "Wall" is built at (145, 150)
    And a "Wall" is built at (139, 152)
    And a "Wall" is built at (140, 152)
    And a "Wall" is built at (141, 152)
    And a "Wall" is built at (142, 152)
    And a "Wall" is built at (143, 152)
    And a "Wall" is built at (144, 152)
    And a "Wall" is built at (145, 152)
    And a "Wall" is built at (139, 151)
    And a "Wall" is built at (145, 151)
    And a "AB_AirConditioner" is built at (142, 151)
    And Ancient Buildings Renew: a constructed roof covers (140, 151)
    And Ancient Buildings Renew: a constructed roof covers (141, 151)
    And Ancient Buildings Renew: a constructed roof covers (143, 151)
    And Ancient Buildings Renew: a constructed roof covers (144, 151)
    Then Ancient Buildings Renew: (141, 151) and (144, 151) are in different rooms
    When Ancient Buildings Renew: the "AB_AirConditioner" at (142, 151) is powered on
    And I wait 2500 ticks
    Then the temperature at (141, 151) is below 22
    And the temperature at (144, 151) is above 23
    When I move the camera to (142, 151)
    And I zoom all the way in
    And I take a screenshot "the air conditioner cooling one side of a wall"
