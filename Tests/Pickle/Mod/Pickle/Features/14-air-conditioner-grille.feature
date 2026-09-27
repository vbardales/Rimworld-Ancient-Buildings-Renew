# TESTING.md's own claim about the air conditioner: "rotate it before building and the drawn grille must
# turn with it." That is a drawing, not a value a def-reading step can check (the def comment already says
# why Graphic_Single was chosen: it draws turned to face its rotation). Two units, facing two different
# directions, side by side in one capture, so the owner can see whether the grille really turned - the
# camera and the zoom are a person's judgement, same as every other @review capture in this suite.
Feature: the air conditioner's grille turns with its rotation

  @save @review
  Scenario: two units, facing different directions, side by side
    Given the save "test-colony" is loaded
    When Ancient Buildings Renew: a "AB_AirConditioner" is built at (160, 155) facing North
    And Ancient Buildings Renew: a "AB_AirConditioner" is built at (162, 155) facing East
    And I move the camera to (161, 155)
    And I zoom all the way in
    And I take a screenshot "two air conditioners, facing North and East"
