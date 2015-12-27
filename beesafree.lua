-- External AI handler --

-- RAM labels

EnemyDisabledMove = 0xc6f6
EnemyMonMoves     = 0xd208
EnemyMonPP        = 0xd20e
rLSB              = 0xfff1
rLSC              = 0xfff2

-- Beesafree constants

BEESAFREE_LSC_TRANSFERRING  = 0xff
BEESAFREE_LSC_COMPLETED     = 0x00

BEESAFREE_SND_RESET         = 0x00
BEESAFREE_SND_ASKMOVE       = 0x01

BEESAFREE_RES_RESET         = 0x00

-- Main code

function send(a)
	memory.writebyte(rLSB, a)
	memory.writebyte(rLSC, BEESAFREE_LSC_COMPLETED)
end

function handletransfer()
	if memory.readbyte(rLSC) ~= BEESAFREE_LSC_TRANSFERRING then return end
	req = memory.readbyte(rLSB)
	if req == BEESAFREE_SND_RESET then send(BEESAFREE_RES_RESET)
	elseif req == BEESAFREE_SND_ASKMOVE then
		-- TODO: do a real AI here, I'm just going to provide a random move choice to it
		usablemoves = {}
		dis = memory.readbyte(EnemyDisabledMove)
		for t = 0,3 do
			tt = memory.readbyte(EnemyMonMoves + t)
			pp = memory.readbyte(EnemyMonPP + t)
			if tt ~= 0 and tt ~= dis and pp >= 0 then
				table.insert(usablemoves, t)
			end
		end
		out = 0
		if #usablemoves ~= 0 then
			out = usablemoves[math.random(#usablemoves)]
		end
		send(out)
		print(string.format("Move choice #%d was selected.",out))
	end
end

memory.registerwrite(rLSC, handletransfer)