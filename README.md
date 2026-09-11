# Ancient Buildings Renew

Port of **SyndicateGamingNetwork's "Ancient" Buildings** to RimWorld 1.6.

**I am not the author of this mod.** The buildings, the artwork and the balance are
SyndicateGamingNetwork's — all I did was the work needed to make it run on 1.6, fix what the
port turned up, and write the French. Credit goes to them; mistakes in the port are mine.

Original mod: https://steamcommunity.com/sharedfiles/filedetails/?id=2566355159 — declares 1.3
and nothing further. The page is still online; the mod is abandoned, not withdrawn.

## What the mod does

Six buildings in the style of the ruins the world is already full of. Six `ThingDef`s, no
assembly, no patch, no DLC, no dependency. Five of them ask for no research at all and are
buildable on the first day of a colony.

| Building | Tab | Cost | Notes |
|---|---|---|---|
| **concrete fence** | Structure | 5 metal | Linked. Counts as a fence for animal pens, joins walls and rock, takes a fence gate. |
| **concrete barrier** | Security | 15 metal + 45 steel | Waist-high cover, `fillPercent` 0.5. |
| **lamppost** | Structure | 15 stone + 50 steel | Glow radius 19 and **no power comp at all** — it is solar. Must be built outdoors. |
| **vending machine** | Furniture | 75 steel + 3 components | 1×1 storage, meals by default. Contents do not deteriorate and do not count towards beauty. |
| **simple kitchen stove** | Production | 75 steel + 3 components | 1×1 electric stove, 300 W, the full cooking bill list, construction skill 4. |
| **ancient air conditioner** | Temperature | 70 steel + 2 components | A wall cooler. 250 W, −16 cooling. **Needs the `AirConditioning` research.** The one def here that is not SyndicateGamingNetwork's — see below. |

Available in English and French.

Content mod: removing it mid-save destroys anything already built from it.

## What changed in the 1.6 port

### The one thing that was broken

`ConFence` declared this:

```xml
<placingDraggableDimensions>1</placingDraggableDimensions>
```

RimWorld 1.4 replaced that field with the **draw-style system** and deleted it outright — not
renamed, not aliased. It appears in no def the game ships and in no string of the 1.6
`Assembly-CSharp.dll`.

RimWorld does not stop for an XML element that matches no field: it logs one line and carries on
with the field unset. So the fence would have loaded, built, linked to walls, drawn its blueprint
and looked exactly right — and refused to be dragged into a line, one cell per click, with
nothing on screen to say why. That is the failure mode worth naming, because it does not look
like a failure.

It now carries `<drawStyleCategory>Defenses</drawStyleCategory>`, the category vanilla's own
fence, sandbags and barricade all use.

### Three things time had left behind

Each is a feature the game grew after this mod stopped, and each is a gap rather than a break.

| Def | Added | Why |
|---|---|---|
| `ABVending` | `storageGroupTag` | Storage groups arrived in 1.4. Without a tag, this is the one piece of storage in the game with no *link storage settings* gizmo. Its own tag, not `Shelf`: its fixed filter is wider than a shelf's. |
| `ABVending` | `blueprintClass` = `Blueprint_Storage` | Lets the filter be set on the blueprint, before the machine is built. Every vanilla storage building in 1.6 declares one. |
| `ABKitchenstove` | `Make_BabyFood`, `Make_BabyFoodBulk`, both `MayRequire` Biotech | The bill list is the vanilla electric stove's as it stood in 1.3. Biotech added these two in 1.4; without them a colony whose only stove is this one cannot make baby food. Inert without Biotech. |

### One change that is not a fix

`ConcreteBarrier` never declared the old draggable field either, so it was placed one cell at a
time in 1.3 as well. It is given `Defenses` all the same — every low-cover piece in 1.6 has a
draw style, and a road barrier laid one square per click is a chore the game stopped asking for.
This is the only place the port changes behaviour the original had on purpose, and it is one
line to undo.

### The text

Labels are lower case, as the game writes them and as vanilla's own *electric stove*, *shelf*
and *fence* are written; three of the five were Title Case. Descriptions gained their final full
stops, "dark enviroments" became "dark environments", and French was added.

### What did not change

The stats, the costs, the power draw, the construction skill requirements, the comps, the
storage filters, the link flags and the eight textures the mod ships — and the five `defName`s.

**The balance was not touched**, including where it invites a change. `ABKitchenstove` has no
research prerequisite: it is a 1×1 electric stove, cheaper and quicker to build than vanilla's
3×1, available on day one, where vanilla's needs Electricity. That is the author's design, not a
bug, and gating it would be redesigning the mod rather than porting it. See
[ATTRIBUTION.md](ATTRIBUTION.md) for the second case, which turned out to be inert.

## What was added: the air conditioner

`AB_AirConditioner` is a def that SyndicateGamingNetwork never wrote, for art they did.
`AB_AirConditioner.png` shipped in the original mod, finished, 64×64 — a rusted condenser seen
from above, a fan in a round housing over a vent grille — and no def declared it. It was the
only piece of art in there the game never loaded. This gives it the building it was drawn for.

It is a cooler, and the design follows the other five rather than inventing something. Every
building in this mod is a cheaper, cruder variant of something vanilla already has, and each
pays for what it saves:

| | vanilla cooler | this |
|---|---|---|
| steel / components | 90 / 3 | **70 / 2** |
| work to build | 1600 | **1200** |
| construction skill | 5 | **4** |
| power | 200 W | **250 W** |
| cooling (`energyPerSecond`) | −21 | **−16** |

Cheaper and quicker to put up; thirstier and weaker once it runs.

**It keeps the `AirConditioning` research**, where the rest of the mod asks for none. The
difference is that nothing else here unlocks anything — a concrete fence is a fence — while air
conditioning is what stands between a colony and a walk-in freezer. Handing that over for the
price of one mod would change the game rather than furnish it.

It lives in its own file, `Defs/ThingDefs_Buildings/AB_Buildings_Temperature.xml`, so the line
between what was ported and what was added is visible in the file listing and not only in a
comment.

## The defNames were kept

Three of the five carry an author prefix (`AB*`); `ConcreteBarrier` and `ConFence` do not. That
is the kind of name that collides, so it was checked rather than assumed:

- **Core and every DLC** — the nearest miss is vanilla's own `AncientConcreteBarrier`, a
  different name.
- **All 10 360 subscribed Workshop mods**, including *Fortifications - Medieval*. The only file
  among them that defines any of these five names is the source mod itself.
- **Every other mod in this repository.**

No collision, so no rename — and that is the right way round. A rename is permanent in a way a
port is not: it would take every barrier and fence already built out of every existing save, and
here it would have bought nothing.

## Compatibility with the original

The two cannot run together: `ancientbld.core` is declared in `<incompatibleWith>`. Run one or
the other. Because the `defName`s match, swapping one for the other in an existing save keeps
everything already built.

## Repository layout

```
AncientBuildingsRenew/
  Mod/     <- what goes on the Workshop; the NTFS junction into RimWorld/Mods points here
  Art/     <- files the game never loads, never published
```

`Art/` holds `AB_LamppostIcon.psd`, a Photoshop source that was in the original's published
folder and does nothing there — RimWorld cannot read `.psd`, and no def points at it. One more
file was in the same position and was simply deleted: `AB_ConcreteBarrierIcon.png` is byte for
byte `AB_ConcreteBarrier.png`, which the mod still ships, and nothing references it.

## Verification

The port was checked with the repository's static checks, against RimWorld 1.6 alone — the mod
builds on no framework:

```bash
pwsh -File scripts/Check-XmlFields.ps1 -ModPath AncientBuildingsRenew/Mod
pwsh -File scripts/Check-DefRefs.ps1   -ModPath AncientBuildingsRenew/Mod
```

`Check-XmlFields.ps1` reported exactly one unknown element in the whole mod, and it was
`placingDraggableDimensions` — the one that mattered. `Check-DefRefs.ps1` resolves every def
reference and every `ParentName`; every C# class the defs name was checked against the 1.6
assembly by hand.

## Credits

- **SyndicateGamingNetwork** — the buildings, the artwork, the balance, the original mod.

See [ATTRIBUTION.md](ATTRIBUTION.md) for the licence position and what exactly was carried over.

The port work was done with the help of an AI assistant (Claude, by Anthropic), under human
direction and in-game testing.
