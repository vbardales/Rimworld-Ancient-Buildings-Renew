Six buildings in the style of the ruins the world is already full of: a concrete fence, a concrete road barrier, a solar lamppost, a vending machine that stores meals, a small kitchen stove that fits in one tile, and an old air conditioner.

No DLC and no dependencies. Five of the six ask for no research at all and are available from the first day of a colony.

I am not the author of this mod. The buildings, the artwork and the balance are SyndicateGamingNetwork's. All I did was bring them forward to 1.6, fix what the port turned up, write the French, and give one orphaned texture the building it was drawn for. Credit goes to them; mistakes in the port are mine.

Original mod: [Ancient Buildings](https://steamcommunity.com/sharedfiles/filedetails/?id=2566355159). It declares 1.3 and nothing further.

## What's in it

- **Concrete fence.** A linked fence that counts as a fence for animal pens, joins walls and rock, and takes a fence gate. Built from any metal.
- **Concrete barrier.** Waist-high cover for a road or a firing line, in the Security tab.
- **Lamppost.** Lights a wide radius and draws no power at all: it is solar. Must be built outdoors.
- **Vending machine.** A one-tile storage building set to meals by default, which keeps what is inside it from spoiling in the open and hides its beauty.
- **Simple kitchen stove.** A one-tile electric stove with the full cooking bill list, 300 W.
- **Ancient air conditioner.** A wall cooler, 250 W for -16 of cooling. Cheaper and quicker to build than the vanilla one, thirstier and weaker to run. This is the only one that needs research: air conditioning, the same as vanilla's.

## The air conditioner is the one building that is not SyndicateGamingNetwork's

The art is theirs; the def is not. The air conditioner texture shipped in the original mod, finished, and nothing in it declared the texture: it was the only piece of art in there that the game never loaded. This gives it the building it was drawn for, designed the way the other five are: a cheaper, cruder variant of something vanilla already has, paying for what it saves. It keeps the air conditioning research where the rest of the mod asks for none, because it is the only building here that would unlock anything, and a free walk-in freezer would change the game rather than furnish it.

## What changed

One thing was broken and would have shipped that way. The concrete fence declared a field, placingDraggableDimensions, that used to let a building be dragged out in a line. RimWorld 1.4 replaced it with the draw-style system and deleted the field outright, and an XML element that matches no field does not stop the game: it logs one line and loads with the field unset. The fence would have built and looked exactly right, and simply refused to be dragged, one cell per click, with nothing on screen to explain it. It now uses the same draw style as the vanilla fence, sandbags and barricade, and the concrete barrier was given it too.

The vending machine gained the two things a storage building has needed since 1.4: a storage group, so it can share its filter with other vending machines, and a storage blueprint, so the filter can be set before it is built.

The stove gained the two baby-food recipes Biotech added to the vanilla stove's bill list in 1.4. They are inert without Biotech.

The labels are lower case, as the game writes them, and one typo in the lamppost's description is fixed. French was added. Nothing else moved: the stats, the costs, the power draw, the textures and the defNames are as they were.

## Credit and removal

SyndicateGamingNetwork declared no licence: no file in the mod, nothing in its About.xml, no linked repository, and nothing in the body of the description on its Steam page. It is republished here under the usual convention for abandoned mods: full credit, a link to the original, and removal on request. If SyndicateGamingNetwork would rather this port did not exist, say so and it comes down, with no argument and no delay.

The original defNames are kept, so a save moves between the two mods without losing a building. The two cannot run together: the original is declared incompatible. Run one or the other.

Content mod: removing it mid-save destroys anything already built from it.

## IF I GO QUIET

If I do not answer within a reasonable time after being contacted, anyone may freely update this or any other of my mods, including publishing a continuation of it. All credit must be preserved.

## AI-GENERATED

The port, its checks and its documentation were written with Claude Code (Anthropic), and audited with Codex (OpenAI), under human direction and review. The two images, the preview background and the icon, were generated with DALL-E (OpenAI), and the preview was lettered afterwards in HTML. Stated openly: working with these tools is my job.

## THANKS

SyndicateGamingNetwork, for the buildings, the artwork and the balance this mod is made of. I only brought them forward.

What is reused and how it differs is detailed in [ATTRIBUTION.md](https://github.com/vbardales/Rimworld-Ancient-Buildings-Renew/blob/main/ATTRIBUTION.md), and [LICENSE](https://github.com/vbardales/Rimworld-Ancient-Buildings-Renew/blob/main/LICENSE) says what the MIT grant covers: the port's own additions, not SyndicateGamingNetwork's work.

[Source code on GitHub](https://github.com/vbardales/Rimworld-Ancient-Buildings-Renew)
