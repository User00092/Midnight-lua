-- made by User0092

function OnInit()
    console.log("\nLoaded\n")
end

local username, alert_reason


function OnModderDetected(ply, reason)
    username = player.get_name(ply)
	if reason == 64 then
		alert_reason = "Super Jump"
	elseif reason == 8192 then
		alert_reason = "Kick Attempt"
	elseif reason == 512 then
		alert_reason = "Censor Bypass"
	else
		alert_reason = reason .. " .. (Contact developer with code and reason)"
	end
    utils.send_chat("" .. username .. " Is cheating. Reason: " .. alert_reason .. "", false, 1)
end

function OnDone()
    console.log("\nUnloaded\n")
end
