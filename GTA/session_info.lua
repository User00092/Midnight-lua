--	Made by User0092

-- options 
local misc = true -- show misc stats?
local banner = true -- show banner?
local background = true -- show background?
local blur_sensitive = true -- blurs IP and RID
local left_indent = false -- indent the left side?


local opacity = 200 -- alpha value for background -- 500 = ~100%; 400 = ~80%; 300 = ~5%; 200 = ~40%; 100 = ~20%
local r,g,b = 255,255,255 -- rgb code for text
local bg_r,bg_g,bg_b = 50, 50, 50 -- rgb code for background

-- local functions and vars
local script_host_index, script_host, script_host_ip,script_host_rid,session_host_index,session_host,session_host_ip,session_host_rid,screen_width,screen_hight,x,y,display_info,session, connected_players, sjt, th, srt
local devs = 0 
local function Log(text) -- logs text to the console in a specific format 
	console.log(con_color.Blue, "[Session Info] ")
	console.log(con_color.White, text .."\n")
end
local runs = 0
local friends = 0
local modders = 0
local devs = 0
local sh = 0

local function GetPlayers() -- gets the amount of valid players in session
	players = 0
	friends = 0 
	modders = 0
	devs = 0
	for index = 0, 32 do
		if player.is_valid(index) then
			players = players + 1
			if player.is_friend(index) then 
				friends = friends + 1 
			end 
			if (player.is_modder(index) or player.is_god(index)) and (index ~= player.index()) then 
				modders = modders + 1 
			end 
			if (player.is_rockstar_dev(index)) then
				devs = devs+1
			end 
		end
	end
	return players, friends, modders
end

local function GetIp(ply) -- gets the ip of a specified user 
	local player_ip = player.get_resolved_ip_string(ply)
	if player_ip == "0.0.0.0" or player_ip == nil then 
		player_ip = player.get_ip_string(ply)
	end
	return player_ip
end
 

local function UpdateStats()
	-- session host 
	session_host_index = player.get_session_host()
	session_host = player.get_name(session_host_index) -- session host username
	if not blur_sensitive then 
		session_host_ip = GetIp(session_host_index)	--session host ip
		session_host_rid = player.get_rid(session_host_index) -- session host rid
	end 
	if blur_sensitive then 
		session_host_ip = "***.***.***.***"
		session_host_rid = "*********"
	end 
	
	-- script host
	script_host_index = player.get_script_host()
	script_host = player.get_name(script_host_index) -- script host username
	if not blur_sensitive then 
		script_host_ip = GetIp(script_host_index)	-- script host ip
		script_host_rid = player.get_rid(script_host_index) -- script host rid
	end
	if blur_sensitive then 
		script_host_ip = "***.***.***.***"
		script_host_rid = "*********"
	end 
	connected_players = GetPlayers()
	
	screen_hight = draw.get_window_height()
	screen_width = draw.get_window_width()
	x = screen_width *0.18
	y = screen_hight
	
	return script_host, script_host_ip,script_host_rid,session_host,session_host_ip,session_host_rid, connected_players, x, y
end 

-- global functions
function OnSessionLeft() 
	session = false 
	return session
end

function OnTransitionEnd(is_multiplayer)
	session = true 
	if not is_multiplayer then 
		session = false 
	end
	local sjt = os.time()
	UpdateStats()
	th = 0
	return script_host, script_host_ip,script_host_rid,session_host,session_host_ip,session_host_rid, connected_players, x, y,session, sjt, th
end

function OnSessionHostChanged(player_id)
	UpdateStats()
	return script_host, script_host_ip,script_host_rid,session_host,session_host_ip,session_host_rid, connected_players, x, y
end

function OnPlayerJoin(ply)
	UpdateStats()
	
	return script_host, script_host_ip,script_host_rid,session_host,session_host_ip,session_host_rid, connected_players, x, y
end 

function OnPlayerLeft(ply)
	if session then 
		UpdateStats()
	end
	return script_host, script_host_ip,script_host_rid,session_host,session_host_ip,session_host_rid, connected_players, x, y
end 

function OnChatMsg(ply, text)
	if (text == "!session info") and (display_info == true) then
		if ply == player.index() then 
			display_info = false
			return display_info
		end
	end
	if (text == "!session info") and (display_info == false) then 
		if ply == player.index() then 
			display_info = true
			return display_info
		end
	end
	if (text == "!session blur") and (blur_sensitive == false) then 
		if ply == player.index() then 
			blur_sensitive = true 
			utils.notify("Session Info", "Applyed at next sync",17,1)
			return blur_sensitive
		end
	end 
	if (text == "!session blur") and (blur_sensitive == true) then 
		if ply == player.index() then 
			blur_sensitive = false 
			utils.notify("Session Info", "Applyed at next sync",17,1)
			return blur_sensitive
		end
	end 
	if (text == "!session bg") and (background == true) then 
		if ply == player.index() then 
			background = false
			return background
		end
	end 
	if (text == "!session bg") and (background == false) then 
		if ply == player.index() then 
			background = true
			return background
		end
	end 
	if (text == "!session head") and (header == false) then 
		if ply == player.index() then 
			header = true
			return header
		end
	end 
	if (text == "!session head") and (header == true) then 
		if ply == player.index() then 
			header = false
			return header
		end
	end 
	if (text == "!session indent") and (left_indent == true) then 
		if ply == player.index() then 
			left_indent = false
			return left_indent
		end
	end 
	if (text == "!session indent") and (left_indent == false) then 
		if ply == player.index() then 
			left_indent = true
			return left_indent
		end
	end 
end



-- display info 
function OnFrame()
	if session and display_info then 
		local ct = os.time()
		-- used for session time 
		local tm = os.date("%M", ct - sjt) 
		local ts = os.date("%S", ct - sjt)
		if tm == 59 and ts == 59 then 
			th = th +1
			tm = 0 
			ts = 0
		end
		-- used for script time 
		local sm = os.date("%M", ct - srt)
		local ss = os.date("%S", ct - srt)
		if sm == 59 and ss == 59 then 
			sh = sh +1
			sm = 0 
			ss = 0
		end
		local tis = th ..":"..tm..":"..ts -- tis = time in sesison 
		local sup = sh..":"..sm..":"..ss -- sup = Script up time 
		runs = runs + 1
		if runs == 1000 then 
			UpdateStats()
			runs = 0
		end 
		if background then 
			draw.set_color(0, bg_r,bg_g,bg_b, opacity)
			draw.rect_filled(x-10, y-190, x+200, y)
		end 
		draw.set_color(0, r,g,b)
		draw.text(x, y-180, "Connected Players: " ..connected_players)
		draw.text(x, y-140, "Session Host: " .. session_host)
		draw.text(x, y-120, "Session Host IP: " ..session_host_ip)
		draw.text(x, y-100, "Session Host R* ID: " ..session_host_rid)
		draw.text(x, y-60, "Script Host: " ..script_host)
		draw.text(x, y-40, "Script Host IP: " ..script_host_ip)
		draw.text(x, y-20, "Script Host R* ID: " ..script_host_rid)
		if misc then 
			if background then 
				draw.set_color(0, bg_r,bg_g,bg_b, opacity)
				draw.rect_filled(x+210, y-190, x+400, y)
			end 
			draw.set_color(0, r,g,b)
			draw.text(x+220, y-20, "Admin in session: " ..devs)
			draw.text(x+220, y-40, "Modders in session: " ..modders)
			draw.text(x+220, y-60, "Friends in session: " ..friends)
			draw.text(x+220,y-80, "Time in session: " .. tis)
		end
		if banner then 
			if background then 
				draw.set_color(0, bg_r,bg_g,bg_b, opacity)
				if left_indent then 
					draw.rect_filled(120, 0, screen_width, 40)
				end 
				if not left_indent then 
					draw.rect_filled(0, 0, screen_width, 40)
				end 
			end 
			draw.set_color(0, r,g,b)
			if left_indent then 
				draw.text(130,20,"Date: "..os.date("%x", ct))
			end
			if not left_indent then 
				draw.text(10,20,"Date: "..os.date("%x", ct))
			end 
			draw.text(screen_width/2 - 90 ,20, "Time: " .. os.date("%X", ct))
			draw.text(screen_width-120,20,"Up time: "..sup)
		end 
	end
end

-- on load and on unload 
function OnInit()
	srt = os.time() -- script run time 
	sh = 0
	runs = 0
	Log("loaded")
	
	display_info = true
	session = false 
	if lobby.is_session_active() then 
		session = true 
		UpdateStats()
		sjt = os.time() --session join time
	end 
	th = 0
	screen_hight = draw.get_window_height()
	screen_width = draw.get_window_width()
	x = screen_width *0.18
	y = screen_hight
end

function OnDone()
	session = false 
	Log("unloaded")
	return session
end
