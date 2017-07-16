
local S = mobs.intllib

-- Bunny by ExeterDad

mobs:register_mob("monster_boss:bunny_boss", {
	type = "monster",
	passive = false,
	reach = 2,
	damage = 28,
	hp_min = 900,
	hp_max = 1400,
	armor = 2500,
	collisionbox = {-1.5,-2.5,-1.5,1.5,0.5,1.5},
	visual_size = {x=5,y=5},
	visual = "mesh",
	mesh = "mobs_bunny.b3d",
	drawtype = "front",
	textures = {
		{"mobs_bunny_evil.png"},
	},
	sounds = {},
	makes_footstep_sound = false,
	walk_velocity = 3,
	run_velocity = 6,
	runaway = false,
	jump = true,
	walk_chance = 1,
	jump_chance = 1,
	jump_height = 2,
	drops = {
		{name = "mobs:meat_raw", chance = 1, min = 10, max = 15},
	},
	water_damage = 0,
	lava_damage = 0,
	light_damage = 0,
	fear_height = 10,
	animation = {
		speed_normal = 15,
		speed_run = 20,
		stand_start = 1,
		stand_end = 15,
		walk_start = 16,
		walk_end = 24,
		run_start = 16, -- 40
		run_end = 24, -- 63
		punch_start = 16,
		punch_end = 24,
	},
	follow = {"farming:carrot", "farming_plus:carrot_item"},
	view_range = 15,
	replace_rate = 10,
	replace_what = {"farming:carrot_7", "farming:carrot_8", "farming_plus:carrot"},
	replace_with = "air",
	on_rightclick = function(self, clicker)

		-- feed or tame
		if mobs:feed_tame(self, clicker, 4, true, true) then
			return
		end

		-- Monty Python tribute
		local item = clicker:get_wielded_item()

		if item:get_name() == "mobs:lava_orb" then

			if not minetest.setting_getbool("creative_mode") then
				item:take_item()
				clicker:set_wielded_item(item)
			end

			self.object:set_properties({
				textures = {"mobs_bunny_evil.png"},
			})

			self.type = "monster"
			self.object:set_hp(20)

			return
		end

		mobs:capture_mob(self, clicker, 30, 50, 80, false, nil)
	end,

	attack_type = "dogfight",
	damage = 60,
})

mobs:register_spawn("monster_boss:bunny_boss",
	{"default:dirt_with_grass", "ethereal:prairie_dirt"}, 0, 0, 0, 0, 0, false)

mobs:register_egg("monster_boss:bunny_boss", S("Bunny Boss"), "mobs_bunny_inv.png", 0)

