--Crystal 251 Main Script v1.02--

dofile("readstates.lua")
dofile("battle_ram.lua")
dofile("constants.lua")
dofile("fastclock.lua")
package.path = package.path..';./libs/lua/?.lua'
package.cpath = package.cpath..';./libs/?.dll'
local http = require("socket.http")
local ltn12 = require("ltn12")

EnemyDisableCount = 0xc67d
EnemyMonMoves	 = 0xd208
EnemyMonPP		= 0xd20e
PlayerDisableCount = 0xc675
BattleMonMoves	 = 0xc62e
BattleMonPP		= 0xc634
rLSB			  = 0xfff1
rLSC			  = 0xfff2
hMilitary		= 0xfff3

-- other stuff --

BEESAFREE_LSC_TRANSFERRING  = 0xff
BEESAFREE_LSC_COMPLETED	 = 0x00

BEESAFREE_SND_RESET		 = 0x00
BEESAFREE_SND_ASKMOVE	   = 0x01
BEESAFREE_SND_ASKITEM	   = 0x02

BEESAFREE_RES_RESET		 = 0x00
player_next_move = ""

military_mode = 0 -- 0 for off, 1 for on
lastBattleState = 0
ignore_serial = 0 -- please set this to 0 for normal use.
lua_wait = 0
bank_wait = 0
debug_mode = 0 --print EVERYTHING aside from basic info if 1, none if 0

-- function refreshinterval(seconds)
	-- -- Revo's function (liar, it's Timmy's function)
	-- local lastupdate = os.time()
	-- local now
	-- repeat
		-- now = os.time()
		-- emu.frameadvance()
	-- until now - lastupdate >= seconds
	-- lastupdate = now
	-- return true
-- end

function GetUsableMoves(MovesPointer, PPPointer, DisabledMovePointer)
	disabledMove = memory.readbyte(DisabledMovePointer)
	if disabledMove ~= 0 then
		disabledMoveIDX = AND(disabledMove, 0xf0) / 16
	else
		disabledMoveIDX = -1
	end
	usableMoves = {}
	for t = 0, 3 do
		tt = memory.readbyte(MovesPointer + t)
		pp = AND(memory.readbyte(PPPointer + t), 0x3f) -- Upper two bits are the PP Up counters
		if tt ~= 0 and t ~= disabledMoveIDX and pp >= 0 then
			table.insert(usableMoves, t)
		end
	end
	return usableMoves
end

function UseRandomMove(MovesPointer, PPPointer, DisabledMovePointer)
	usableMoves = GetUsableMoves(MovesPointer, PPPointer, DisabledMovePointer)
	if #usableMoves == 0 then
		return 0
	else
		return usableMoves[math.random(#usableMoves)]
	end
end

function ReceiveButtonInput_NoMil()
	b, c, h = http.request("http://127.0.0.1:5000/gbmode_inputs")
	-- vba.print(b, c, h)
	if (c == 200) and (b ~= "") then
		local json = JSON:decode(b)
		-- vba.print(json)
		if json["military_toggle"] ~= nil then
			military_mode = 1 - military_mode
			json["military_toggle"] = nil
		end
		joypad.set(1, json)
	end
	emu.frameadvance()
end

function ReceiveButtonInput()
	b, c, h = http.request("http://127.0.0.1:5000/gbmode_inputs")
	-- vba.print(b, c, h)
	if (c == 200) and (b ~= "") then
		local json = JSON:decode(b)
		-- vba.print(json)
		if json["military_toggle"] ~= nil then
			military_mode = 1 - military_mode
			json["military_toggle"] = nil
		end
		player_next_move = json["battle_command"]
		joypad.set(1, json)
	end
	emu.frameadvance()
end

function DelayFrames(nframes)
	for frame = 1, nframes do
		ReceiveButtonInput()
	end
end

function transferStateToAIAndWait(raw_json)
	player_next_move = ""
	next_move = nil
	-- 1st: Invoke the ai with JSON data.
	-- request-body must be a string, therefore encode
	http.request("http://127.0.0.1:5001/ai_invoke", JSON:encode(raw_json))
	-- 2nd: Wait until the ai finished.
	repeat
		-- advance a frame inbetween each request.
		-- could also advance multiple frames to not do 60 requests per second
		next_move = http.request("http://127.0.0.1:5001/ai_retrieve")
		if (next_move == nil or next_move == "") then
			DelayFrames(15)
		end
	-- this request returns either the next move,
	-- or an empty string if the result isn't set yet.
	until (next_move ~= nil and next_move ~= "")
	-- we got a result!
	return next_move
end

function get_next_player_command()
	player_next_move = ""
	repeat
		ReceiveButtonInput()
	until (player_next_move ~= nil and player_next_move ~= "")
	-- vba.print("Player response:", player_next_move)
    return player_next_move
end

function requestBothAIAndMilitary(raw_json)
	player_next_move = ""
	http.request("http://127.0.0.1:5001/ai_invoke", JSON:encode(raw_json))
	next_move = nil
	player_next_move = nil
	repeat
		-- If we already got the move, don't try to request it again.
		if ((next_move == nil) or (next_move == "")) then
			next_move = http.request("http://127.0.0.1:5001/ai_retrieve")
		end
		if ((player_next_move) == nil or (player_next_move == "") or (next_move == nil) or (next_move == "")) then
			for frame = 1, 15 do
				if ((player_next_move == nil) or (player_next_move == "")) then
					ReceiveButtonInput()
				else
					ReceiveButtonInput_NoMil()
				end
			end
		end
	until ((player_next_move ~= nil) and (player_next_move ~= "") and (next_move ~= nil) and (next_move ~= ""))
	if debug_mode == 1 then
		vba.print("Enemy response:", next_move)
		vba.print("Player response:", player_next_move)
	end
	return next_move, player_next_move
end

function GetCommandTables()
	-- Ask whether we care about military mode
	if military_mode == 1 then
		mil_ai_request = AND(memory.readbyte(rLSB), 0x03)
	else
		mil_ai_request = AND(memory.readbyte(rLSB), 0x02)
	end
	airesponse = "move1"
	playerresponse = "move1"
	-- switch cases
	if mil_ai_request == 0 then
		return
	elseif mil_ai_request == 1 then
		if debug_mode == 1 then vba.print("Waiting on player...") end
		playerresponse = get_next_player_command()
		-- if debug_mode == 1 then
		if debug_mode == 1 then vba.print("[DEBUG] PLAYER RESPONSE:", playerresponse) end
		-- end
	elseif mil_ai_request == 2 then
		battlestate = readBattlestate(memory.readbyte(rLSB))
		if debug_mode == 1 then
			vba.print("[DEBUG] STATUS: ", string.format("%02x", memory.readbyte(rLSB)))
			vba.print("[DEBUG] BATTLESTATE:", battlestate)
			vba.print("Waiting on AI...")
		end
		airesponse = transferStateToAIAndWait(battlestate)
		if debug_mode == 1 then vba.print("AI RESPONSE:", airesponse) end
	else
		battlestate = readBattlestate(memory.readbyte(rLSB))
		if debug_mode == 1 then
			vba.print("[DEBUG] STATUS: ", string.format("%02x", memory.readbyte(rLSB)))
			vba.print("[DEBUG] BATTLESTATE:", battlestate)
			vba.print("Waiting on player and AI...")
		end
		airesponse, playerresponse = requestBothAIAndMilitary(battlestate)
		if debug_mode == 1 then vba.print("AI RESPONSE:", airesponse) end
	end
	return airesponse, playerresponse
end


function url_encode(str)
  if (str) then
	str = string.gsub (str, "\n", "\r\n")
	str = string.gsub (str, "([^%w %-%_%.%~])",
		function (c) return string.format ("%%%02X", string.byte(c)) end)
	str = string.gsub (str, " ", "+")
  end
  return str	
end

function playernumtotable(num)
playertable = {}

if num == 0 then
    playertable["command"] = "move1"
elseif num == 1 then
    playertable["command"] = "move2"
elseif num == 2 then
    playertable["command"] = "move3"
elseif num == 3 then
    playertable["command"] = "move4"
end

return playertable
end

function tablestobytes(airesponse, playertable)
	local bytes = 0x000000
	local byte1 = 0x00
	local byte2 = 0x00
	local byte3 = 0x00

	if airesponse == "move1" then 
		byte1 = 0x00
	elseif airesponse == "move2" then
		byte1 = 0x10
	elseif airesponse == "move3" then
		byte1 = 0x20
	elseif airesponse == "move4" then
		byte1 = 0x30
	elseif airesponse == "switch1" then
		byte1 = 0x40
	elseif airesponse == "switch2" then
		byte1 = 0x50
	elseif airesponse == "switch3" then
		byte1 = 0x60
	elseif airesponse == "switch4" then
		byte1 = 0x70
	elseif airesponse == "switch5" then
		byte1 = 0x80
	elseif airesponse == "switch6" then
		byte1 = 0x90
	elseif airesponse == "useitem1" then
		byte1 = 0xD0
	elseif airesponse == "useitem2" then
		byte1 = 0xE0
	end

	if military_mode == 1 then
		-- if playertable["command"] == "move1" then
			-- byte1 = byte1 + 0x00 --useless lel
		-- elseif playertable["command"] == "move2" then
			-- byte1 = byte1 + 0x01
		-- elseif playertable["command"] == "move3" then
			-- byte1 = byte1 + 0x02
		-- elseif playertable["command"] == "move4" then
			-- byte1 = byte1 + 0x03
		-- elseif playertable["command"] == "switch1" then
			-- byte1 = byte1 + 0x04
		-- elseif playertable["command"] == "switch2" then
			-- byte1 = byte1 + 0x05
		-- elseif playertable["command"] == "switch3" then
			-- byte1 = byte1 + 0x06
		-- elseif playertable["command"] == "switch4" then
			-- byte1 = byte1 + 0x07
		-- elseif playertable["command"] == "switch5" then
			-- byte1 = byte1 + 0x08
		-- elseif playertable["command"] == "switch6" then
			-- byte1 = byte1 + 0x09
		-- elseif playertable["command"] == "run" then
			-- byte1 = byte1 + 0x0F
		-- elseif playertable["command"] == "item" then
			-- byte2 = AND(playertable["item"], 0xFF)
			-- if playertable["poke"] ~= 0 then
				-- byte1 = byte1 + ((playertable["poke"] - 1) % 6) + 4
			-- end
			-- if playertable["move"] ~= 0 then
				-- byte3 = AND(playertable["move"], 0x03)
			-- end
		-- else
			-- vba.print("Invalid table, was given:", playertable)
		-- end
		b1, byte2, byte3 = MilitaryCommandToBytes(playertable)
		byte1 = byte1 + b1
	end
	--bytes = (byte1 * 65536) + (byte2 * 256) + byte3
	tablereturn = {byte1, byte2, byte3}
	return byte1, byte2, byte3
end

function MilitaryCommandToBytes(S)
	byte1, byte2, byte3 = 0, 0, 0
	if string.find(S, "move%d") then
		byte1 = string.match(S, "move(%d)") - 1
	elseif string.find(S, "switch%d") then
		byte1 = string.match(S, "switch(%d)") + 3
	elseif string.find(S, "item%d+") then
		if string.find(S, "item%d+p%dm%d") then
			byte2, byte1, byte3 = string.match(S, "item(%d+)p(%d)m(%d)")
			byte1 = byte1 + 3
		elseif string.find(S, "item%d+p%d") then
			byte2, byte1 = string.match(S, "item(%d+)p(%d)")
			byte1 = byte1 + 3
		else
			byte2 = string.match(S, "item(%d+)")
		end
	elseif string.find(S, "run") then
		byte1 = 15
	end
	return byte1, byte2, byte3
end

function command_to_table(playercommand)
	table_to_return = {}
	table_to_return["command"] = 0
	table_to_return["item"] = 0
	table_to_return["poke"] = 0
	table_to_return["move"] = 0

	if playercommand == "move1" then
		table_to_return["command"] = "move1"
	elseif playercommand == "move2" then
		table_to_return["command"] = "move2"
	elseif playercommand == "move3" then
		table_to_return["command"] = "move3"
	elseif playercommand == "move4" then
		table_to_return["command"] = "move4"
	elseif playercommand == "switch1" then
		table_to_return["command"] = "switch1"
	elseif playercommand == "switch2" then
		table_to_return["command"] = "switch2"
	elseif playercommand == "switch3" then
		table_to_return["command"] = "switch3"
	elseif playercommand == "switch4" then
		table_to_return["command"] = "switch4"
	elseif playercommand == "switch5" then
		table_to_return["command"] = "switch5"
	elseif playercommand == "switch6" then
		table_to_return["command"] = "switch6"
	elseif playercommand == "run" then
		table_to_return["command"] = "run"
	else
		a, b, c = string.match(playercommand, "item(%d+)p(%d)m(%d)")
		if a ~= nil then
			table_to_return["command"] = "item"
			table_to_return["item"] = a
			table_to_return["poke"] = b
			table_to_return["move"] = c
			return table_to_return
		end
		a, b = string.match(playercommand, "item(%d+)p(%d)")
		if a ~= nil then
			table_to_return["command"] = "item"
			table_to_return["item"] = a
			table_to_return["poke"] = b
			return table_to_return
		end
		a = string.match(playercommand, "item(%d+)")
		if a ~= nil then
			table_to_return["command"] = "item"
			table_to_return["item"] = a
			return table_to_return
		end
		vba.print("Something went wrong. Here's the response I got:", playercommand)
	end
	return table_to_return
end
