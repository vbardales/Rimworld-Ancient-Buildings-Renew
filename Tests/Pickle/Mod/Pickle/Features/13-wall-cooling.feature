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
# like the vanilla cooler's own default, not indefinitely. 18 was never reachable. Bounds moved to compare
# against the outdoor temperature the run itself reported.
#
# The replay after that (343c, then 187d with the rooms confirmed genuinely separate by the game's own
# room system) still read 21.6C on both sides: no exchange happened at all. Building_Cooler.TickRare
# (decompiled 2026-09-27) reads the cells to its NORTH and SOUTH, rotated by its own Rotation, never
# east-west: "IntVec3.South.RotatedBy(base.Rotation)" and the same for North. The wall this scenario built
# ran north-south (a column at a fixed x), so the unit's north and south neighbours were its own wall
# cells - impassable, so TickRare's very first check failed silently and did nothing, every tick. The wall
# now runs EAST-WEST instead, with no rotation needed: the unit's default (unrotated) north/south
# neighbours are the two rooms. South is the cooled, target-seeking side; north gets the exhaust
# (Building_Cooler.TickRare: intVec = South, cooled toward target; intVec2 = North, heat pushed into it).
#
# The replay after that (15ec, then 34bb identically) failed on the wait itself: "Step 'And I wait 2500
# ticks' timed out after 5s". That is a per-step wall-clock budget, not a scenario one, and this scenario
# now does more setup (15 buildings, plus the room check) than the ones that reached 2500 ticks in one step
# before. Split into five waits of 500 ticks each: the same total, each comfortably under the step's own
# budget.
#
# The unit is powered directly (Ancient Buildings Renew: ... is powered on), bypassing the grid: this
# scenario is about the two sides of the unit, not about power reaching it.
Feature: the air conditioner cools one side of a wall and heats the other

  @save @review
  Scenario: the air conditioner cools the room south of it and warms the room north of it
    Given the save "test-colony" is loaded
    And a "Wall" is built at (141, 149)
    And a "Wall" is built at (142, 149)
    And a "Wall" is built at (143, 149)
    And a "Wall" is built at (141, 150)
    And a "Wall" is built at (143, 150)
    And a "Wall" is built at (140, 151)
    And a "Wall" is built at (141, 151)
    And a "AB_AirConditioner" is built at (142, 151)
    And a "Wall" is built at (143, 151)
    And a "Wall" is built at (144, 151)
    And a "Wall" is built at (141, 152)
    And a "Wall" is built at (143, 152)
    And a "Wall" is built at (141, 153)
    And a "Wall" is built at (142, 153)
    And a "Wall" is built at (143, 153)
    And Ancient Buildings Renew: a constructed roof covers (142, 150)
    And Ancient Buildings Renew: a constructed roof covers (142, 152)
    Then Ancient Buildings Renew: (142, 150) and (142, 152) are in different rooms
    When Ancient Buildings Renew: the "AB_AirConditioner" at (142, 151) is powered on
    And I wait 500 ticks
    And I wait 500 ticks
    And I wait 500 ticks
    And I wait 500 ticks
    And I wait 500 ticks
    Then the temperature at (142, 152) is below 22
    And the temperature at (142, 150) is above 23
    When I move the camera to (142, 151)
    And I zoom all the way in
    And I take a screenshot "the air conditioner cooling one side of a wall"
