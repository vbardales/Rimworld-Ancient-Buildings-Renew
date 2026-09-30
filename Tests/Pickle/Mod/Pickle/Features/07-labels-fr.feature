# The French twin of 06: the same six defs, read in a game started in French (-Language French). A label that
# is still English here is a translation the game did not apply, whatever the offline inventory says: a
# language folder the game does not find fails silently, and the offline check only proves the keys resolve.
# Generated from Mod/Languages/French on 2026-09-24. Played only in the French pass.
@fr-only
Feature: the French labels and descriptions reach the loaded definitions

  Scenario: the labels a player reads in the build menus
    Given the main menu is open
    Then def "ConFence" field "label" is "clôture en béton"
    And def "ConcreteBarrier" field "label" is "barrière en béton"
    And def "AB_Lamppost" field "label" is "lampadaire"
    And def "ABVending" field "label" is "distributeur automatique"
    And def "ABKitchenstove" field "label" is "cuisinière simple"
    And def "AB_AirConditioner" field "label" is "climatiseur antique"

  Scenario: the descriptions a player reads in the information windows
    Given the main menu is open
    Then def "ConFence" field "description" is "Une clôture en béton."
    And def "ConcreteBarrier" field "description" is "Une barrière destinée à canaliser la circulation, qui offre aussi un couvert contre les tirs."
    And def "AB_Lamppost" field "description" is "Un lampadaire qui permet d'y voir dans l'obscurité. Il fonctionne à l'énergie solaire, ce qui allège le réseau électrique."
    And def "ABVending" field "description" is "Un simple distributeur automatique, modifié pour y ranger des repas et des ingrédients."
    And def "ABKitchenstove" field "description" is "Une simple plaque de cuisson pour préparer les repas."
    And def "AB_AirConditioner" field "description" is "Un climatiseur récupéré qui s'encastre dans un mur. L'air frais sort d'un côté, tandis que l'air chaud est expulsé de l'autre. Plus ancien et plus rudimentaire qu'un climatiseur moderne, il consomme davantage d'électricité et évacue moins de chaleur, mais se construit plus vite et avec moins de matériaux."
