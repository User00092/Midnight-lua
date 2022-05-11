local admin, player_index
function OnInit()
    console.log("Loaded")
    admin = not admin
end

function OnPlayerJoin(ply)
	player_index = player.index()
	if (player.is_rockstar_dev(ply) == true) then
		admin = true
	end

    if (admin) == true then
        utils.notify("Anti-admin","Admin detected", 17, 4)
        lobby.change_session(0)
        admin = not admin
    end
end

function OnDone()
    console.log("Unloaded")
end
