# T.A.R.D.I.S. - Time And Relative Dimension(s) In Space

A heavily reworked fork of [Factorissimo 3](https://mods.factorio.com/mod/factorissimo-2-notnotmelon) that adds the iconic TARDIS - a teleporting building with a pocket dimension inside!

## Features

### 🏗️ Pocket Dimension
- **2×2 exterior, 30×30 interior**
- **Portable base** - build factories, storage, anything inside
- **Pack it up** - breaking the TARDIS preserves everything inside

### 🚀 Teleportation System
- **Map mode** - click anywhere on the map to select your destination
- **Alert mode** - instantly jump to the nearest problem (prioritizes planets over space platforms)
- **Recall by key** - left-click on the ground with a bound TARDIS key to teleport the TARDIS to your position (see [Recall Keys](#recall-keys) section below for details)

Supports teleportation to any location, even between planets

### 🔧 Advanced
- **Recursive** - place TARDISes inside TARDISes!
- **Multiplayer** - multiple players can share one TARDIS

## How to Use

1. **Research** TARDIS technology
2. **Craft** and **place** the TARDIS
3. **Enter** through the door (front side)
4. **Load fuel** into the console (fuel type and amount are configurable in mod settings)
5. **Teleport**:
   - Green "Map" button → select destination on map
   - Red "Problems" button → auto-teleport to nearest alert
6. **Exit** through the door at your new location

## Settings

- **Technology difficulty** (Easy / Medium / Hard, default: Hard) — research cost for TARDIS technology
- **Recipe difficulty** (Easy / Medium / Hard, default: Hard) — crafting cost for TARDIS
- **Jump fuel type** (default: Uranium fuel cell) — item consumed as fuel for teleportation
- **Jump fuel amount** (1–100, default: 5) — number of fuel items consumed per jump
- **Manual map teleportation** (default: On) — show the green "Map" button in the console
- **Block teleport to space platforms** (default: Off) — prevents TARDIS from teleporting to space platforms

> Exact values for each difficulty level are shown in the setting tooltips in-game.

> When SpaceAge is enabled, Hard difficulty changes (uses space resources).

## Recall Keys

TARDIS keys allow you to teleport your TARDIS to your position from anywhere. Keys are color-coded for easy identification.

**How to create a recall key:**

1. Place a **key synchronizer** inside your TARDIS
2. Craft a **TARDIS key** and place it in the key synchronizer
3. Select a color from the dropdown and click **Bind**
4. The key is now ready! Hold it in your cursor and left-click on the ground to teleport the TARDIS to your position from anywhere

Each key is bound to a specific TARDIS and cannot be used with other TARDISes. 10 colors are available for organizing multiple keys.

## Commands

`/give-lost-tardis-buildings` - Recovers lost TARDIS items (admin only)

## Credits

- **Based on** [Factorissimo3](https://github.com/notnotmelon/factorissimo-2-notnotmelon) by notnotmelon
- **Teleport sound** [CC0 Sci-fi Vehicle Sound](https://opengameart.org/content/sci-fi-vehicle-sound) by Ogrebane
- **Graphics** created in [Sora](https://sora.chatgpt.com)
- **Inspired by** Doctor Who's TARDIS concept

---

**Enjoy your adventures in time and space!** 🌌
