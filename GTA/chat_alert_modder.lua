-- made by User0092
local function Log(text)
	console.log(con_color.Blue, "[Alert_Modder] ")
	console.log(con_color.White, text .. "\n")
end
function OnInit()
    Log("Loaded")
end


function OnModderDetected(ply, reason)
	local alert_reason
    local username = player.get_name(ply)
	if reason == 64 then
		alert_reason = "Super Jump"
	elseif reason == 8192 then
		alert_reason = "Kick Attempt"
	elseif reason == 512 then
		alert_reason = "Censor Bypass"
	elseif reason == 1024 then 
		alert_reason = "Bad/Invalid Name"
	elseif reason == 16 then 
		alert_reason = "CRCs Mismatch"
	elseif reason == 2 then 
		alert_reason = "Force Host"
	else
		alert_reason = reason .. " .. (Contact developer with code and reason)"
	end
    utils.send_chat( username .. " Is cheating. Reason: " .. alert_reason .. "", false, ply)
end

function OnDone()
    Log("Unloaded")
end
