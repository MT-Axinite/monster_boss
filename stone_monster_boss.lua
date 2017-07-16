
local S = mobs.intllib

-- Stone Monster Boss by Sporax

mobs:register_mob("monster_boss:stone_monster_boss", {
	type = "monster",
	passive = false,
	attack_type = "dogfight",
	pathfinding = true,
	reach = 4,
	damage = 12,
	hp_min = 80,
	hp_max = 110,
	armor = 30,
	--collisionbox = {-1.2,-3.0,-1.2,1.2,2.7,1.2},
	collisionbox = {-0.5,-3,-0.5,  0.5,1.5,0.5},
	visual_size = {x=3,y=3},
	stepheight = 3,
	visual = "mesh",
	mesh = "mobs_stone_monster.b3d",
	textures = {
		{"mobs_stone_monster.png"},
		{"mobs_stone_monster2.png"}, -- by AMMOnym
	},
	makes_footstep_sound = true,
	sounds = {
		random = "mobs_stonemonster",
	},
	walk_velocity = 3,
	run_velocity = 6,
	jump = true,
	floats = 0,
	view_range = 15,
	drops = {
		{name = "default:diamond", chance = 1, min = 1, max = 2},
	},
	water_damage = 0,
	lava_damage = 0,
	light_damage = 0,
	animation = {
		speed_normal = 15,
		speed_run = 15,
		stand_start = 0,
		stand_end = 14,
		walk_start = 15,
		walk_end = 38,
		run_start = 40,
		run_end = 63,
		punch_start = 40,
		punch_end = 63,
	},
})

mobs:register_spawn("monster_boss:stone_monster_boss", {"nether:rack"}, 7, 0, 21000, 1, 0)

mobs:register_egg("monster_boss:stone_monster_boss", S("Stone Monster Boss"), "default_stone.png", 1)

-- compatibility
mobs:alias_mob("mobs:stone_monster", "mobs_monster:stone_monster")
