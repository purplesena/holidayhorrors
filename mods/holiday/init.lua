local modpath = minetest.get_modpath("holiday")
dofile(modpath .. "/nodes.lua")
dofile(modpath .. "/util.lua")

local timer = 0
local timer2 = 0
local presentCount = 0

local pos1 = {x=12, y=2, z=10}

minetest.register_on_newplayer(function(player)
	player:setpos({x=7, y=2, z=7})
    local player_inv = player:get_inventory()
    player_inv:add_item("main","default:sword_diamond")
	minetest.chat_send_all("YOUR GOAL IS TO FIND THE SPECIAL PRESENT! (HINT: IT IS GREEN) ONCE YOU HAVE IT, RETURN TO THIS STARTING AREA! GOOD LUCK!")
end)

minetest.register_globalstep(function(dtime)
	timer = timer + dtime
	timer2 = timer2 + dtime
	local a = math.random(1, 127)
	local b = math.random(1, 30)
	if timer2 >= 1 then
		local isFinished = gameIsFinished()
		if isFinished == true then
			minetest.chat_send_all("YOU HAVE WON THE GAME! YOU MAY EXIT THE HOLIDAY SHOP OF HORRORS :) GOODBYE!")
		else
			timer2 = 0
		end
	end

	if timer >= 15 then
		for _, player in pairs(minetest.get_connected_players()) do
			local pos = player:get_pos()

			local count = 0
			--[[for _, entity in pairs(minetest.luaentities) do
				if entity.name == "mobs:monster_lv1" then
					if vector.distance(pos, entity.object:get_pos()) <= 40 then
						count = count + 1
					end
				end
			end ]]

			if count <= 40 then 
				local spawnat = {x = math.random(1, 126), y = 2, z = math.random(1, 29)}
				minetest.add_entity(spawnat, "mobs:monster_lv15")
				count = count + 1
			end
		end

		timer = 0
	end

	if presentCount < 10 then
		local a = math.random(11, 127)
		local b = math.random(1, 30)
		minetest.set_node({x= a, y=2, z=b}, {name="holiday:specialpresent"})
		minetest.chat_send_all("The Special Present Can Be Found In Aisle"..b)
		presentCount = presentCount + 1
	end


	for i = 1, 127 do
		for j = 1, 30 do
			minetest.set_node({x=i, y=1, z=j}, {name="default:copperblock"})
			minetest.set_node({x=i, y=21, z=j}, {name="default:copperblock"})
		end
	end
	for m = 1, 20 do
		for j = 1, 30 do
			minetest.set_node({x=0, y=m, z=j}, {name="default:copperblock"})
			minetest.set_node({x=128, y=m, z=j}, {name="default:copperblock"})
		end
		for l = 1, 127 do
			minetest.set_node({x=l, y=m, z=1}, {name="default:copperblock"})
			minetest.set_node({x=l, y=m, z=31}, {name="default:copperblock"})
		end
	end
	for a = 1, 31 do
		for b = 1, 10 do
			minetest.set_node({x=(4*a), y=21, z=(3*b)}, {name="default:torch"})
		end
	end
	for i = 1, 20 do
		for j = 1, 9 do
			minetest.set_node({x=(i*6) + 5, y=1, z=(j*3)+1}, {name="holiday:shelf"})
		end
	end
	for i = 1, 127 do
		for j = 1, 30 do
			for k = 1, 7 do
				local pos = {x=i, y=1, z=j}
				local pos2 = {x=i+1, y= 1 + k, z=j}
				local pos3 = {x=i+2, y= 1 + k, z=j}
				local pos7 = {x=i+3, y= 1 + k, z=j}
				local pos4 = {x=i, y= 1 + k, z=j-1}
				local pos5 = {x=i+1, y= 1 + k, z=j-1}
				local pos6 = {x=i+2, y= 1 + k, z=j-1}
				local pos8 = {x=i+3, y= 1 + k, z=j-1}
				local node = minetest.get_node(pos)
				if node.name == "holiday:shelf" then
					pos.y= 1 + k
					minetest.set_node(pos, {name="holiday:normalpresent"})
					minetest.set_node(pos2, {name="holiday:normalpresent"})
					minetest.set_node(pos3, {name="holiday:normalpresent"})
					minetest.set_node(pos4, {name="holiday:normalpresent"})
					minetest.set_node(pos5, {name="holiday:normalpresent"})
					minetest.set_node(pos6, {name="holiday:normalpresent"})
					minetest.set_node(pos7, {name="holiday:normalpresent"})
					minetest.set_node(pos8, {name="holiday:normalpresent"})
				end
			end
		end
	end	
end
)