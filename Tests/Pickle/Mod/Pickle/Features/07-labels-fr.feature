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
    And def "AB_AirConditioner" field "label" is "vieux climatiseur"

  Scenario: the descriptions a player reads in the information windows
    Given the main menu is open
    Then def "ConFence" field "description" is "Une clôture faite de béton."
    And def "ConcreteBarrier" field "description" is "Un dispositif de gestion du trafic qui offre aussi un abri contre les tirs."
    And def "AB_Lamppost" field "description" is "Un dispositif de gestion du trafic qui permet d'y voir quand il fait sombre. Celui-ci fonctionne à l'énergie solaire, ce qui soulage d'autant le réseau électrique."
    And def "ABVending" field "description" is "Un simple distributeur automatique, modifié pour y ranger des repas et de quoi cuisiner."
    And def "ABKitchenstove" field "description" is "Une simple plaque de cuisson pour préparer les repas."
    And def "AB_AirConditioner" field "description" is "Un groupe de froid récupéré, qui s'encastre dans un mur. L'air frais sort d'un côté, l'air chaud de l'autre. Plus vieux et plus fruste qu'un climatiseur moderne : il consomme davantage et déplace moins de chaleur, mais il se monte plus vite et avec moins."
