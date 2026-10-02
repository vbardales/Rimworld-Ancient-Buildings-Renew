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
# Fifth version (2026-10-02, run 5da9 read): the studio actor Miel stands at the camera cell (154, 98) and
# walked into every capture, once on the air conditioner itself. All cells are now six cells north (z + 6).
#
# Zoom: Pickle's "I zoom all the way in" clamps at root size 12 (CameraSteps.CloseSize, read by the Pickle Tools
# session 2026-10-02), about 45 px a cell. These scenes ask the camera for 6 directly, wait 90 frames inside that step (the zoom is
# smoothed), take the screenshot, and only then assert the size read, so a game that bounds the zoom still gives
# its capture and the failure message gives the value.
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
    When a "ConcreteBarrier" is built at (148, 106)
    And a "ConcreteBarrier" is built at (149, 106)
    And a "ConcreteBarrier" is built at (150, 106)
    And a "ConcreteBarrier" is built at (151, 106)
    And a "ConcreteBarrier" is built at (152, 106)
    And a "ConFence" is built at (148, 104)
    And a "ConFence" is built at (149, 104)
    And a "ConFence" is built at (150, 104)
    And a "ConFence" is built at (151, 104)
    And a "ConFence" is built at (152, 104)
    And a "ConFence" is built at (153, 104)
    And a "AB_Lamppost" is built at (156, 105)
    And a "ABVending" is built at (158, 105)
    And I spawn a "MealSimple" at (158, 105)
    And a "ABKitchenstove" is built at (160, 105)
    And a "Wall" is built at (148, 101)
    And a "Wall" is built at (149, 101)
    And a "AB_AirConditioner" is built at (150, 101)
    And a "Wall" is built at (151, 101)
    And a "Wall" is built at (152, 101)
    And Nelim's Pickle Tools: studio presentation mode is enabled
    And I move the camera to (154, 104)
    And Ancient Buildings Renew: the camera root size is set to 6
    And I take a screenshot "gallery: the six buildings together, in daylight"
    Then Ancient Buildings Renew: the camera root size is 6

  @save @review
  Scenario: the concrete fence and barrier laid as lines, in daylight, on the studio
    Given the save "nelim-zen-meadow-studio" is loaded
    And game speed is paused
    And I set the hour to 12
    And I wait 120 ticks
    When a "ConFence" is built at (150, 105)
    And a "ConFence" is built at (151, 105)
    And a "ConFence" is built at (152, 105)
    And a "ConFence" is built at (153, 105)
    And a "ConFence" is built at (154, 105)
    And a "ConFence" is built at (155, 105)
    And a "ConFence" is built at (156, 105)
    And a "ConFence" is built at (157, 105)
    And a "ConFence" is built at (158, 105)
    And a "ConFence" is built at (159, 105)
    And a "ConcreteBarrier" is built at (150, 102)
    And a "ConcreteBarrier" is built at (151, 102)
    And a "ConcreteBarrier" is built at (152, 102)
    And a "ConcreteBarrier" is built at (153, 102)
    And a "ConcreteBarrier" is built at (154, 102)
    And a "ConcreteBarrier" is built at (155, 102)
    And a "ConcreteBarrier" is built at (156, 102)
    And a "ConcreteBarrier" is built at (157, 102)
    And a "ConcreteBarrier" is built at (158, 102)
    And a "ConcreteBarrier" is built at (159, 102)
    And Nelim's Pickle Tools: studio presentation mode is enabled
    And I move the camera to (154, 103)
    And Ancient Buildings Renew: the camera root size is set to 6
    And I take a screenshot "gallery: the concrete fence and barrier, laid as lines"
    Then Ancient Buildings Renew: the camera root size is 6

  @save @review
  Scenario: the lamppost lit at night, with no conduit, on the studio
    Given the save "nelim-zen-meadow-studio" is loaded
    And game speed is paused
    And I set the hour to 2
    And I wait 120 ticks
    When a "ConcreteBarrier" is built at (151, 102)
    And a "ConcreteBarrier" is built at (152, 102)
    And a "ConcreteBarrier" is built at (153, 102)
    And a "ConcreteBarrier" is built at (154, 102)
    And a "ConcreteBarrier" is built at (155, 102)
    And a "ConcreteBarrier" is built at (156, 102)
    And a "ConcreteBarrier" is built at (157, 102)
    And a "ConFence" is built at (151, 106)
    And a "ConFence" is built at (152, 106)
    And a "ConFence" is built at (153, 106)
    And a "ConFence" is built at (154, 106)
    And a "ConFence" is built at (155, 106)
    And a "ConFence" is built at (156, 106)
    And a "ConFence" is built at (157, 106)
    And a "AB_Lamppost" is built at (154, 104)
    And I wait 120 ticks
    Then Ancient Buildings Renew: the "AB_Lamppost" at (154, 104) is glowing
    And Nelim's Pickle Tools: studio presentation mode is enabled
    And I move the camera to (154, 104)
    And Ancient Buildings Renew: the camera root size is set to 6
    And I take a screenshot "gallery: the lamppost at night, with no conduit"
    Then Ancient Buildings Renew: the camera root size is 6

  @save @review
  Scenario: the vending machine with its meals and the one-tile stove, in daylight, on the studio
    Given the save "nelim-zen-meadow-studio" is loaded
    And game speed is paused
    And I set the hour to 12
    And I wait 120 ticks
    When a "ABKitchenstove" is built at (152, 104)
    And a "ABVending" is built at (154, 104)
    And I spawn a "MealSimple" at (154, 104)
    And I spawn a "MealSimple" at (154, 104)
    And Nelim's Pickle Tools: studio presentation mode is enabled
    And I move the camera to (153, 104)
    And Ancient Buildings Renew: the camera root size is set to 6
    And I take a screenshot "gallery: the vending machine and the kitchen stove"
    Then Ancient Buildings Renew: the camera root size is 6

  @save @review
  Scenario: the ancient air conditioner in a wall, in daylight, on the studio
    Given the save "nelim-zen-meadow-studio" is loaded
    And game speed is paused
    And I set the hour to 12
    And I wait 120 ticks
    When a "Wall" is built at (152, 104)
    And a "Wall" is built at (153, 104)
    And a "AB_AirConditioner" is built at (154, 104)
    And a "Wall" is built at (155, 104)
    And a "Wall" is built at (156, 104)
    And Nelim's Pickle Tools: studio presentation mode is enabled
    And I move the camera to (154, 104)
    And Ancient Buildings Renew: the camera root size is set to 6
    And I take a screenshot "gallery: the ancient air conditioner in a wall"
    Then Ancient Buildings Renew: the camera root size is 6
