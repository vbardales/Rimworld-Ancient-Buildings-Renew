# Workshop gallery captures, on Nelim's zen meadow screenshot studio (PickleTools/ScreenshotStudio), not on
# the bare test-colony fixture 08 and 09 already used. PUBLICATION.md decides the final order and which
# capture is used; this pass only produces candidates for the owner to look at.
#
# Everything is built near the "display" camera preset (125,96, "empty indoor demonstration stage" per the
# studio's own README), the one preset documented as clear: the others carry the studio's props and are not
# safe to build on blind. First pass: the two candidates already proven on test-colony (08, 09), to see
# where these coordinates land before adding the wall-cooling and vending-link candidates in a follow-up.
#
# Diagnostic, 2026-09-29: the first run's captures (evidence/15-gallery) were both unusable as gallery
# images. The fence was only a blueprint (the shipped drag step ends at DesignateMultiCell, which never
# finishes construction; feature 08 has the same limit, and is a functional proof, not a gallery source).
# And neither capture used the studio's presentation mode, so both show the colonist bar, the alert list
# and the bottom command bar. Fixed: the fence is now built segment by segment with the shipped "is built
# at" step (a complete Thing, the same one 09's lamppost scenario already used), and both scenarios enable
# "Nelim's Pickle Tools: studio presentation mode is enabled" before the screenshot.
Feature: gallery captures on the screenshot studio

  @save @review
  Scenario: the concrete fence laid as a line, on the studio
    Given the save "nelim-zen-meadow-studio" is loaded
    And game speed is paused
    When a "ConFence" is built at (118, 92)
    And a "ConFence" is built at (120, 92)
    And a "ConFence" is built at (122, 92)
    And a "ConFence" is built at (124, 92)
    And a "ConFence" is built at (126, 92)
    And a "ConFence" is built at (127, 92)
    And Nelim's Pickle Tools: studio presentation mode is enabled
    And I move the camera to (122, 92)
    And I zoom all the way in
    And I take a screenshot "gallery: the concrete fence, laid as a line"

  @save @review
  Scenario: the lamppost lit at night, with no conduit, on the studio
    Given the save "nelim-zen-meadow-studio" is loaded
    And game speed is paused
    And I set the hour to 2
    And I wait 120 ticks
    When a "AB_Lamppost" is built at (125, 94)
    And I wait 120 ticks
    Then Ancient Buildings Renew: the "AB_Lamppost" at (125, 94) is glowing
    And Nelim's Pickle Tools: studio presentation mode is enabled
    When I move the camera to (125, 94)
    And I zoom all the way in
    And I take a screenshot "gallery: the lamppost at night, with no conduit"
