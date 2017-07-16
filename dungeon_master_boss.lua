
local S = mobs.intllib

-- Dungeon Master Boss by Sporax

mobs:register_mob("monster_boss:dungeon_master_boss", {
	type = "monster",
	passive = false,
	damage = 18,
	attack_type = "dogshoot",
	dogshoot_switch = 1,
	dogshoot_count_max = 10,
	reach = 4,
	shoot_interval = 2.5,
	arrow = "monster_boss:fireball",
	shoot_offset = 1,
	hp_min = 200,
	hp_max = 250,
	armor = 25,
	collisionbox = {-2.1,-3.0,-2.1,2.1,4.8,2.1},
	stepheight = 3,
	visual_size = {x=3,y=3},
	visual = "mesh",
	mesh = "mobs_dungeon_master_boss.b3d",
	textures = {
		{"mobs_dungeon_master.png"},
		{"mobs_dungeon_master2.png"},
		{"mobs_dungeon_master3.png"},
	},
	makes_footstep_sound = true,
	sounds = {
		random = "mobs_dungeonmaster",
		shoot_attack = "mobs_fireball",
	},
	walk_velocity = 1,
	run_velocity = 3,
	jump = true,
	view_range = 15,
	drops = {
		{name = "default:diamond", chance = 1, min = 2, max = 3},
	},
	water_damage = 0,
	lava_damage = 0,
	light_damage = 0,
	fear_height = 8,
	animation = {
		stand_start = 0,
		stand_end = 19,
		walk_start = 20,
		walk_end = 35,
		punch_start = 36,
		punch_end = 48,
		shoot_start = 36,
		shoot_end = 48,
		speed_normal = 15,
		speed_run = 15,
	},
		immune_to = {
		{"nyantools:nyan_sword", 0}, -- no damage
	},	
})

mobs:register_spawn("monster_boss:dungeon_master_boss", {"nether:rack"}, 7, 0, 40000, 1, -70)

mobs:register_egg("monster_boss:dungeon_master_boss", S("Dungeon Master Boss"), "fire_basic_flame.png", 1, true)

-- compatibility
mobs:alias_mob("mobs:dungeon_master_boss", "mobs_monster:dungeon_master_boss")

-- fireball (weapon)
mobs:register_arrow("monster_boss:fireball", {
	visual = "sprite",
	visual_size = {x = 1, y = 1},
	textures = {"mobs_fireball.png"},
	velocity = 10,

	-- direct hit, no fire... just plenty of pain
	hit_player = function(self, player)
		player:punch(self.object, 1.0, {
			full_punch_interval = 1.0,
			damage_groups = {fleshy = 8},
		}, nil)
	end,

	hit_mob = function(self, player)
		player:punch(self.object, 1.0, {
			full_punch_interval = 1.0,
			damage_groups = {fleshy = 8},
		}, nil)
	end,

	-- node hit, bursts into flame
	hit_node = function(self, pos, node)
		mobs:explosion(pos, 1, 1, 0)
	end
})
