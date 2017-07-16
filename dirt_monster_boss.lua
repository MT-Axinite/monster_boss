
local S = mobs.intllib

-- Dirt Monster Boss by Sporax

mobs:register_mob("monster_boss:dirt_monster_boss", {
	type = "monster",
	passive = false,
	attack_type = "dogfight",
	pathfinding = true,
	reach = 4,
	damage = 12,
	hp_min = 90,
	hp_max = 120,
	armor = 30,
	--collisionbox = {-1.2,-3.0,-1.2,1.2,2.4,1.2},
	collisionbox = {-0.5,-3,-0.5,  0.5,1.5,0.5},
	visual_size = {x=3,y=3},
	stepheight = 3,
	visual = "mesh",
	mesh = "mobs_stone_monster.b3d",
	textures = {
		{"mobs_dirt_monster.png"},
	},
	blood_texture = "default_dirt.png",
	makes_footstep_sound = true,
	sounds = {
		random = "mobs_dirtmonster",
	},
	view_range = 15,
	walk_velocity = 1,
	run_velocity = 3,
	jump = true,
	drops = {
		{name = "default:diamond", chance = 1, min = 1, max = 2},
	},
	water_damage = 0,
	lava_damage = 0,
	light_damage = 0,
	fear_height = 8,
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

mobs:register_spawn("monster_boss:dirt_monster_boss",
	{"nether:rack"}, 7, 0, 21000, 1, 31000, false)

mobs:register_egg("monster_boss:dirt_monster_boss", S("Dirt Monster Boss"), "default_dirt.png", 1)

-- compatibility
mobs:alias_mob("mobs:dirt_monster", "mobs_monster:dirt_monster")
