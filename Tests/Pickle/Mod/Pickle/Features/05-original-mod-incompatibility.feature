# A pass of its own: this file plays only when the original mod (Workshop 2566355159) is staged, with
#
#   Run-PickleWsl.ps1 -Mod AncientBuildingsRenew -DepMap wsl-deps.incompat-original.map `
#     -Filter '05-original-mod-incompatibility'
#
# and is skipped by requirement in every other pass, where it counts as skipped and not as passed.
#
# About.xml declares the two incompatible because they define the same five defNames (read from the original's
# Defs in the Workshop cache on 2026-09-25: ABKitchenstove, ABVending, AB_Lamppost, ConFence, ConcreteBarrier).
# The first run showed that RimWorld does not log those duplicates at all: both mods load, one copy of each
# def wins, and nothing in the log says so. So the game gives no duplicate line to assert.
#
# What the log does show is the original's own defect, which is the reason the port exists: the original's
# fence still declares the field RimWorld 1.4 deleted, and the game reports it when it reads that def. That
# error is asserted, and it goes red the day the original is updated, which is the day the incompatibleWith
# line can be reconsidered. It also proves the original's defs were really read next to ours.
#
# It starts from the main menu, not from a save: the defs are read while the game loads. The tag below stops
# the error it is about from failing the scenario on its own account.
@requires:ancientbld.core @allow-errors
Feature: the declared incompatibility with the original mod is still true

  Scenario: the original mod loads beside this one and still carries the field 1.6 removed
    Given the main menu is open
    Then mod "ancientbld.core" is loaded
    And mod "nelim.ancientbuildingsrenew" is loaded
    And Ancient Buildings Renew: an error or a warning was logged naming "placingDraggableDimensions" and "ThingDef"
