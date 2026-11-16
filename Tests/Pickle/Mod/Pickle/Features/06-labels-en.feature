# The English text as the loaded defs hold it, read in a game started in English. It comes from the Def
# values themselves, which is where English lives for this mod: there is no English language folder, and none
# is needed. Generated from Mod/Defs on 2026-09-24, so these are the strings the offline inventory compared
# against the 12 French keys. Played only in the English passes; the French twin is 07.
@en-only
Feature: the English labels and descriptions reach the loaded definitions

  Scenario: the labels a player reads in the build menus
    Given the main menu is open
    Then def "ConFence" field "label" is "concrete fence"
    And def "ConcreteBarrier" field "label" is "concrete barrier"
    And def "AB_Lamppost" field "label" is "lamppost"
    And def "ABVending" field "label" is "vending machine"
    And def "ABKitchenstove" field "label" is "simple kitchen stove"
    And def "AB_AirConditioner" field "label" is "ancient air conditioner"

  Scenario: the descriptions a player reads in the information windows
    Given the main menu is open
    Then def "ConFence" field "description" is "A fence made of concrete."
    And def "ConcreteBarrier" field "description" is "A traffic-management solution that also provides cover from gunfire."
    And def "AB_Lamppost" field "description" is "A traffic-management solution that provides light in dark environments. This one runs on solar energy, helping to free up the power grid."
    And def "ABVending" field "description" is "A simple vending machine modified to store meals and other cooking ingredients."
    And def "ABKitchenstove" field "description" is "A simple stovetop for cooking meals."
    And def "AB_AirConditioner" field "description" is "A salvaged air-cooling unit that fits into a wall. Cool air comes out one side, while hot exhaust comes out the other. Older and cruder than a modern cooler: it uses more power and moves less heat, but it is quicker to build with fewer materials."
