local mobRange = 40
local TRIES = 20

mobIsVisible = function(pos, height)
	height = height or 1
	height = math.max(1, height)
	for _, player in pairs(minetest.get_connected_players()) do
		local ppos = player:get_pos()
		-- Dont care about players way far away
		if vector.distance(ppos, pos) <= mobRange then
			local eye = table.copy(ppos)
			eye.y = eye.y + player:get_properties().eye_height
			local look = player:get_look_dir()
			local dir = vector.direction(ppos, {x = pos.x, y = pos.y + height, z = pos.z})
			-- Only worry about players facing us
			if vector.dot(look, dir) > 0 then
				-- Check all visible parts
				for i = 0, height do
					if not Raycast(eye, vector.add(pos, {x = 0, y = i, z = 0}), false):next() then
						return true
					end
				end
			end
		end
	end
	return false
end

pickPosition = function()
	local a = math.random(1, 127)
	local b = math.random(1, 30)
	local c = math.random(2, 3)
	local randomPos = {x = a, y=c, z=b}

	local pos = minetest.get_node(randomPos)
	if pos == "holiday:normalpresent" then
		minetest.set_node(randomPos, {name="holiday:specialpresent"})
	end
end

gameIsFinished = function()
	for _, player in pairs(minetest.get_connected_players()) do
		local inv = player:get_inventory()
		local pPos = player:get_pos()
	
		if pPos.x < 11 then
			if inv:contains_item("main", "holiday:specialpresent") then
				return true
			end
		else
			return false
		end
	end
end

