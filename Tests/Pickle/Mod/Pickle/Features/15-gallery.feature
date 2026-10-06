# Workshop gallery of Ancient Buildings Renew: one story, in one place, staged (PUBLISHING.md: every gallery capture is a staged photo).
#
# The story: a day at the last stop of an old road, told by Nelim (the one colonist of the fixture, so Virginie) and Shogun, her labrador.
# Time moves a little between pictures and the place is the same: the calm zone of Nelim's tribe, a cream stone square with no roof and no wall
# shadow (the one neutral light ground among the outdoor places; PickleTools/docs/SANCTUAIRE-LIEUX.md). Each picture takes its own corner of it.
#   1. 06:00  The road comes in: the concrete barrier funnels it, the fence runs beside it. Nelim arrives with Shogun.
#   2. 11:00  The stop: a vending machine with meals in it and the one-tile stove. Nelim cooks, Shogun waits.
#   3. 15:00  The heat of the afternoon: the ancient air conditioner set in a wall, Nelim in the cooled shade (south of the unit).
#   4. 19:00  Dusk: the whole set together, Nelim and Shogun resting among the six buildings.
#   5. 23:00  Night: the lamppost lit, on sunlight it stored, no conduit anywhere.
# Why this place: the places were looked at one by one in docs/SANCTUAIRE-LIEUX.md. The gravel yard is a good road but is full of furniture and lamps;
# the flat open squares (A to J) are dark earth with flowers; the calm zone is clean, level and light, so concrete and a lit lamp read on it.
# Colours: the jacket is a deep teal (28, 98, 104), the complement of the lamp's amber and of the grey concrete, so Nelim stands out in every picture.
# Only daytime animal in the story: a dog, awake at every hour used. Every scenario reloads the save, so the square is fresh, never cleared by hand.
# Nothing asserts about the image: a person opens each one, and a passing scenario says only that the route ran.
@requires:nelim.pickletools.screenshotstudio
@review
Feature: gallery: a day at the last stop of an old road

  Scenario: 1. the road comes in at dawn
    Given the save "Nelims-tribe" is loaded
    And game speed is paused
    And Nelim's Pickle Tools: all animals are removed
    And Nelim's Pickle Tools: I am at the sanctuary "calm-zone"
    And I set the hour to 6
    And I set the weather to "Clear"
    And a "ConcreteBarrier" is built at (196, 190)
    And a "ConcreteBarrier" is built at (197, 190)
    And a "ConcreteBarrier" is built at (198, 190)
    And a "ConcreteBarrier" is built at (199, 190)
    And a "ConcreteBarrier" is built at (200, 190)
    And a "ConcreteBarrier" is built at (201, 190)
    And a "ConcreteBarrier" is built at (202, 190)
    And a "ConcreteBarrier" is built at (203, 190)
    And a "ConcreteBarrier" is built at (204, 190)
    And a "ConFence" is built at (196, 188)
    And a "ConFence" is built at (197, 188)
    And a "ConFence" is built at (198, 188)
    And a "ConFence" is built at (199, 188)
    And a "ConFence" is built at (200, 188)
    And a "ConFence" is built at (201, 188)
    And a "ConFence" is built at (202, 188)
    And a "ConFence" is built at (203, 188)
    And a "ConFence" is built at (204, 188)
    And Nelim's Pickle Tools: "Nelim" wears "Apparel_Jacket" dyed rgb (28, 98, 104)
    And Nelim's Pickle Tools: "Nelim" stands at (200, 185) facing North
    And Nelim's Pickle Tools: an adult animal of kind "LabradorRetriever" named "Shogun" is spawned at (202, 185)
    When I wait 60 ticks
    And Nelim's Pickle Tools: studio presentation mode is enabled
    And Nelim's Pickle Tools: I frame the cell (200, 187) at zoom 7
    Then I take a screenshot "gallery 1 - the road comes in"

  Scenario: 2. the stop at eleven, vending machine and stove
    Given the save "Nelims-tribe" is loaded
    And game speed is paused
    And Nelim's Pickle Tools: all animals are removed
    And Nelim's Pickle Tools: I am at the sanctuary "calm-zone"
    And I set the hour to 11
    And I set the weather to "Clear"
    And a "ABVending" is built at (198, 189)
    And a "ABKitchenstove" is built at (200, 189)
    And I spawn a "MealSimple" at (198, 189)
    And I spawn a "MealSimple" at (198, 189)
    And Nelim's Pickle Tools: "Nelim" wears "Apparel_Jacket" dyed rgb (28, 98, 104)
    And Nelim's Pickle Tools: "Nelim" stands at (199, 187) facing North
    And Nelim's Pickle Tools: an adult animal of kind "LabradorRetriever" named "Shogun" is spawned at (201, 187)
    When I wait 60 ticks
    And Nelim's Pickle Tools: studio presentation mode is enabled
    And Nelim's Pickle Tools: I frame the cell (199, 188) at zoom 7
    Then I take a screenshot "gallery 2 - the vending machine and the stove"

  Scenario: 3. the air conditioner at three
    Given the save "Nelims-tribe" is loaded
    And game speed is paused
    And Nelim's Pickle Tools: all animals are removed
    And Nelim's Pickle Tools: I am at the sanctuary "calm-zone"
    And I set the hour to 15
    And I set the weather to "Clear"
    And a "Wall" is built at (197, 189)
    And a "Wall" is built at (198, 189)
    And a "AB_AirConditioner" is built at (199, 189)
    And a "Wall" is built at (200, 189)
    And a "Wall" is built at (201, 189)
    And Ancient Buildings Renew: the "AB_AirConditioner" at (199, 189) is powered on
    And Nelim's Pickle Tools: "Nelim" wears "Apparel_Jacket" dyed rgb (28, 98, 104)
    And Nelim's Pickle Tools: "Nelim" stands at (199, 187) facing North
    And Nelim's Pickle Tools: an adult animal of kind "LabradorRetriever" named "Shogun" is spawned at (201, 187)
    When I wait 60 ticks
    And Nelim's Pickle Tools: studio presentation mode is enabled
    And Nelim's Pickle Tools: I frame the cell (199, 188) at zoom 7
    Then I take a screenshot "gallery 3 - the air conditioner in a wall"

  Scenario: 4. the six buildings together at dusk
    Given the save "Nelims-tribe" is loaded
    And game speed is paused
    And Nelim's Pickle Tools: all animals are removed
    And Nelim's Pickle Tools: I am at the sanctuary "calm-zone"
    And I set the hour to 19
    And I set the weather to "Clear"
    And a "ConcreteBarrier" is built at (196, 190)
    And a "ConcreteBarrier" is built at (197, 190)
    And a "ConcreteBarrier" is built at (198, 190)
    And a "ConcreteBarrier" is built at (199, 190)
    And a "ConFence" is built at (196, 188)
    And a "ConFence" is built at (197, 188)
    And a "ConFence" is built at (198, 188)
    And a "ConFence" is built at (199, 188)
    And a "AB_Lamppost" is built at (203, 190)
    And a "ABVending" is built at (203, 188)
    And a "ABKitchenstove" is built at (204, 188)
    And a "Wall" is built at (197, 185)
    And a "Wall" is built at (198, 185)
    And a "AB_AirConditioner" is built at (199, 185)
    And a "Wall" is built at (200, 185)
    And a "Wall" is built at (201, 185)

    And I spawn a "MealSimple" at (203, 188)
    And Nelim's Pickle Tools: "Nelim" wears "Apparel_Jacket" dyed rgb (28, 98, 104)
    And Nelim's Pickle Tools: "Nelim" stands at (201, 187) facing West
    And Nelim's Pickle Tools: an adult animal of kind "LabradorRetriever" named "Shogun" is spawned at (202, 186)
    When I wait 60 ticks
    And Nelim's Pickle Tools: studio presentation mode is enabled
    And Nelim's Pickle Tools: I frame the cell (200, 187) at zoom 8
    Then I take a screenshot "gallery 4 - the six buildings together at dusk"

  Scenario: 5. the lamppost at night
    Given the save "Nelims-tribe" is loaded
    And game speed is paused
    And Nelim's Pickle Tools: all animals are removed
    And Nelim's Pickle Tools: I am at the sanctuary "calm-zone"
    And I set the hour to 23
    And I set the weather to "Clear"
    And a "ConcreteBarrier" is built at (197, 185)
    And a "ConcreteBarrier" is built at (198, 185)
    And a "ConcreteBarrier" is built at (199, 185)
    And a "ConcreteBarrier" is built at (200, 185)
    And a "ConcreteBarrier" is built at (201, 185)
    And a "ConcreteBarrier" is built at (202, 185)
    And a "ConcreteBarrier" is built at (203, 185)
    And a "ConFence" is built at (197, 191)
    And a "ConFence" is built at (198, 191)
    And a "ConFence" is built at (199, 191)
    And a "ConFence" is built at (200, 191)
    And a "ConFence" is built at (201, 191)
    And a "ConFence" is built at (202, 191)
    And a "ConFence" is built at (203, 191)
    And a "AB_Lamppost" is built at (200, 188)
    And I wait 120 ticks
    Then Ancient Buildings Renew: the "AB_Lamppost" at (200, 188) is glowing
    And Nelim's Pickle Tools: "Nelim" wears "Apparel_Jacket" dyed rgb (28, 98, 104)
    And Nelim's Pickle Tools: "Nelim" stands at (200, 186) facing North
    And Nelim's Pickle Tools: an adult animal of kind "LabradorRetriever" named "Shogun" is spawned at (202, 186)
    When I wait 60 ticks
    And Nelim's Pickle Tools: studio presentation mode is enabled
    And Nelim's Pickle Tools: I frame the cell (200, 187) at zoom 6
    Then I take a screenshot "gallery 5 - the lamppost at night"
