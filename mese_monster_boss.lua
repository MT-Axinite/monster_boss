
local S = mobs.intllib

-- Mese Monster Boss by Sporax

mobs:register_mob("monster_boss:mese_monster_boss", {
	type = "monster",
	passive = false,
	damage = 9,
	attack_type = "shoot",
	shoot_interval = 0.5,
	arrow = "monster_boss:mese_arrow",
	shoot_offset = 3,
	hp_min = 70,
	hp_max = 90,
	armor = 30,
	collisionbox = {-2,-4.5,-2,2,1.5,2},
	visual_size = {x=3,y=3},
	visual = "mesh",
	mesh = "zmobs_mese_monster.x",
	textures = {
		{"zmobs_mese_monster.png"},
	},
	blood_texture = "default_mese_crystal_fragment.png",
	makes_footstep_sound = false,
	sounds = {
		random = "mobs_mesemonster",
	},
	view_range = 10,
	walk_velocity = 0.5,
	run_velocity = 2,
	jump = true,
	jump_height = 8,
	fall_damage = 0,
	fall_speed = -6,
	stepheight = 2.1,
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

mobs:register_spawn("monster_boss:mese_monster_boss", {"nether:rack"}, 7, 0, 10000, 1, -20)

mobs:register_egg("monster_boss:mese_monster_boss", S("Mese Monster boss"), "default_mese_block.png", 1)

-- compatibility
mobs:alias_mob("mobs:mese_monster", "mobs_monster:mese_monster")

-- mese arrow (weapon)
mobs:register_arrow("monster_boss:mese_arrow", {
	visual = "sprite",
	visual_size = {x = 0.5, y = 0.5},
	textures = {"default_mese_crystal_fragment.png"},
	velocity = 6,

	hit_player = function(self, player)
		player:punch(self.object, 1.0, {
			full_punch_interval = 1.0,
			damage_groups = {fleshy = 7},
		}, nil)
	end,

	hit_mob = function(self, player)
		player:punch(self.object, 1.0, {
			full_punch_interval = 1.0,
			damage_groups = {fleshy = 7},
		}, nil)
	end,

	hit_node = function(self, pos, node)
	end
})
