# The loaded-game half of what TESTING.md asks a person to read from Player.log.
#
# No save is loaded, on purpose. The errors this mod can produce are logged while the defs load, before any
# scenario is armed, and Pickle's own "no errors were logged" only sees what is logged after it is armed, so
# it would pass on a mod that failed to load. These scenarios read RimWorld's own log instead, through the
# suite's two local steps (Source/LoggedMessageSteps.cs), and they need no map, which also lets this file
# play in the pass that leaves Biotech out.
#
# Played in every pass but the incompatibility one, where two mods define the same defs on purpose.
Feature: the mod loads clean and defines its six buildings

  Scenario: the mod is loaded and its six buildings exist
    Given the main menu is open
    Then mod "nelim.ancientbuildingsrenew" is loaded
    And def "ConFence" of type "ThingDef" exists
    And def "ConcreteBarrier" of type "ThingDef" exists
    And def "AB_Lamppost" of type "ThingDef" exists
    And def "ABVending" of type "ThingDef" exists
    And def "ABKitchenstove" of type "ThingDef" exists
    And def "AB_AirConditioner" of type "ThingDef" exists

  Scenario: nothing logged while the defs loaded names one of them
    Given the main menu is open
    Then Ancient Buildings Renew: nothing logged as an error or a warning names "ConFence"
    And Ancient Buildings Renew: nothing logged as an error or a warning names "ConcreteBarrier"
    And Ancient Buildings Renew: nothing logged as an error or a warning names "AB_Lamppost"
    And Ancient Buildings Renew: nothing logged as an error or a warning names "ABVending"
    And Ancient Buildings Renew: nothing logged as an error or a warning names "ABKitchenstove"
    And Ancient Buildings Renew: nothing logged as an error or a warning names "AB_AirConditioner"

  Scenario: the mod's own identifier appears in no error or warning
    Given the main menu is open
    Then Ancient Buildings Renew: nothing logged as an error or a warning names "nelim.ancientbuildingsrenew"
    And no warnings from mod "nelim.ancientbuildingsrenew"

  # The one defect this port exists to fix, in its loaded form. The fence declared a field RimWorld 1.4
  # deleted, and the game loaded it with nothing set: it built, it looked right, and it could not be dragged
  # into a line. Its draw style category is what makes it draggable, and when the field is not read it
  # comes back as "(null)". This asserts the loaded value, not the drag itself: the drag needs a real
  # pointer and stays a manual scenario in TESTING.md, because the shipped "I designate" step places
  # blueprints cell by cell and would pass on a fence that could not be dragged.
  Scenario: the fence and the barrier carry the draw style that makes them draggable
    Given the main menu is open
    Then def "ConFence" field "drawStyleCategory" is "Defenses"
    And def "ConcreteBarrier" field "drawStyleCategory" is "Defenses"
