# Banished Gameplay Mods (DSH)

For **Banished 1.0.7 build 170910** (works with Steam and non-Steam copies).

Six independent mods. Each feature is a separate .pkm file, so you can enable or remove them individually.

## Mod list

| File | Name | What it does |
|---|---|---|
| storage10x.pkm | Storage x10 | Storage Yard 250 -> 2500, Storage Barn 6000 -> 60000, Market 10000 -> 100000, Trading Post 60000 -> 600000, Storage Cart 2500 -> 25000 |
| infinitemine.pkm | Infinite Mine and Quarry | Maximum production 2000 -> 2147483647, never depletes |
| pasture2x.pkm | Pasture x2 | Required area per animal halved (cow 20 -> 10, sheep 16 -> 8, chicken 6 -> 3) |
| limit8digit.pkm | Bigger Resource Limit Input | Spinner max length 6 -> 8 digits |
| terratools.pkm | Terrain Tools | Three 1x1 tools: raise 1 level, lower 1 level, flatten. Free and instant |
| tombstonehalf.pkm | Tombstone Lifetime Halved | Tombstone lifetime 60 -> 30 months (tolerance 12 -> 6) |

## Installation

1. Close the game completely.
2. Copy the .pkm files you want into the WinData folder inside your Banished installation.
3. Start the game and enable them in the Mods list on the main menu.
4. Load a save or start a new game.

## Uninstallation

Delete the corresponding .pkm from WinData. Each mod is independent.

## Optional: Bigger Resource Limit Input

The game hard-caps the resource limit at 999999, and that value is baked into the executable.
To allow 99999999 you need a 4-byte patch:

- The patcher is in optional/exe-patch/ ; run apply-patch.bat
- It backs up the original as Application-steam-x64.exe.orig_backup
- Run restore.bat to revert
- The other five mods work fine without this patch

## Compatibility

All mods work by overriding vanilla templates, so they conflict with mods that touch the same content:

- Storage x10: conflicts with any mod changing Storage Barn / Storage Yard / Market / Trading Post / Storage Cart
- Infinite Mine and Quarry: conflicts with any mod changing Iron Mine / Quarry
- Pasture x2: conflicts with any mod changing livestock
- Bigger Resource Limit Input: conflicts with any mod changing the resource limit spinner
- Tombstone Lifetime Halved: conflicts with any mod changing tombstones
- Terrain Tools: reuses three hidden vanilla toolbar slots (debug / noise / capture), so it conflicts with mods that repurpose those slots

Large overhaul packs (MegaMod, Colonial Charter, RK Editor's Choice, etc.) will almost certainly conflict with everything above.

## Known limitations

- Terrain tool area is 1 tile (uses the wooden bridge deck mesh, the only 1x1 flat floor mesh in the game)
- On water the depth is relative to the water surface, not the riverbed
- Terrain tools must be demolished manually afterwards (they disappear cleanly, no ruins)
- Storage / pasture / mine changes only apply to newly built buildings
- Tombstone lifetime only affects newly created tombstones

## License

MIT License, see LICENSE.
Redistribution of modified game executables or game data packs is not permitted.
