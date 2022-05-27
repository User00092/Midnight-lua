local time_stamp = true -- log time?
local log_self = true -- log yourself?
local log_console = true -- log to the console?
local log_file = true -- log to 'chat_log.log'?


local path = fs.get_dir_product() .. "/chat_log.log"
local function Log(text)
	console.log(con_color.Blue, "[Chat_log] ")
	console.log(con_color.White, text .."\n")
end
function OnInit()
	Log("loaded")
	if not fs.file_exists(path) then
		Log("Creating chat log file")
		local success = fs.file_write(path, "")
		Log(tostring(success))
	end
end
function OnChatMsg(ply,text)
	local local_index = player.index()
	local player_username = player.get_name(ply)
	if (log_self == true) and (ply == local_index) then 
		if time_stamp == false then
			local log_text = "["..player_username.."] "..text
			if log_console == true then 
				Log(tostring(log_text))
			end
			if log_file == true then
				fs.file_append(path, log_text.."\n")
			end
		end
		if time_stamp == true then 
			local sys_time = os.date("%c", os.time())
			local log_text = "["..sys_time.."] ["..player_username.."] "..text
			if log_console == true then 
				Log(tostring(log_text))
			end
			if log_file == true then
				fs.file_append(path, log_text.."\n")
			end
		end
		
	end
	if ply ~= local_index then 
		if time_stamp == false then
			local log_text = "["..player_username.."] "..text
			if log_console == true then 
				Log(tostring(log_text))
			end
			if log_file == true then
				fs.file_append(path, log_text.."\n")
			end
		end
		if time_stamp == true then 
			local sys_time = os.date("%c", os.time())
			
			local log_text = "["..sys_time.."] ["..player_username.."] "..text
			if log_console == true then 
				Log(tostring(log_text))
			end
			if log_file == true then
				fs.file_append(path, log_text.."\n")
			end
		end
	end
end
function OnDone()
	Log("unloaded")
end
