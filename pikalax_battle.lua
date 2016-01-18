
-- PikalaxALT's first attempt at lua to read battle state
-- AKA readbattlestate_clean.lua


loadfile "pikalax_constants.lua"

function getBigDW(pointer)
	-- There is no built-in for big-endian DWs, which are used extensively in battle structs.
	return memory.readbyte(pointer) * 256 + memory.readbyte(pointer + 1)
end

function refreshinterval(seconds)
	-- Revo's function
	local lastupdate = os.time()
	local now
	repeat
		now = os.time()
		emu.frameadvance()
	until now - lastupdate >= seconds
	lastupdate = now
	return true
end


function getMove(movePointer, ppPointer)
	local move = {}
	move_idx = memory.readbyte(movePointer)
	if move_idx == 0 then return nil end
	move["move"] = moveTable[move_idx + 1]
	tempPP = memory.readbyte(ppPointer)
	move["pp"] = AND(tempPP, 0x3f)
	move["ppUp"] = (AND(tempPP, 0xc0)) / 0x40
	move["maxpp"] = PPVal[move_idx]
	return move
end

function getMoves(movePointer, ppPointer)
	local moves = {}
	for i = 0, 3 do
		moves[string.format("move%d",i+1)] = getMove(movePointer + i, ppPointer + i)
	end
	return moves
end

function getMonStatus(pointer)
	status = memory.readbyte(pointer)
	if (AND(status, 0x7) ~= 0) then
		return string.format("SLP (%d turns)", AND(status, 0x7))
	elseif (AND(status, 0x08) ~= 0) then
		return "PSN"
	elseif (AND(status, 0x10) ~= 0) then
		return "BRN"
	elseif (AND(status, 0x20) ~= 0) then
		return "FRZ"
	elseif (AND(status, 0x40) ~= 0) then
		return "PRZ"
	else return "NONE"
	end
end

function calcGender(dvs, species)
	-- Reproduce gender calculation from Pokemon Crystal
	baseGender = GRVal[species]
	if (baseGender == 255) then return "None" end
	if (baseGender == 0)   then return "Male" end
	if (baseGender == 254) then return "Female" end
	attPlusSpeed = dvs["atk"] * 16 + dvs["spd"]
	if (baseGender < attPlusSpeed) then return "Male" else return "Female" end
end

function getMonType(pointer)
	type1 = memory.readbyte(pointer)
	type2 = memory.readbyte(pointer + 1)
	if (type1 == type2) then
		return typeTable[type1]
	else
		return string.format("%s / %s", typeTable[type1+1], typeTable[type2+1])
	end
end

function getMonBattleState(pointer)
	-- init
	local mon = {}
	local dvs = {}
	local stats = {}
	-- read
	species_idx = memory.readbyte(pointer + 0)
	mon["species"] = speciesTable[species_idx]
	mon["item"] = itemTable[memory.readbyte(pointer + 1)]
	mon["moves"] = getMoves(pointer + 2, pointer + 8)
	dvs["atk"] = AND(memory.readbyte(pointer + 6),0xf0) / 16
	dvs["def"] = memory.readbyte(pointer + 6) % 16
	dvs["spd"] = AND(memory.readbyte(pointer + 7),0xf0) / 16
	dvs["spc"] = memory.readbyte(pointer + 7) % 16
	mon["dvs"] = dvs
	mon["happiness"] = memory.readbyte(pointer + 12)
	mon["level"] = memory.readbyte(pointer + 13)
	mon["status"] = getMonStatus(pointer + 14)
	mon["hp"] = getBigDW(pointer + 16)
	mon["gender"] = calcGender(dvs, species_idx)
	stats["maxhp"] = getBigDW(pointer + 18)
	stats["attack"] = getBigDW(pointer + 20)
	stats["defense"] = getBigDW(pointer + 22)
	stats["speed"] = getBigDW(pointer + 24)
	stats["spatk"] = getBigDW(pointer + 26)
	stats["spdef"] = getBigDW(pointer + 28)
	mon["stats"] = stats
	mon["type"] = getMonType(pointer + 30)
	return mon
end

function getPlayerPokemonData()
	return getMonBattleState(0xc62c)
end

function getEnemyPokemonData()
	return getMonBattleState(0xd206)
end

repeat
    battleState = {}
    wBattleMode = memory.readbyte(0xD22D)
    rSVBK = memory.readbyte(0xFF70)
    
    vba.print("rSVBK: ", rSVBK)

	if rSVBK == 1 then
		if wBattleMode == 0 then
			vba.print("Not in battle")
		else
			if wBattleMode == 2 then
				battleState["enemy type"] = "TRAINER"
				-- battleState["class"] = getTrainerClass()
				-- battleState["trainer items"] = getItems()
			elseif wBattleMode == 1 then 
				battleState["enemy type"] = "WILD"
			end
			-- battleState["turn"] = getTurns()
			-- battleState["enemyscreens"] = getEnemyScreens()
			-- battleState["playerscreens"] = getPlayerScreens()
			-- battleState["weather"] = getWeather()
			battleState["playerpokemon"] = getPlayerPokemonData()
			battleState["enemypokemon"] = getEnemyPokemonData()
			vba.print(battleState)
		end
    else 
        vba.print("Waiting for bank switch...")
    end
until not refreshinterval(0.100)
