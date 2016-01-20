
-- PikalaxALT's first attempt at lua to read battle state
-- AKA readbattlestate_clean.lua
-- Version 0.3.1
JSON = (loadfile "JSON.lua")()
dofile("battle_ram.lua")
dofile("constants.lua")
militaryMode = 0

function getBigDW(pointer)
	-- There is no built-in for big-endian DWs, which are used extensively in battle structs.
	return memory.readbyte(pointer) * 256 + memory.readbyte(pointer + 1)
end

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

function parseString(start_addr, length)
	outstr = ""
	vba.print(charmap)
	for i = 0, length do
		curr_byte = memory.readbyte(start_addr + i)
		if curr_byte == 0x50 then return outstr end
		if curr_byte < 0x7f then return outstr end
		vba.print(string.format("%02X - %s",curr_byte, charmap[curr_byte - 0x7f + 1]))
		outstr = outstr .. charmap[curr_byte - 0x7f + 1]
	end
end

function getMove(movePointer, ppPointer)
	local move = {}
	move_idx = memory.readbyte(movePointer)
	if move_idx == 0 then return nil end
	move["move"] = moveTable[move_idx + 1]
	tempPP = memory.readbyte(ppPointer)
	move["curpp"] = AND(tempPP, 0x3f)
	move["ppUp"] = (AND(tempPP, 0xc0)) / 0x40
	move["maxpp"] = PPVal[move_idx] * (move["ppUp"] + 5) / 5
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
	if species == 0 then return "None" end
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
		return typeTable[type1+1]
	else
		return string.format("%s / %s", typeTable[type1+1], typeTable[type2+1])
	end
end

function getDVs(pointer)
	local dvs = {}
	dvs["atk"] = AND(memory.readbyte(pointer),0xf0) / 16
	dvs["def"] = memory.readbyte(pointer) % 16
	dvs["spd"] = AND(memory.readbyte(pointer + 1),0xf0) / 16
	dvs["spc"] = memory.readbyte(pointer + 1) % 16
	dvs["hp"] = AND(dvs["atk"], 1) * 8 + AND(dvs["def"], 1) * 4 + AND(dvs["spd"], 1) * 2 + AND(dvs["spc"], 1)
	return dvs
end

function getMonBattleState(pointer)
	-- init
	local mon = {}
	local stats = {}
	-- read
	species_idx = memory.readbyte(pointer + 0)
	if species_idx == 0 then return end
	mon["species"] = speciesTable[species_idx]
	mon["item"] = itemTable[memory.readbyte(pointer + 1) + 1]
	mon["moves"] = getMoves(pointer + 2, pointer + 8)
	mon["dvs"] = getDVs(pointer + 6)
	mon["happiness"] = memory.readbyte(pointer + 12)
	mon["level"] = memory.readbyte(pointer + 13)
	mon["status"] = getMonStatus(pointer + 14)
	mon["hp"] = getBigDW(pointer + 16)
	mon["gender"] = calcGender(mon["dvs"], species_idx)
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

function getSubstatus(flags, counts, subhp, lockedmove)
	local subStatus = {}
	substatus1 = memory.readbyte(flags + 0)
	substatus2 = memory.readbyte(flags + 1)
	substatus3 = memory.readbyte(flags + 2)
	substatus4 = memory.readbyte(flags + 3)
	substatus5 = memory.readbyte(flags + 4)

	-- substatus1
	if (AND(substatus1, 0x01) ~= 0) then table.insert(subStatus, "nightmare") end
	if (AND(substatus1, 0x02) ~= 0) then table.insert(subStatus, "curse") end
	if (AND(substatus1, 0x04) ~= 0) then subStatus["protect"] = memory.readbyte(counts + 7) end
	if (AND(substatus1, 0x08) ~= 0) then table.insert(subStatus, "identified") end
	if (AND(substatus1, 0x10) ~= 0) then subStatus["perish song"] = memory.readbyte(counts + 5) end
	if (AND(substatus1, 0x20) ~= 0) then table.insert(subStatus, "endure") end
	if (AND(substatus1, 0x40) ~= 0) then subStatus["rollout"] = memory.readbyte(counts + 0) end
	if (AND(substatus1, 0x80) ~= 0) then table.insert(subStatus, "attract") end

	-- substatus2
	if (AND(substatus2, 0x01) ~= 0) then table.insert(subStatus, "curled") end

	-- substatus3
	if (AND(substatus3, 0x01) ~= 0) then table.insert(subStatus, "bide") end
	if (AND(substatus3, 0x02) ~= 0) then table.insert(subStatus, "rampage") end
	if (AND(substatus3, 0x04) ~= 0) then table.insert(subStatus, "multihit") end
	if (AND(substatus3, 0x08) ~= 0) then table.insert(subStatus, "flinch") end
	if (AND(substatus3, 0x10) ~= 0) then table.insert(subStatus, "charged") end
	if (AND(substatus3, 0x20) ~= 0) then table.insert(subStatus, "underground") end
	if (AND(substatus3, 0x40) ~= 0) then table.insert(subStatus, "flying") end
	if (AND(substatus3, 0x80) ~= 0) then subStatus["confused"] = memory.readbyte(counts + 1) end

	-- substatus4
	if (AND(substatus4, 0x01) ~= 0) then table.insert(subStatus, "x accuracy") end
	if (AND(substatus4, 0x02) ~= 0) then table.insert(subStatus, "mist") end
	if (AND(substatus4, 0x04) ~= 0) then table.insert(subStatus, "pumped") end
	if (AND(substatus4, 0x10) ~= 0) then subStatus["substitute"] = memory.readbyte(subhp) end
	if (AND(substatus4, 0x20) ~= 0) then table.insert(subStatus, "recharge") end
	if (AND(substatus4, 0x40) ~= 0) then subStatus["raging"] = memory.readbyte(counts + 6) end
	if (AND(substatus4, 0x80) ~= 0) then table.insert(subStatus, "seeded") end

	-- substatus5
	if (AND(substatus5, 0x01) ~= 0) then substatus["toxic"] = memory.readbyte(counts + 2) end
	if (AND(substatus5, 0x04) ~= 0) then table.insert(subStatus, "transformed") end
	if (AND(substatus5, 0x10) ~= 0) then
		local encore = {}
		encore["count"] = memory.readbyte(counts + 4)
		encore["move idx"] = memory.readbyte(lockedmove)
		subStatus["encore"] = encore
	end
	if (AND(substatus5, 0x20) ~= 0) then table.insert(subStatus, "lock on") end
	if (AND(substatus5, 0x40) ~= 0) then table.insert(subStatus, "destiny bond") end
	if (AND(substatus5, 0x80) ~= 0) then table.insert(subStatus, "trapped") end
	return subStatus
end

function getWeather()
	weather = memory.readbyte(0xc70a)
	if weather >= 4 then return string.format("%s end", weatherTable[weather - 2]) end
	if weather == 0 then return "Clear" end
	return string.format("%s (%d turns left)", weatherTable[weather + 1], memory.readbyte(0xc70b))
end

function getScreens(flags, counts)
	local screens = {}
	screenflags = memory.readbyte(flags)
	if (AND(screenflags, 0x03) ~= 0) then
		screens["spikes"] = AND(screenflags, 0x03)
	end
	if (AND(screenflags, 0x04) ~= 0) then
		screens["safeguard"] = memory.readbyte(counts + 0)
	end
	if (AND(screenflags, 0x08) ~= 0) then
		screens["light screen"] = memory.readbyte(counts + 1)
	end
	if (AND(screenflags, 0x10) ~= 0) then
		screens["reflect"] = memory.readbyte(counts + 2)
	end
	return screens
end

function getStatLevels(pointer)
	local statLevels = {}
	statLevels["atk"] = memory.readbyte(pointer + 0) - 7
	statLevels["def"] = memory.readbyte(pointer + 1) - 7
	statLevels["spd"] = memory.readbyte(pointer + 2) - 7
	statLevels["satk"] = memory.readbyte(pointer + 3) - 7
	statLevels["sdef"] = memory.readbyte(pointer + 4) - 7
	statLevels["acc"] = memory.readbyte(pointer + 5) - 7
	statLevels["eva"] = memory.readbyte(pointer + 6) - 7
	return statLevels
end

function getPlayerPokemonData()
	playerMon = getMonBattleState(BattleMonSpecies)
	if playerMon == nil then return end
	playerMon["subStatus"] = getSubstatus(PlayerSubStatus1, PlayerRolloutCount, PlayerSubstituteHP, LastPlayerMon)
	playerMon["screens"] = getScreens(PlayerScreens, PlayerSafeguardCount)
	playerMon["turns"] = memory.readbyte(PlayerTurnsTaken)
	playerMon["stat levels"] = getStatLevels(PlayerAtkLevel)
	lastMove = memory.readbyte(LastPlayerMove)
	if lastMove == 0 then
		playerMon["last used"] = "None"
	else
		playerMon["last used"] = moveTable[lastMove + 1]
	end
	return playerMon
end

function getEnemyPokemonData()
	enemyMon = getMonBattleState(EnemyMonSpecies)
	if enemyMon == nil then return end
	enemyMon["subStatus"] = getSubstatus(EnemySubStatus1, EnemyRolloutCount, EnemySubstituteHP, LastPlayerMove)
	enemyMon["screens"] = getScreens(EnemyScreens, PlayerLightScreenCount)
	enemyMon["turns"] = memory.readbyte(EnemyTurnsTaken)
	enemyMon["stat levels"] = getStatLevels(EnemyAtkLevel)
	lastMove = memory.readbyte(LastEnemyMove)
	if lastMove == 0 then
		enemyMon["last used"] = "None"
	else
		enemyMon["last used"] = moveTable[lastMove + 1]
	end
	return enemyMon
end

function getTrainerClass()
	return trainerClassTable[memory.readbyte(OtherTrainerClass)]
end

function getTrainerItems()
	local trainerItems = {}
	trainerItems["item1"] = itemTable[memory.readbyte(wEnemyTrainerItem1)+1]
	trainerItems["item2"] = itemTable[memory.readbyte(wEnemyTrainerItem2)+1]
	return trainerItems
end

function getTrainerParty(partycount_addr)
	local trainerParty = {}
	trainerParty["length"] = memory.readbyte(partycount_addr)
	local mons = {}
	local party = {}
	for i = 1, trainerParty["length"] do
		table.insert(mons, speciesTable[memory.readbyte(partycount_addr + i)])
		local curr_mon = {}
		mon_pointer = partycount_addr + 8 + 48 * (i - 1)
		species_idx = memory.readbyte(mon_pointer + 0)
		curr_mon["species"] = speciesTable[species_idx]
		curr_mon["item"] = itemTable[memory.readbyte(mon_pointer + 1) + 1]
		curr_mon["moves"] = getMoves(mon_pointer + 2, mon_pointer + 23)
		curr_mon["id"] = getBigDW(mon_pointer + 6)
		curr_mon["exp"] = memory.readbyte(mon_pointer + 8) * 0x10000 + memory.readbyte(mon_pointer + 9) * 0x100 + memory.readbyte(mon_pointer + 10)
		local statexp = {}
		statexp["hp"] = getBigDW(mon_pointer + 11)
		statexp["atk"] = getBigDW(mon_pointer + 13)
		statexp["def"] = getBigDW(mon_pointer + 15)
		statexp["spd"] = getBigDW(mon_pointer + 17)
		statexp["spc"] = getBigDW(mon_pointer + 19)
		curr_mon["statexp"] = statexp
		curr_mon["dvs"] = getDVs(mon_pointer + 21)
		curr_mon["happiness"] = memory.readbyte(mon_pointer + 27)
		local pokerus = {}
		pkrs_byte = memory.readbyte(mon_pointer + 28)
		if pkrs_byte == 0 then
			pokerus["strain"] = "None"
			pokerus["count"] = "Uninfected"
		else
			pokerus["strain"] = AND(pkrs_byte, 0xf0) / 16
			if AND(pkrs_byte, 0xf) == 0 then
				pokerus["count"] = "Immune"
			else
				pokerus["count"] = AND(pkrs_byte, 0xf)
			end
		end
		curr_mon["pokerus"] = pokerus
		curr_mon["level"] = memory.readbyte(mon_pointer + 31)
		curr_mon["gender"] = calcGender(curr_mon["dvs"], species_idx)
		curr_mon["status"] = getMonStatus(mon_pointer + 32)
		curr_mon["hp"] = getBigDW(mon_pointer + 34)
		local stats = {}
		stats["maxhp"] = getBigDW(mon_pointer + 36)
		stats["attack"] = getBigDW(mon_pointer + 38)
		stats["defense"] = getBigDW(mon_pointer + 40)
		stats["speed"] = getBigDW(mon_pointer + 42)
		stats["spatk"] = getBigDW(mon_pointer + 44)
		stats["spdef"] = getBigDW(mon_pointer + 46)
		curr_mon["stats"] = stats
		curr_mon["nickname"] = parseString(partycount_addr + 8 + 48 * 6 + 11 * 6 + 11 * (i - 1), 11)
		table.insert(party, curr_mon)
	end
	trainerParty["mons"] = mons
	trainerParty["party"] = party
	return trainerParty
end

function readPlayerPack()
	local pack = {}
	local items = {}
	local balls = {}
	local key = {}
	local tmhm = {}
	numItems = memory.readbyte(NumItems)
	for i = 1, numItems do
		items[itemTable[memory.readbyte(Items + 2 * (i-1)) + 1]] = memory.readbyte(Items + 2 * (i-1) + 1)
	end
	numBalls = memory.readbyte(NumBalls)
	for i = 1, numBalls do
		balls[itemTable[memory.readbyte(Balls + 2 * (i-1)) + 1]] = memory.readbyte(Balls + 2 * (i-1) + 1)
	end
	numKeys = memory.readbyte(NumKeyItems)
	for i = 1, numKeys do
		table.insert(key, itemTable[memory.readbyte(KeyItems + (i-1)) + 1])
	end
	for i = 1, 50 do
		if memory.readbyte(TMsHMs + (i-1)) ~= 0 then
			table.insert(tmhm, string.format("TM%02d", i))
		end
	end
	for i = 1, 7 do
		if memory.readbyte(TMsHMs + (i+50-1)) ~= 0 then
			table.insert(tmhm, string.format("HM%02d", i))
		end
	end
	pack["items"] = items
	pack["balls"] = balls
	pack["key"] = key
	pack["tmhm"] = tmhm
	return pack
end

function readBattlestate() --read this ONLY when LUA Serial is called
    battleState = {}
    battlemode = memory.readbyte(wBattleMode)
    svbk = memory.readbyte(rSVBK)
    
    vba.print("WRAM bank: ", svbk)

	if svbk == 1 then
		--local output_table = {}
		--playerParty = getTrainerParty(0xdcd7)
		--vba.print("Player Party:")
		--vba.print(playerParty)
		--pack = readPlayerPack()
		--vba.print("Player Pack:")
		--vba.print(pack)
		--output_table["playerParty"] = playerParty
		--output_table["pack"] = pack
		if battlemode == 0 then
			vba.print("Not in battle")
			memory.writebyte(wMilitaryMode, militaryMode)
		else
			if battlemode == 2 then
				battleState["enemy type"] = "TRAINER"
				battleState["trainer class"] = getTrainerClass()
				battleState["trainer items"] = getTrainerItems()
				enemyParty = getTrainerParty(OTPartyCount)
				vba.print("Enemy Party:")
				vba.print(enemyParty)
				output_table["enemyParty"] = enemyParty
			elseif battlemode == 1 then 
				battleState["enemy type"] = "WILD"
			end
			battleState["weather"] = getWeather()
			battleState["playerpokemon"] = getPlayerPokemonData()
			battleState["enemypokemon"] = getEnemyPokemonData()
			vba.print("Battle State:")
			vba.print(battleState)
			output_table["battleState"] = battleState
		end
		local raw_json = JSON:encode(output_table)
		file = io.open("battlestate.json", "w+")
        -- call transferStateToAIAndWait() here and calculate the bytes to 
		io.output(file)
		io.write(raw_json)
		io.close(file)
    else
        vba.print("Waiting for bank switch...")
    end
end

function transferStateToAIAndWait()
	-- transfer to AI and get a response here
	-- if Military mode is on, then wait for the first valid player shortcut command, if not, ignore
	-- calculate the bytes to write to DFF8 and DFF9, write them, then end here and resume looping playerstate reading
	send(0) -- TODO
end

function send(a)
	memory.writebyte(rLSB, a)
	memory.writebyte(rLSC, BEESAFREE_LSC_COMPLETED)
end

function readPlayerstate() --loop read this for the overlay
    svbk = memory.readbyte(rSVBK)
    local output_table = {}
    vba.print("WRAM bank: ", svbk)
	if svbk == 1 then
		playerParty = getTrainerParty(PartyCount)
		vba.print("Player Party:")
		vba.print(playerParty)
		pack = readPlayerPack()
		vba.print("Player Pack:")
		vba.print(pack)
		output_table["playerParty"] = playerParty
		output_table["pack"] = pack
		if memory.readbyte(rLSC) ~= BEESAFREE_LSC_TRANSFERRING then return end
		req = memory.readbyte(rLSB)
		if req == BEESAFREE_SND_RESET then send(BEESAFREE_RES_RESET)
		elseif req == BEESAFREE_SND_ASKMOVE then
			readBattlestate()
			transferStateToAIAndWait()
		end
	end
end

repeat
    readPlayerstate()
until not refreshinterval(0.100)
