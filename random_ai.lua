-- RAM labels

dofile("constants.lua")

EnemyDisabledMove = 0xc6f6
EnemyMonMoves     = 0xd208
EnemyMonPP        = 0xd20e
PlayerDisabledMove = 0xc6f5
PlayerMonMoves     = 0xc62e
PlayerMonPP        = 0xc634
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

function checkLUASerial()
    if memory.readbyte(rLSC) == BEESAFREE_LSC_TRANSFERRING then
        aiusablemoves = {}
        playerusablemoves = {}
        disai = memory.readbyte(EnemyDisabledMove)
        displayer = memory.readbyte(PlayerDisabledMove)
        for t = 0,3 do
			ttai = memory.readbyte(EnemyMonMoves + t)
			ppai = (memory.readbyte(EnemyMonPP + t)) and 0x3f -- Upper two bits are the PP Up counters
			if ttai ~= 0 and ttai ~= disai and ppai >= 0 then
				table.insert(aiusablemoves, t)
			end
		end
        for t = 0,3 do
			tt = memory.readbyte(PlayerMonMoves + t)
			pp = (memory.readbyte(PlayerMonPP + t)) and 0x3f -- Upper two bits are the PP Up counters
			if tt ~= 0 and tt ~= displayer and pp >= 0 then
				table.insert(playerusablemoves, t)
			end
		end
		out = 0
        outplayer = 0
        outai = 0
		if #aiusablemoves ~= 0 then
			outai = aiusablemoves[math.random(#aiusablemoves)]
		end
        if #playerusablemoves ~= 0 then
			outplayer = playerusablemoves[math.random(#playerusablemoves)]
		end
        
        out = (outai * 16) + outplayer
        memory.writebyte(0xDFF8, out)
        memory.writebyte(0xDFF9, 0x00)
        memory.writebyte(0xDFFA, 0x00)
        vba.print(string.format("Player: Move choice #%d, %s was selected.",outplayer+1, moveTable[memory.readbyte(0xc62e+outplayer)+1]))
        vba.print(string.format("AI: Move choice #%d, %s was selected.",outai+1, moveTable[memory.readbyte(0xd208+outai)+1]))
        vba.print("LUA serial! Wrote completed bytes.") -- it did not, was just a test
        memory.writebyte(rLSB, BEESAFREE_LSC_COMPLETED) -- write the response here but whatever
        memory.writebyte(rLSC, BEESAFREE_LSC_COMPLETED)
    else
        vba.print("Waiting on LUA serial...")
    end
end

repeat
    checkLUASerial()
until not refreshinterval(0.100)
