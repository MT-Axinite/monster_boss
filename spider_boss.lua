
local S = mobs.intllib

-- Spider Boss by Sporax

mobs:register_mob("monster_boss:spider_boss", {
	type = "monster",
	passive = false,
	attack_type = "dogfight",
	reach = 4,
	damage = 13,
	hp_min = 80,
	hp_max = 110,
	armor = 30,
	collisionbox = {-2.7,-0.03,-2.1,2.1,1.8,2.1},
	visual_size = {x=3,y=3},
	stepheight = 1,
	visual = "mesh",
	mesh = "mobs_spider.x",
	textures = {
		{"mobs_spider.png"},
	},
	visual_size = {x = 7, y = 7},
	makes_footstep_sound = false,
	sounds = {
		random = "mobs_spider",
		attack = "mobs_spider",
	},
	walk_velocity = 1,
	run_velocity = 3,
	jump = true,
	view_range = 15,
	floats = 0,
	drops = {
	{name = "default:diamond", chance = 1, min = 1, max = 2},
	},
	water_damage = 0,
	lava_damage = 0,
	light_damage = 0,
	animation = {
		speed_normal = 15,
		speed_run = 15,
		stand_start = 1,
		stand_end = 1,
		walk_start = 20,
		walk_end = 40,
		run_start = 20,
		run_end = 40,
		punch_start = 50,
		punch_end = 90,
	},
})

mobs:register_spawn("monster_boss:spider_boss",
	{"ethereal:crystal_dirt"}, 13, 0, 7000, 1, 71)

mobs:register_egg("monster_boss:spider_boss", S("Spider Boss"), "mobs_cobweb.png", 1)

-- compatibility
mobs:alias_mob("mobs:spider", "mobs_monster:spider")

-- ethereal crystal spike compatibility
if not minetest.get_modpath("ethereal") then
	minetest.register_alias("ethereal:crystal_spike", "default:sandstone")
end

-- cobweb
minetest.register_node(":mobs:cobweb", {
	description = S("Cobweb"),
	drawtype = "plantlike",
	visual_scale = 1.1,
	tiles = {"mobs_cobweb.png"},
	inventory_image = "mobs_cobweb.png",
	paramtype = "light",
	sunlight_propagates = true,
	liquid_viscosity = 11,
	liquidtype = "source",
	liquid_alternative_flowing = "mobs:cobweb",
	liquid_alternative_source = "mobs:cobweb",
	liquid_renewable = false,
	liquid_range = 0,
	walkable = false,
	groups = {snappy = 1},
	drop = "farming:cotton",
	sounds = default.node_sound_leaves_defaults(),
})

minetest.register_craft({
	output = "mobs:cobweb",
	recipe = {
		{"farming:string", "", "farming:string"},
		{"", "farming:string", ""},
		{"farming:string", "", "farming:string"},
	}
})
