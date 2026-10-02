# Workshop gallery captures on Nelim's zen meadow screenshot studio (PickleTools/ScreenshotStudio), not on the
# bare test-colony fixture 08 and 09 used. PUBLICATION.md decides the final order and which captures go up;
# this pass only produces candidates for the owner to look at.
#
# History. First run (2026-09-29): both captures unusable (fence only a blueprint, interface still drawn).
# Second (2026-10-01): fence built on every second cell, a few dark stubs. Third (d99a): ten contiguous
# cells, a real line, but built in the studio's "display" room, which is roofed and dark: dark brown fence
# on a dark floor, low contrast. So everything below is built OUTDOORS in the open glade of the "flowers"
# preset (camera cell 154,98, daylight) at hour 12, except the lamppost, which is shot at hour 2 on the same
# glade. The owner asked (2026-10-02) for the scenarios that seem relevant to be written; this is the
# session's choice of five, and she orders them.
#
# Not here, on purpose: the wall cooling (its proof is a temperature, a still shows two plain rooms; 13 keeps
# it), and the French (a still cannot show wording better than the text does).
#
# Cells are a guess at what is free in the glade; a cell holding a plant or a prop is the first thing to
# check on a failed run. Zoom is the game's maximum ("zoom all the way in"): to make a thing look bigger
# the composition has to be tight, not the zoom higher.
Feature: gallery captures on the screenshot studio

  @save @review
  Scenario: the six buildings together, in daylight, on the studio
    Given the save "nelim-zen-meadow-studio" is loaded
    And game speed is paused
    And I set the hour to 12
    And I wait 120 ticks
    When a "ConcreteBarrier" is built at (148, 100)
    And a "ConcreteBarrier" is built at (149, 100)
    And a "ConcreteBarrier" is built at (150, 100)
    And a "ConcreteBarrier" is built at (151, 100)
    And a "ConcreteBarrier" is built at (152, 100)
    And a "ConFence" is built at (148, 98)
    And a "ConFence" is built at (149, 98)
    And a "ConFence" is built at (150, 98)
    And a "ConFence" is built at (151, 98)
    And a "ConFence" is built at (152, 98)
    And a "ConFence" is built at (153, 98)
    And a "AB_Lamppost" is built at (156, 99)
    And a "ABVending" is built at (158, 99)
    And I spawn a "MealSimple" at (158, 99)
    And a "ABKitchenstove" is built at (160, 99)
    And a "Wall" is built at (148, 95)
    And a "Wall" is built at (149, 95)
    And a "AB_AirConditioner" is built at (150, 95)
    And a "Wall" is built at (151, 95)
    And a "Wall" is built at (152, 95)
    And Nelim's Pickle Tools: studio presentation mode is enabled
    And I move the camera to (154, 98)
    And I zoom all the way in
    And I take a screenshot "gallery: the six buildings together, in daylight"

  @save @review
  Scenario: the concrete fence and barrier laid as lines, in daylight, on the studio
    Given the save "nelim-zen-meadow-studio" is loaded
    And game speed is paused
    And I set the hour to 12
    And I wait 120 ticks
    When a "ConFence" is built at (150, 99)
    And a "ConFence" is built at (151, 99)
    And a "ConFence" is built at (152, 99)
    And a "ConFence" is built at (153, 99)
    And a "ConFence" is built at (154, 99)
    And a "ConFence" is built at (155, 99)
    And a "ConFence" is built at (156, 99)
    And a "ConFence" is built at (157, 99)
    And a "ConFence" is built at (158, 99)
    And a "ConFence" is built at (159, 99)
    And a "ConcreteBarrier" is built at (150, 96)
    And a "ConcreteBarrier" is built at (151, 96)
    And a "ConcreteBarrier" is built at (152, 96)
    And a "ConcreteBarrier" is built at (153, 96)
    And a "ConcreteBarrier" is built at (154, 96)
    And a "ConcreteBarrier" is built at (155, 96)
    And a "ConcreteBarrier" is built at (156, 96)
    And a "ConcreteBarrier" is built at (157, 96)
    And a "ConcreteBarrier" is built at (158, 96)
    And a "ConcreteBarrier" is built at (159, 96)
    And Nelim's Pickle Tools: studio presentation mode is enabled
    And I move the camera to (154, 97)
    And I zoom all the way in
    And I take a screenshot "gallery: the concrete fence and barrier, laid as lines"

  @save @review
  Scenario: the lamppost lit at night, with no conduit, on the studio
    Given the save "nelim-zen-meadow-studio" is loaded
    And game speed is paused
    And I set the hour to 2
    And I wait 120 ticks
    When a "ConcreteBarrier" is built at (151, 96)
    And a "ConcreteBarrier" is built at (152, 96)
    And a "ConcreteBarrier" is built at (153, 96)
    And a "ConcreteBarrier" is built at (154, 96)
    And a "ConcreteBarrier" is built at (155, 96)
    And a "ConcreteBarrier" is built at (156, 96)
    And a "ConcreteBarrier" is built at (157, 96)
    And a "ConFence" is built at (151, 100)
    And a "ConFence" is built at (152, 100)
    And a "ConFence" is built at (153, 100)
    And a "ConFence" is built at (154, 100)
    And a "ConFence" is built at (155, 100)
    And a "ConFence" is built at (156, 100)
    And a "ConFence" is built at (157, 100)
    And a "AB_Lamppost" is built at (154, 98)
    And I wait 120 ticks
    Then Ancient Buildings Renew: the "AB_Lamppost" at (154, 98) is glowing
    And Nelim's Pickle Tools: studio presentation mode is enabled
    And I move the camera to (154, 98)
    And I zoom all the way in
    And I take a screenshot "gallery: the lamppost at night, with no conduit"

  @save @review
  Scenario: the vending machine with its meals and the one-tile stove, in daylight, on the studio
    Given the save "nelim-zen-meadow-studio" is loaded
    And game speed is paused
    And I set the hour to 12
    And I wait 120 ticks
    When a "ABKitchenstove" is built at (152, 98)
    And a "ABVending" is built at (154, 98)
    And I spawn a "MealSimple" at (154, 98)
    And I spawn a "MealSimple" at (154, 98)
    And Nelim's Pickle Tools: studio presentation mode is enabled
    And I move the camera to (153, 98)
    And I zoom all the way in
    And I take a screenshot "gallery: the vending machine and the kitchen stove"

  @save @review
  Scenario: the ancient air conditioner in a wall, in daylight, on the studio
    Given the save "nelim-zen-meadow-studio" is loaded
    And game speed is paused
    And I set the hour to 12
    And I wait 120 ticks
    When a "Wall" is built at (152, 98)
    And a "Wall" is built at (153, 98)
    And a "AB_AirConditioner" is built at (154, 98)
    And a "Wall" is built at (155, 98)
    And a "Wall" is built at (156, 98)
    And Nelim's Pickle Tools: studio presentation mode is enabled
    And I move the camera to (154, 98)
    And I zoom all the way in
    And I take a screenshot "gallery: the ancient air conditioner in a wall"
