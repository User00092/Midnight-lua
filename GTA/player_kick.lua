-- made by User0092

function OnInit()
    console.log("\nLoaded\n")
    session_active = lobby.is_session_active()
    if session_active == true then
        utils.notify("Player_kick.lua", "type '!kick help' for help", 17, 3)
    end
end

local found, player_index, username

function OnChatMsg(ply, text)
    found = not found
	player_index = player.index()
    if text == "!kick help" then 
        if ply == player_index then
            utils.send_chat("Type '!kick <username>'", true)
            utils.send_chat("Example !kick user0092", true)
        end
    end
    if string.find(text, "!kick") then
        if ply == player_index then
            for index = 0,32 do
                if player.is_valid(index) then
                    username = player.get_name(index)
                    if string.find(text, username) then 
                        found = true
                        player.ban(index, 60, "Don't be a bitch")
                        player.kick_brute(index)
						break
                    end
				end
			end
		if found ~= true then
			utils.notify("Player_kick.lua", "User not found", 17, 3)
		end
		end
	end
end

function OnDone()
   console.log("\nUnloaded\n") 
end
