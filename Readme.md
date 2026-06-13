# Captain's Log

## Game
### Building
#### Doors
- [ ] Open and closed doors don't share a door frame sprite. This makes a jarring transition. Maybe the doorway frame can be placed on top of them.
- [ ] All the doors need positions tweaked and/or sprites made common. The posts are at differnt heights. Set the top post under the players feet (when standing on tile above).
### Cooking
### Farming
### Smithing
### Tools

## Editor

### Category Shenanigans:
#### Party Plants (12 categories): *almost* a simple extension of single-plant logic
###### All Knives: Patterned(#1105) Vs. Unpatterned(#1879): Unpatterned Knives currently only used here
initialization of recipe chain (uncut puff > cut puff&seed) requires an unpatterned knives Category variant (#1879) to prevent 1-1-1-1 relationships.
- (A1, A2)*~~P~~* + (B1, B2)P = (C1, C2)*~~P~~* + (D1, D2)P
- this breaks down (assuming len(A)=len(C) and len(B)=len(D), haven't tested ≠) into 'any A can be used on any B' instead of A1 + B2 = C1 + D1

#### Smolder Natural Spawns (#1735): A list of all natural spawns in the Smolder (brown) biome.
used due to Crashed Rocket spawning there, and thus 'vanishing' objects next to it to make it look correct.
- technically, if a rocket spawns on the edge of a biome and another object spawns in that non-Smolder side, this will look weird. I didn't consider it worth investing in fixing.

#### Small Liquid Container: Empty (#1880) vs Just Emptied(#1574)
- weird because Domestic Boop #Held is treated like a Boop Container(in that it has liquid to use), necessitating a placeholder decay item (#1860) in the just-emptied pattern to make this work. After that transition, the category breaks apart into just the Empty one for everything else.

#### Hearth Boards (#1612-1614)
those categories simplify the repeated uses of the Hearth Boards and it's state transitions. Done by having 9(0-8) articulated use items, and a 0-7 > 1-8 transition, 'stepping down' the ladder with each use (the other transitions are number-matching). This trick is needed because the Hearth Boards item is too complicated to let automatic usage-shifting handle. example path through categories: uses 0 > burning 1 > uses 1, repeat.

#### Usable Tinder Fires (#1658)
- fires are more involved then ohol, contains several stages of 'small fire'
  - ML: The intention, if I remember, was that many things could start a small fire, so make a category so they all can be *used* to make a normal/sustained fire. Or maybe *used* in some other way, idk.

#### Tier 1 Crusher/Hammer:
name is a placeholder for if we ever decide to make 'stronger' or compound tools, tho nothing yet added. might be pointlessly confusing.
currently plan to keep categories for tools, though, in case new tools in a category are added or unified, and for handling the variants of a single item (bowl/shell/boop) efficiently.

### Category Curiosities:
- If you can, dispatch these.
#### single-item categories:
##### The Apocalypse (#813): no idea why this exists
- Thought just naming a normal object this sufficed, no idea what category wrapper around it does.
##### Old Alters(#807-811): no idea why this exists

#### larger categories:
#### Set of Astrosuit (#394): no idea why this exists
- a list of every astro-suit item in the game, but unused in any transitions...?
- the category Perhaps Astrosuit(#392) is missing Colored Helmets but otherwise seems to have subsumed this list

### Object Use Count
- In order for transitioning objects to retain the same use count, objects must have the same number of uses.
  - For example, a basket of gravel has 3 uses and so gravel (the small pile) should have 3 uses. Else, digging up a gravel road will give a thing of gravel and once picked up in a basket will make 3 roads. To get around this, digging up a road only gives one use because it is set to Reverse Use.

## Work notes
### 2026-06-07
- [Door_7_cc9f38.oxz](https://discord.com/channels/1232794966766522480/1411324821962227793)
- [SmeltingDoorSteel_7_38def3.oxz](https://discord.com/channels/1232794966766522480/1411324821962227793/1460649339281215633)
- [DoorPlates_3_e5921b.oxz](https://discord.com/channels/1232794966766522480/1411324821962227793/1469043847068651634)
    - This was intended to replace objects in SmeltingDoorSteel_7_38def3.oxz, but both mods were done user side. The replace was self-consistent for the user, but on my local files the object numbers were different. I'll have to figure out the changes and manually apply them. I haven't created the transitions yet, so maybe I can just import these new and use them instead of the previous.
- Transition in place.
- [x] In testing, the closed doors don't block.
- [x] I noticed there are wet door objects, but we build a door by adding a door to a "dry opening in a wall".
    - leave them. I think it's prt of demolishing them (categories).
- [x] no close sound on vertical door.
- [x] The vertical door post hides behind a corner (at least) until you add a door.
    - And then the post is in front of the player. I don't know what to do with this. Oh, there's an attribute for the sprite (behind player).
