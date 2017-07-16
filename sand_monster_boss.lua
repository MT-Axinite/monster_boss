
local S = mobs.intllib

-- Sand Monster Boss by Sporax

mobs:register_mob("monster_boss:sand_monster_boss", {
	type = "monster",
	passive = false,
	attack_type = "dogfight",
	pathfinding = true,
	reach = 4,
	damage = 9,
	hp_min = 70,
	hp_max = 90,
	armor = 30,
	--collisionbox = {-1.2,-3.0,-1.2,1.2,2.4,1.2},
	collisionbox = {-0.5,-3,-0.5,  0.5,1.5,0.5},
	visual_size = {x=3,y=3},
	stepheight = 3,
	visual = "mesh",
	mesh = "mobs_sand_monster.b3d",
	textures = {
		{"mobs_sand_monster.png"},
	},
	makes_footstep_sound = true,
	sounds = {
		random = "mobs_sandmonster",
	},
	walk_velocity = 1.5,
	run_velocity = 4,
	view_range = 15,
	jump = true,
	floats = 0,
	drops = {
		{name = "default:diamond", chance = 1, min = 1, max = 2},
	},
	water_damage = 0,
	lava_damage = 0,
	light_damage = 0,
	fear_height = 4,
	animation = {
		speed_normal = 15,
		speed_run = 15,
		stand_start = 0,
		stand_end = 39,
		walk_start = 41,
		walk_end = 72,
		run_start = 74,
		run_end = 105,
		punch_start = 74,
		punch_end = 105,
	},
--[[
	custom_attack = function(self, p)
		local pos = self.object:getpos()
		minetest.add_item(pos, "default:sand")
	end,
]]
})

mobs:register_spawn("monster_boss:sand_monster_boss", {"nether:sand"}, 20, 0, 21000, 1, 31000)

mobs:register_egg("monster_boss:sand_monster_boss", S("Sand Monster Boss"), "default_desert_sand.png", 1)

-- compatibility
mobs:alias_mob("mobs:sand_monster", "mobs_monster:sand_monster")
