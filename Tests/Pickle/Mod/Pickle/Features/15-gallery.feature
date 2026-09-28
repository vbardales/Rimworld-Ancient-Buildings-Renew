# Workshop gallery captures, on Nelim's zen meadow screenshot studio (PickleTools/ScreenshotStudio), not on
# the bare test-colony fixture 08 and 09 already used. PUBLICATION.md decides the final order and which
# capture is used; this pass only produces candidates for the owner to look at.
#
# Everything is built near the "display" camera preset (125,96, "empty indoor demonstration stage" per the
# studio's own README), the one preset documented as clear: the others carry the studio's props and are not
# safe to build on blind. First pass: the two candidates already proven on test-colony (08, 09), to see
# where these coordinates land before adding the wall-cooling and vending-link candidates in a follow-up.
Feature: gallery captures on the screenshot studio

  @save @review
  Scenario: the concrete fence and barrier laid as a line, on the studio
    Given the save "nelim-zen-meadow-studio" is loaded
    And game speed is paused
    When Ancient Buildings Renew: I drag out the build designator for "ConFence" from (118, 92) to (127, 92) in the Line style
    When I move the camera to (122, 92)
    And I zoom all the way in
    And I take a screenshot "gallery: the concrete fence, laid as a line by one drag"

  @save @review
  Scenario: the lamppost lit at night, with no conduit, on the studio
    Given the save "nelim-zen-meadow-studio" is loaded
    And game speed is paused
    And I set the hour to 2
    And I wait 120 ticks
    When a "AB_Lamppost" is built at (125, 94)
    And I wait 120 ticks
    Then Ancient Buildings Renew: the "AB_Lamppost" at (125, 94) is glowing
    When I move the camera to (125, 94)
    And I zoom all the way in
    And I take a screenshot "gallery: the lamppost at night, with no conduit"
