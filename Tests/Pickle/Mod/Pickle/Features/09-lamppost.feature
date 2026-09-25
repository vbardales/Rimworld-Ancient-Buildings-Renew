# The lamppost's three claims, asked of the game: it refuses a roof, it lights the ground around it with no
# power at all, and it needs nothing to keep lighting it.
#
# The refusal is the designator's own answer for a roofed cell, given as the translation key of the message a
# player reads. The light is measured on the game's glow grid, on a cell two squares from the lamp, at two in
# the morning, before the lamp exists and after it does, so a bright test map cannot pass it by itself.
# The absence of a power and of a flick component is read from the def: that is what makes it solar.
Feature: the lamppost is solar, and stays outdoors

  Scenario: the lamppost carries a glower and nothing that could switch it off
    Given the main menu is open
    Then Ancient Buildings Renew: the def "AB_Lamppost" carries a component of class "CompProperties_Glower"
    And Ancient Buildings Renew: the def "AB_Lamppost" carries no component of class "CompProperties_Power"
    And Ancient Buildings Renew: the def "AB_Lamppost" carries no component of class "CompProperties_Flickable"

  @save
  Scenario: the lamppost refuses a roofed cell and accepts an open one
    Given the save "test-colony" is loaded
    And Ancient Buildings Renew: a constructed roof covers (140, 155)
    Then Ancient Buildings Renew: the build designator for "AB_Lamppost" refuses (140, 155) saying the text of "MustPlaceUnroofed"
    And Ancient Buildings Renew: the build designator for "AB_Lamppost" accepts (146, 155)

  @save @review
  Scenario: the lamppost lights the ground around it at night, with no power
    Given the save "test-colony" is loaded
    And I set the hour to 2
    And I wait 120 ticks
    Then Ancient Buildings Renew: the light on the ground at (148, 155) is below 0.4
    When a "AB_Lamppost" is built at (146, 155)
    And I wait 120 ticks
    Then Ancient Buildings Renew: the "AB_Lamppost" at (146, 155) is glowing
    And Ancient Buildings Renew: the light on the ground at (148, 155) is above 0.5
    When I move the camera to (146, 155)
    And I zoom all the way in
    And I take a screenshot "the lamppost at night, with no conduit"
