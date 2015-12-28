-- Fast Clock --
-- 1 ingame day = 10 real hours --

-- RAM labels --

hRTCDayLo   = 0xff8e
hRTCHours   = 0xff8f
hRTCMinutes = 0xff90
hRTCSeconds = 0xff91

-- Constants --

stream_start = 1455310800.0 -- 12 Feb 2016, 2100 UTC
last = 0
ms = 0 -- os.time isn't accurate up to millisecond precision

-- Main Code 

function updateclock()
	tim = os.time()
	if tim ~= last then
		ms = 0
		last = tim
	else ms = ms + 1 end
	diff = tim - stream_start + (ms / 60)
	diff = diff * 12.0 / 5.0
	t = math.floor(diff / 86400) % 7
	memory.writebyte(hRTCDayLo, t)
	t = math.floor(diff / 3600) % 24
	memory.writebyte(hRTCHours, t)
	t = math.floor(diff / 60) % 60
	memory.writebyte(hRTCMinutes, t)
	t = diff % 60
	memory.writebyte(hRTCSeconds, t)
end

vba.registerbefore(updateclock)
