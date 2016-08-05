local server = "http://ip_du_serveur/time.php"

function getWorldTime()
	return os.time()
end

function getWorldTick()
	worldTick = (os.time() * 1000 + 18000) % 24000
	return worldTick
end

function getWorldDay()
	return os.day()
end

function canPlayerGotoBed()
	time = getWorldTick()

	if time > 12541 and time < 23458 then
		return true
	else
		return false
	end
end

function canPlayerSleep()
	time = getWorldTick()

	if time > 12541 and time < 23458 then
		return true
	else
		return false
	end
end

function isWorldDay()
	time = getWorldTick()

	if time > 0 and time < 12000 then
		return true
	else
		return false
	end
end

function isWorldNight()
	time = getWorldTick()

	if time > 13501 and time < 23000 then
		return true
	else
		return false
	end
end

function isWorldDusk()
	time = getWorldTick()

	if time > 12001 and time < 13500 then
		return true
	else
		return false
	end
end

function isWorldDawn()
	time = getWorldTick()

	if time > 23001 and time < 23999 then
		return true
	else
		return false
	end
end

function canMobsSpawn()
	time = getWorldTick()

	if time > 13187 and time < 22812 then
		return true
	else
		return false
	end
end

function canMobsBurn()
	time = getWorldTick()

	if time > 23459 or time < 12650 then
		return true
	else
		return false
	end
end

function getWorldElapsedSeconds()
	time = getWorldTick() / 1000

	elapsed = time * 50
	return elapsed
end

function getWorldHours()
	time = getWorldTick()

	hours = time / 1000 + 6

	if hours > 23 then
		hoursStr = tonumber(math.floor(hours - 24))
		hoursStr = "0"..hoursStr
	elseif hours < 10 then
		hoursStr = tonumber(math.floor(hours))
		hoursStr = "0"..hoursStr
	else
		hoursStr = tonumber(math.floor(hours))
	end

	if hoursStr == "0-1" then
		hoursStr = "23"
	end

	return hoursStr
end

function getWorldMinutes()
	time = getWorldTick()

	minutes = (time % 1000) * 60 / 1000
	minutesStr = tonumber(math.floor(minutes))

	if minutes < 10 then
		minutesStr = "0"..minutesStr
	end

	return minutesStr
end

function getWorldMoonPhase()
	local nDateMod = os.day() % 8
	local tPhasesEn = {"Full Moon", "Waning Gibbous", "Last Quarter", "Waning Crescent", "New Moon", "Waxing Crescent", "First Quarter", "Waxing Gibbous"}
	local tPhasesFr = {"Pleine Lune", "Lune Gibbeuse", "Dernier Quartier", "Dernier Croissant", "Nouvelle Lune", "Premier Croissant", "Premier Quartier", "Lune Gibbeuse"}
	
	if nDateMod == 0 then
		nDateMod = 8
	end

	if nDateMod and tPhasesEn[nDateMod] and tPhasesFr[nDateMod] then
		return nDateMod, tPhasesEn[nDateMod], tPhasesFr[nDateMod]
	end
end

function getRealMinutes()
	response = http.get(server.."?req=minutes")
	text = response.readAll()
	response.close()
	return text
end

function getRealHours()
	response = http.get(server.."?req=hours")
	text = response.readAll()
	response.close()
	return text
end

function getRealSeconds()
	response = http.get(server.."?req=seconds")
	text = response.readAll()
	response.close()
	return text
end

function getRealWeekDay()
	response = http.get(server.."?req=wday")
	text = response.readAll()
	response.close()
	return text
end

function getRealMonthDay()
	response = http.get(server.."?req=mday")
	text = response.readAll()
	response.close()
	return text
end

function getRealYear()
	response = http.get(server.."?req=year")
	text = response.readAll()
	response.close()
	return text
end

function getRealYearDay()
	response = http.get(server.."?req=yday")
	text = response.readAll()
	response.close()
	return text
end

function getRealMonth()
	response = http.get(server.."?req=mon")
	text = response.readAll()
	response.close()
	return text
end

function getWorldComplete(sep)
	if sep then
		return getWorldHours()..sep..getWorldMinutes()
	else
		return getWorldHours()..":"..getWorldMinutes()
	end
end

function getRealComplete(sep, secs, sepSec)
	if not sep then
		sep = ":"
	end

	if not sepSec then
		sepSec = "."
	end

	if secs then
		return getRealHours()..sep..getRealMinutes()..sepSec..getRealSeconds()
	else
		return getRealHours()..sep..getRealMinutes()
	end
end

function getWorldYear()
	year = os.day() / 360

	return math.floor(year)
end

function getWorldWeekDay()
	tablewday = {"Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"}
	wday = os.day() % 7

	return tablewday[wday + 1]
end

function getWorldMonth()
	tablemonth = {"January", "February", "March", "April", "May", "June", "July", "August", "Spetember", "October", "November", "December"}
	month = os.day() / 30
	month = month % 12

	return tablemonth[math.floor(month + 1)]
end

function getWorldDate()
	date = os.day() % 30

	return date + 1
end

function getDaylightOutput()
	local time = (os.time() * 1000 + 18000)%24000

	if time >= 4300 and time <= 7720 then
		return 15
	elseif time >= 3180 and time <= 8840 then
		return 14
	elseif time >= 2460 and time <= 9560 then
		return 13
	elseif time >= 1880 and time <= 10140 then
		return 12
	elseif time >= 1380 and time <= 10640 then
		return 11
	elseif time >= 940 and time <= 11080 then
		return 10
	elseif time >= 540 and time <= 11480 then
		return 9
	elseif time >= 180 and time <= 11840 then
		return 8
	elseif time >= 23960 or time <= 12040 then
		return 7
	elseif time >= 23780 or time <= 12240 then
		return 6
	elseif time >= 23540 or time <= 12480 then
		return 5
	elseif time >= 23300 or time <= 12720 then
		return 4
	elseif time >= 23080 or time <= 12940 then
		return 3
	elseif time >= 22800 or time <= 13220 then
		return 2
	elseif time >= 22340 or time <= 13680 then
		return 1
	else
		return 0
	end
end

function getDaylightOutputRain()
	local time = (os.time() * 1000 + 18000)%24000

	if time >= 4120 and time <= 7900 then
		return 12
	elseif time >= 2880 and time <= 9140 then
		return 11
	elseif time >= 2080 and time <= 9940 then
		return 10
	elseif time >= 1440 and time <= 10580 then
		return 9
	elseif time >= 900 and time <= 11120 then
		return 8
	elseif time >= 400 and time <= 11620 then
		return 7
	elseif time >= 0 and time <= 12020 then
		return 6
	elseif time >= 23760 or time <= 12260 then
		return 5
	elseif time >= 23520 or time <= 12500 then
		return 4
	elseif time >= 23240 or time <= 12780 then
		return 3
	elseif time >= 22800 or time <= 13220 then
		return 2
	elseif time >= 22340 or time <= 13680 then
		return 1
	else
		return 0
	end
end

function getDaylightOutputThunder()
	local time = (os.time() * 1000 + 18000)%24000

	if time >= 3960 and time <= 8060 then
		return 10
	elseif time >= 2620 and time <= 9400 then
		return 9
	elseif time >= 1740 and time <= 10280 then
		return 8
	elseif time >= 1040 and time <= 10980 then
		return 7
	elseif time >= 460 and time <= 11560 then
		return 6
	elseif time >= 60 and time <= 11940 then
		return 5
	elseif time >= 23700 or time <= 12300 then
		return 4
	elseif time >= 23360 or time <= 12660 then
		return 3
	elseif time >= 22960 or time <= 13060 then
		return 2
	elseif time >= 22340 or time <= 13680 then
		return 1
	else
		return 0
	end
end

function getDaylightOutputInversed()
	local time = (os.time() * 1000 + 18000)%24000

	if time >= 4300 and time <= 7720 then
		return 0
	elseif time >= 3180 and time <= 8840 then
		return 1
	elseif time >= 2460 and time <= 9560 then
		return 2
	elseif time >= 1880 and time <= 10140 then
		return 3
	elseif time >= 1380 and time <= 10640 then
		return 4
	elseif time >= 940 and time <= 11080 then
		return 5
	elseif time >= 540 and time <= 11480 then
		return 6
	elseif time >= 180 and time <= 11840 then
		return 7
	elseif time >= 23960 or time <= 12040 then
		return 8
	elseif time >= 23780 or time <= 12240 then
		return 9
	elseif time >= 23540 or time <= 12480 then
		return 10
	elseif time >= 23300 or time <= 12720 then
		return 11
	elseif time >= 23080 or time <= 12940 then
		return 12
	elseif time >= 22800 or time <= 13220 then
		return 13
	elseif time >= 22340 or time <= 13680 then
		return 14
	else
		return 15
	end
end

function getDaylightOutputInversedRain()
	local time = (os.time() * 1000 + 18000)%24000

	if time >= 4120 and time <= 7900 then
		return 3
	elseif time >= 2880 and time <= 9140 then
		return 4
	elseif time >= 2080 and time <= 9940 then
		return 5
	elseif time >= 1440 and time <= 10580 then
		return 6
	elseif time >= 900 and time <= 11120 then
		return 7
	elseif time >= 400 and time <= 11620 then
		return 8
	elseif time >= 0 and time <= 12020 then
		return 9
	elseif time >= 23760 or time <= 12260 then
		return 10
	elseif time >= 23520 or time <= 12500 then
		return 11
	elseif time >= 23240 or time <= 12780 then
		return 12
	elseif time >= 22800 or time <= 13220 then
		return 13
	elseif time >= 22340 or time <= 13680 then
		return 14
	else
		return 15
	end
end

function getDaylightOutputInversedThunder()
	local time = (os.time() * 1000 + 18000)%24000

	if time >= 3960 and time <= 8060 then
		return 5
	elseif time >= 2620 and time <= 9400 then
		return 6
	elseif time >= 1740 and time <= 10280 then
		return 7
	elseif time >= 1040 and time <= 10980 then
		return 8
	elseif time >= 460 and time <= 11560 then
		return 9
	elseif time >= 60 and time <= 11940 then
		return 10
	elseif time >= 23700 or time <= 12300 then
		return 11
	elseif time >= 23360 or time <= 12660 then
		return 12
	elseif time >= 22960 or time <= 13060 then
		return 13
	elseif time >= 22340 or time <= 13680 then
		return 14
	else
		return 15
	end
end
