
local S = mobs.intllib

-- Lava Flan Boss by Sporax

mobs:register_mob("monster_boss:lava_flan_boss", {
	type = "monster",
	passive = false,
	attack_type = "dogfight",
	reach = 4,
	damage =15,
	hp_min = 100,
	hp_max = 130,
	armor = 30,
	collisionbox = {-1.5,-1.5,-1.5,1.5,4.5,1.5},
	visual_size = {x=3,y=3},
	stepheight = 3,
	visual = "mesh",
	mesh = "zmobs_lava_flan.x",
	textures = {
		{"zmobs_lava_flan.png"},
		{"zmobs_lava_flan2.png"},
		{"zmobs_lava_flan3.png"},
	},
	blood_texture = "fire_basic_flame.png",
	makes_footstep_sound = false,
	sounds = {
		random = "mobs_lavaflan",
		war_cry = "mobs_lavaflan",
	},
	walk_velocity = 0.5,
	run_velocity = 2,
	jump = true,
	view_range = 10,
	floats = 1,
	drops = {
		{name = "mobs:lava_orb", chance = 10, min = 1, max = 1},
		{name = "default:diamond", chance = 1, min = 1, max = 2},
	},
	water_damage = 0,
	lava_damage = 0,
	light_damage = 0,
	animation = {
		speed_normal = 15,
		speed_run = 15,
		stand_start = 0,
		stand_end = 8,
		walk_start = 10,
		walk_end = 18,
		run_start = 20,
		run_end = 28,
		punch_start = 20,
		punch_end = 28,
	},
	on_die = function(self, pos)
		minetest.set_node(pos, {name = "fire:basic_flame"})
	end,
})

mobs:register_spawn("monster_boss:lava_flan_boss", {"nether:rack"}, 15, 0, 10000, 2, 0)

mobs:register_egg("monster_boss:lava_flan_boss", S("Lava Flan Boss"), "default_lava.png", 1)

-- compatibility
mobs:alias_mob("mobs:lava_flan", "mobs_monster:lava_flan")

-- lava orb
minetest.register_craftitem(":mobs:lava_orb", {
	description = S("Lava orb"),
	inventory_image = "zmobs_lava_orb.png",
})

minetest.register_alias("zmobs:lava_orb", "mobs:lava_orb")

minetest.register_craft({
	type = "fuel",
	recipe = "mobs:lava_orb",
	burntime = 80,
})

-- Lava Pick (digs and smelts at same time)

local old_handle_node_drops = minetest.handle_node_drops

function minetest.handle_node_drops(pos, drops, digger)

	-- are we holding Lava Pick?
	if digger:get_wielded_item():get_name() ~= ("mobs:pick_lava") then
		return old_handle_node_drops(pos, drops, digger)
	end

	-- reset new smelted drops
	local hot_drops = {}

	-- loop through current node drops
	for _, drop in pairs(drops) do

		-- get cooked output of current drops
		local stack = ItemStack(drop)
		local output = minetest.get_craft_result({
			method = "cooking",
			width = 1,
			items = {drop}
		})

		-- if we have cooked result then add to new list
		if output
		and output.item
		and not output.item:is_empty() then

			table.insert(hot_drops,
				ItemStack({
					name = output.item:get_name(),
					count = output.item:to_table().count,
				})
			)
		else -- if not then return normal drops
			table.insert(hot_drops, stack)
		end
	end

	return old_handle_node_drops(pos, hot_drops, digger)
end

