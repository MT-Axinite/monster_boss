
local path = minetest.get_modpath("monster_boss")

-- Intllib
local S
if minetest.get_modpath("intllib") then
	S = intllib.Getter()
else
	S = function(s) return s end
end
mobs.intllib = S

-- Monsters boss

dofile(path .. "/dungeon_master_boss.lua")
dofile(path .. "/dirt_monster_boss.lua")
dofile(path .. "/lava_flan_boss.lua")
dofile(path .. "/mese_monster_boss.lua")
dofile(path .. "/oerkki_boss.lua")
dofile(path .. "/sand_monster_boss.lua")
dofile(path .. "/spider_boss.lua")
dofile(path .. "/stone_monster_boss.lua")
dofile(path .. "/tree_monster_boss.lua")
dofile(path .. "/bunny_boss.lua")


print ("[MOD] Mobs Redo 'Monsters Boss' loaded")
