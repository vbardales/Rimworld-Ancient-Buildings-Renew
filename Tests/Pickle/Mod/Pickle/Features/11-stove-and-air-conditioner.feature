# The stove's 300 W and its heat, and the air conditioner's research gate, asked of the game.
#
# The stove is a heat pusher that works only when powered, and it draws 300 W: both are read from the def as
# the game loaded it. The air conditioner is hidden from the architect menu until AirConditioning is
# finished, and shown once it is: the designator's own visibility, before and after the research.
Feature: the stove draws its power, and the air conditioner waits for its research

  Scenario: the stove draws 300 W and pushes heat only when powered
    Given the main menu is open
    Then Ancient Buildings Renew: the def "ABKitchenstove" draws 300 watts
    And Ancient Buildings Renew: the def "ABKitchenstove" carries a component of class "CompHeatPusherPowered"
    And Ancient Buildings Renew: the def "ABKitchenstove" carries a component of class "CompProperties_Flickable"

  @save
  Scenario: the air conditioner is hidden until AirConditioning is finished
    Given the save "test-colony" is loaded
    Then Ancient Buildings Renew: the build designator for "AB_AirConditioner" is not available
    Given research "AirConditioning" is finished
    Then Ancient Buildings Renew: the build designator for "AB_AirConditioner" is available

  Scenario: the air conditioner draws 250 W and carries a temperature control
    Given the main menu is open
    Then Ancient Buildings Renew: the def "AB_AirConditioner" draws 250 watts
    And Ancient Buildings Renew: the def "AB_AirConditioner" carries a component of class "CompProperties_TempControl"
