-- Made by User0092
-- function help from Karlend

local player_index, session_active, spam_text
function OnInit()
    console.log("Loaded spam") 
    session_active = lobby.is_session_active()
    if session_active == false then 
        utils.notify("spam.lua", "Reload script in online session", 17, 3)
    end
    if session_active == true then
        utils.notify("spam.lua", "type '!spam help' for help", 17, 3)
		utils.notify("spam.lua", "Make sure there are no extra spaces in the chat", 17, 3)
    end
end


function OnChatMsg(ply, text)
	spam_text = "SPAM TEMP TEXT" --Change what is displayed by altering the text in quotations 
    if text == "!spam help" then 
		player_index = player.index()
        if (player_index == ply) then
			utils.send_chat("Type '!start spam <runs>'", true)
			utils.send_chat("Type '!start spam <10/20/30/40/50/60/70/80/90/100/true>'.", true)
			utils.send_chat("Example: '!start spam 30' will spam '<text>' 30 times.", true)
			utils.send_chat("Note: You cannot stop spam true as of this moment. The game must be restarted, hence why it is not active", true)
			utils.send_chat("If the script breaks, please let 'User0092' know.", true)
		end
	end
    if text == "!start spam 10" then 
        player_index = player.index()
        if (player_index == ply) then
            for index = 0,9 do 
                utils.send_chat(spam_text, false, 1)
            end
        end
    end
    if text == "!start spam 20" then 
        player_index = player.index()
        if (player_index == ply) then
            for index = 0,19 do 
                utils.send_chat(spam_text, false, 1)
            end
        end
    end
    if text == "!start spam 30" then 
        player_index = player.index()
        if (player_index == ply) then
            for index = 0,29 do 
                utils.send_chat(spam_text, false, 1)
            end
        end
    end
    if text == "!start spam 40" then 
        player_index = player.index()
        if (player_index == ply) then
            for index = 0,39 do 
                utils.send_chat(spam_text, false, 1)
            end
        end
    end
    if text == "!start spam 50" then 
        player_index = player.index()
        if (player_index == ply) then
            for index = 0,49 do 
                utils.send_chat(spam_text, false, 1)
            end
        end
    end
    if text == "!start spam 60" then 
        player_index = player.index()
        if (player_index == ply) then
            for index = 0,59 do 
                utils.send_chat(spam_text, false, 1)
            end
        end
    end
    if text == "!start spam 70" then 
        player_index = player.index()
        if (player_index == ply) then
            for index = 0,69 do 
                utils.send_chat(spam_text, false, 1)
            end
        end
    end
    if text == "!start spam 80" then 
        player_index = player.index()
        if (player_index == ply) then
            for index = 0,79 do 
                utils.send_chat(spam_text, false, 1)
            end
        end
    end
    if text == "!start spam 90" then
        player_index = player.index()
        if (player_index == ply) then
            for index = 0,89 do 
                utils.send_chat(spam_text, false, 1)
            end
        end
    end
    if text == "!start spam 100" then 
        player_index = player.index()
        if (player_index == ply) then
            for index = 0,99 do 
                utils.send_chat(spam_text, false, 1)
            end
        end
    end
end

function OnDone()
   console.log("\nUnloaded\n")
   
end
