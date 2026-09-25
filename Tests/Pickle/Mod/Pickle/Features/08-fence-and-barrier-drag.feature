# The defect this port exists to fix, played as far as a game with no pointer can play it.
#
# RimWorld 1.4 deleted the field the fence used to be dragged out in a line, and the game loaded the fence
# with nothing set: it built and looked right and could only be placed one cell at a time. The build
# designator a player picks is asked which drawing styles it offers, then a drag is played the way the game
# ends one: the draw style computes the cells between the press and the release and hands them to
# DesignateMultiCell. Only the pointer is missing. If the draw style category did not load, the designator
# offers no style and the scenario fails saying so.
#
# @save: the designator needs a colony to be asked about. The cells are the row the placement feature already
# uses on test-colony. The screenshots are for a person to look at; they assert nothing.
@save @review
Feature: the fence and the barrier can be dragged out in a line

  Scenario: the fence offers a line and lays one in a single drag
    Given the save "test-colony" is loaded
    Then Ancient Buildings Renew: the build designator for "ConFence" offers the drawing style "Line"
    When Ancient Buildings Renew: I drag out the build designator for "ConFence" from (140, 155) to (150, 155) in the Line style
    Then a blueprint for "ConFence" is at (140, 155)
    And a blueprint for "ConFence" is at (145, 155)
    And a blueprint for "ConFence" is at (150, 155)
    When I move the camera to (145, 155)
    And I zoom all the way in
    And I take a screenshot "the fence, laid as a line by one drag"

  Scenario: the barrier offers a line and lays one in a single drag
    Given the save "test-colony" is loaded
    Then Ancient Buildings Renew: the build designator for "ConcreteBarrier" offers the drawing style "Line"
    When Ancient Buildings Renew: I drag out the build designator for "ConcreteBarrier" from (140, 155) to (150, 155) in the Line style
    Then a blueprint for "ConcreteBarrier" is at (140, 155)
    And a blueprint for "ConcreteBarrier" is at (145, 155)
    And a blueprint for "ConcreteBarrier" is at (150, 155)
    When I move the camera to (145, 155)
    And I zoom all the way in
    And I take a screenshot "the barrier, laid as a line by one drag"
