minetest.register_node("holiday:normalpresent", {
	description = "Normal Present",
	paramtype = "light",
	paramtype2 = "facedir",
	drawtype = "nodebox",
	node_box = {type = "fixed", fixed = {-6 / 16, -0.499, -6 / 16, 6 / 16, 4 / 16, 6 / 16}}, 
	tiles = {
		{name = "normalpresent_top.png", backface_culling = false},
		{name = "normalpresent.png", backface_culling = false},
		{name = "normalpresent.png", backface_culling = false},
		{name = "normalpresent.png", backface_culling = false},
		{name = "normalpresent.png", backface_culling = false},
		{name = "normalpresent.png", backface_culling = false},
	},
	groups = {carryable = 1, falling_node = 1, oddly_breakable_by_hand=1},

	--[[ on_rightclick = function(pos, node, clicker, itemstack, pointed_thing)
		local node_name = minetest.get_meta(pos):get_string("node_name")
		local contents = minetest.registered_nodes[node_name].box_contents
		minetest.swap_node(pos, {name = "ikea:box_open"})

		for _, v in pairs(contents) do
			local vel = math.random(5, 8)
			minetest.spawn_item(pos, v):set_velocity({x = 0, y = vel, z = 0})
		end

		minetest.get_node_timer(pos):start(5)
	end,]]
})

minetest.register_node("holiday:specialpresent", {
	description = "Special Present",
	paramtype = "light",
	paramtype2 = "facedir",
	--[[drawtype = "nodebox",
	node_box = {type = "fixed", fixed = {-6 / 16, -0.499, -6 / 16, 6 / 16, 4 / 16, 6 / 16}}, ]]
	tiles = {
		{name = "specialpresent_top.png", backface_culling = false},
		{name = "specialpresent.png", backface_culling = false},
		{name = "specialpresent.png", backface_culling = false},
		{name = "specialpresent.png", backface_culling = false},
		{name = "specialpresent.png", backface_culling = false},
		{name = "specialpresent.png", backface_culling = false},
	},
	groups = {carryable = 1, falling_node = 1, oddly_breakable_by_hand=1},

	--[[ on_rightclick = function(pos, node, clicker, itemstack, pointed_thing)
		local node_name = minetest.get_meta(pos):get_string("node_name")
		local contents = minetest.registered_nodes[node_name].box_contents
		minetest.swap_node(pos, {name = "ikea:box_open"})

		for _, v in pairs(contents) do
			local vel = math.random(5, 8)
			minetest.spawn_item(pos, v):set_velocity({x = 0, y = vel, z = 0})
		end

		minetest.get_node_timer(pos):start(5)
	end,]]
})

minetest.register_node("holiday:shelf", {
	paramtype = "light",
	description = "Shelves for presents",
	drawtype = "mesh",
	mesh = "holiday_shelf.obj",
	tiles = {name = "holidayshelf.png"},
	is_ground_content = true,
	groups = {static = 1},
	sunlight_propagates = true,
})