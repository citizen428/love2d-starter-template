local IS_DEBUG = os.getenv("LOCAL_LUA_DEBUGGER_VSCODE") == "1" and arg[2] == "debug"
if IS_DEBUG then
	require("lldebugger").start()
	local love_errorhandler = love.errorhandler

	function love.errorhandler(msg)
		if lldebugger then
			error(msg, 2)
		else
			return love_errorhandler(msg)
		end
	end
end

-- https://love2d.org/wiki/Config_Files
function love.conf(t)
	t.window.title = "LÖVE Test"
end
