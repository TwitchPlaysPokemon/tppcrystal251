--Crystal 251 Main Script v1.01--

dofile("readstates.lua")
dofile("battle_ram.lua")
dofile("constants.lua")
dofile("fastclock.lua")
package.path = package.path..';./libs/lua/?.lua'
package.cpath = package.cpath..';./libs/?.dll'
local http = require("socket.http")
local ltn12 = require("ltn12")

EnemyDisableCount = 0xc67d
EnemyMonMoves     = 0xd208
EnemyMonPP        = 0xd20e
PlayerDisableCount = 0xc675
BattleMonMoves     = 0xc62e
BattleMonPP        = 0xc634
rLSB              = 0xfff1
rLSC              = 0xfff2
hMilitary        = 0xfff3

-- other stuff --

BEESAFREE_LSC_TRANSFERRING  = 0xff
BEESAFREE_LSC_COMPLETED     = 0x00

BEESAFREE_SND_RESET         = 0x00
BEESAFREE_SND_ASKMOVE       = 0x01
BEESAFREE_SND_ASKITEM       = 0x02

BEESAFREE_RES_RESET         = 0x00

military_mode = 0 -- 0 for off, 1 for on
lastBattleState = 0
ignore_serial = 0 -- please set this to 0 for normal use.
lua_wait = 0
bank_wait = 0
debug_mode = 0 --print EVERYTHING aside from basic info if 1, none if 0

function refreshinterval(seconds)
	-- Revo's function (liar, it's Timmy's function)
	local lastupdate = os.time()
	local now
	repeat
		now = os.time()
		emu.frameadvance()
	until now - lastupdate >= seconds
	lastupdate = now
	return true
end

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

function get_next_player_command()
	repeat
		player_next_move = http.request("http://localhost:5000/gbmode_inputs_ai/")
		if (player_next_move == nil or player_next_move == "") then
			for frame = 1, 15 do
				emu.frameadvance()
			end
		end
	until (player_next_move ~= nil or player_next_move ~= "")
	vba.print("Player response:", player_next_move)
    return player_next_move
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
		if playertable["command"] == "move1" then
			byte1 = byte1 + 0x00 --useless lel
		elseif playertable["command"] == "move2" then
			byte1 = byte1 + 0x01
		elseif playertable["command"] == "move3" then
			byte1 = byte1 + 0x02
		elseif playertable["command"] == "move4" then
			byte1 = byte1 + 0x03
		elseif playertable["command"] == "switch1" then
			byte1 = byte1 + 0x04
		elseif playertable["command"] == "switch2" then
			byte1 = byte1 + 0x05
		elseif playertable["command"] == "switch3" then
			byte1 = byte1 + 0x06
		elseif playertable["command"] == "switch4" then
			byte1 = byte1 + 0x07
		elseif playertable["command"] == "switch5" then
			byte1 = byte1 + 0x08
		elseif playertable["command"] == "switch6" then
			byte1 = byte1 + 0x09
		elseif playertable["command"] == "run" then
			byte1 = byte1 + 0x0F
		elseif playertable["command"] == "item" then
			byte2 = playertable["item"]
			if playertable["poke"] ~= 0 then
				byte1 = byte1 + playertable["poke"] + 3
			end
			if playertable["move"] ~= 0 then
				byte3 = playertable["move"]
			end
		end
	end
	--bytes = (byte1 * 65536) + (byte2 * 256) + byte3
	-- tablereturn = {byte1, byte2, byte3}
	return byte1, byte2, byte3
end
