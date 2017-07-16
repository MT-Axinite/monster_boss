
local S = mobs.intllib

-- Tree Monster Boss by Sporax

mobs:register_mob("monster_boss:tree_monster_boss", {
	type = "monster",
	passive = false,
	attack_type = "dogfight",
	reach = 4,
	damage = 14,
	hp_min = 90,
	hp_max = 120,
	armor = 30,
	collisionbox = {-1.2,-3.0,-1.2,1.2,2.4,1.2},
	visual_size = {x=3,y=3},
	stepheight = 3,
	visual = "mesh",
	mesh = "mobs_tree_monster.b3d",
	textures = {
		{"mobs_tree_monster.png"},
		{"mobs_tree_monster2.png"},
	},
	blood_texture = "default_wood.png",
	makes_footstep_sound = true,
	sounds = {
		random = "mobs_treemonster",
	},
	walk_velocity = 1,
	run_velocity = 3,
	jump = true,
	view_range = 15,
	drops = {
		{name = "default:diamond", chance = 1, min = 1, max = 2},
	},
	water_damage = 0,
	lava_damage = 0,
	light_damage = 0,
	fall_damage = 0,
	animation = {
		speed_normal = 15,
		speed_run = 15,
		stand_start = 0,
		stand_end = 24,
		walk_start = 25,
		walk_end = 47,
		run_start = 48,
		run_end = 62,
		punch_start = 48,
		punch_end = 62,
	},
})

mobs:register_spawn("monster_boss:tree_monster_boss",
	{"nether:rack"}, 7, 0, 21000, 1, 31000, false)

mobs:register_egg("monster_boss:tree_monster_boss", S("Tree Monster Boss"), "default_tree_top.png", 1)

-- compatibility
mobs:alias_mob("mobs:tree_monster", "mobs_monster:tree_monster")

-- ethereal sapling compatibility
if not minetest.get_modpath("ethereal") then
	minetest.register_alias("ethereal:tree_sapling", "default:sapling")
	minetest.register_alias("ethereal:jungle_tree_sapling", "default:junglesapling")
end
