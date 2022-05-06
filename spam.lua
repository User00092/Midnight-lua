-- Made by User0092
-- Major help provided by Karlend

local sent, sent_start, active
function OnInit()
    console.log("Loaded")
    active = not active
end
function OnChatMsg(player_index,  text)
    if text ~= "!start spam" then
        return
    end
    if player_index ~= player.index() then
        return
    end
    active = not active
end
function OnFrame()
    session_active = lobby.is_session_active() -- tests if the user is in an active session
    if (session_active == false) and (sent == false) then
        utils.notify("spam.lua", "Reload in an online session", 17, 3)
        sent = true
        sent_start = false
    end
    if (session_active == true) then
        if (sent_start == false) then
            utils.notify("spam.luat", "Type !stop spam to stop", 17, 3)
            sent = false
            sent_start = true
        end
        if (active == true) then
            utils.send_chat("SPAM THEM ALL!!!", false)
            
        end
    end
end
function OnDone()
    console.log("Unloaded")
end
