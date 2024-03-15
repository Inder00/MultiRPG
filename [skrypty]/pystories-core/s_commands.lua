--[[
	Resource: OURGame v2
	Developers: Split | Yolos
	You have no right to use this code without permission.
	(c) 2016  All rights reserved.
]]

function RGBToHex(red, green, blue, alpha)
	if((red < 0 or red > 255 or green < 0 or green > 255 or blue < 0 or blue > 255) or (alpha and (alpha < 0 or alpha > 255))) then
		return nil
	end
	if(alpha) then
		return string.format("#%.2X%.2X%.2X%.2X", red,green,blue,alpha)
	else
		return string.format("#%.2X%.2X%.2X", red,green,blue)
	end
end

local settings = {
['swearFilter'] = {
	['enabled'] = true,
	['swears'] = { -- Allows you to set the blocked swear words, syntax is ['WORD'] = 'REPLACEMENT'
		['kurwa'] = '****',
		['cwel'] = '****',
		['kurwą'] = '****',
		['c w e l'] = '****',
		['k u r w a'] = '****',
		['cwelem'] = '******',
		['c w e l e m'] = '****',
		['k u r w ą'] = '****',
		['szmata'] = '****',
		['dziwka'] = '****',
		['japierdole'] = '****',
		['jajebie'] = '****',
		['jebie'] = '****',
		['jebany'] = '****',
		['jeban'] = '****',
		['kurwo'] = '****',
		['frajer'] = '****',
		['frajerze'] = '****',
		['pierdolona'] = '****',
		['ja pierdole'] = '****',
		['pierdol'] = '****',
		['pierdolenie'] = '****',
		['chuj'] = '****',
		['szmato'] = '****',
		['dziwko'] = '****',
		['pedał'] = '****',
		['pedal'] = '****',
		['pedały'] = '****',
		['frjerzy'] = '****',
		['frajerka'] = '****',
		['pizda'] = '****',
		['pizdy'] = '****',
		['pizdochlap'] = '****',
		['spierdalaj'] = '****',
		['suka'] = '****',
		['sukinsyn'] = '****',
		['wyjebie'] = '****',
		['wyjebane'] = '****',
		['wypierdalaj'] = '****',
		['chuju'] = '****',
		['chuje'] = '****',
		['kórwa'] = '****',
		['kórva'] = '****',
		['kurva'] = '****',
		['skurwielu'] = '****',
		['sukinsyn'] = '****',
		['zjebany'] = '****',
		['zjebane'] = '****',
		['zjebani'] = '****',
		['wypierdalajcie'] = '****',
		['wkurwia'] = '****',
		['wkurwiacie'] = '****',
		['wkurwiajcie'] = '****',
		['wkórwiajcie'] = '****',
		['fkórwiajcie'] = '****',
		['fkurwiajcie'] = '****',
		['wkórwiacie'] = '****',
		['wkórwiony'] = '****',
		['wkurviony'] = '****',
		['wkórviony'] = '****',
		['jebne'] = '****',
		['jebany'] = '****',
		['jebana'] = '****',
		['jebnięty'] = '****',
		['zajebany'] = '****',
		['zjebusie'] = '****',
		['wykurwinator'] = '****',
		['wykurwiacie'] = '****',
		['wykurwiaj'] = '****',
		}
},
}

local words = {"22003",":220","78.157","23.235","22015","22010","22020","22017","mtasa://"}

function onPrivateMessage(plr, cmd, target, ...)
	if not (getElementData(plr, "player:logged") == true) then return end
    if not target or not {...} then
    	outputChatBox('* Użyj /pm <nick/ID> <treść>', plr)
    	return
    end
	if getElementData(plr, "mute:player") then
		outputChatBox("* Jesteś wyciszony!", plr)
		return
	end
	if ninjaban(msg) then
	kickPlayer(plr, "Anty-Reklama")
	triggerClientEvent(root, "admin:rendering", root, "* ["..getElementData(plr,"id").."]"..getPlayerName(plr):gsub("#%x%x%x%x%x%x","").." został(a) wyrzucony(a) przez System, powód: Reklama")
	return end
    local text=table.concat({...}, ' ')
    local target=findPlayer(plr, target)
    if not target then
		outputChatBox("* Nie znaleziono podanego gracza.", plr)
        return
    end
	if not (getElementData(target, "player:logged") == true) then
		outputChatBox("* Gracz nie jest zalogowany.", plr)
	return end

	--[[if settings['swearFilter']['enabled'] then
		for i, v in pairs(settings['swearFilter']['swears']) do
			while text:lower():find(i:lower(),1,true) do
				local start, end_ = text:lower():find(i:lower(),1,true)
				local found = text:sub(start,end_)
				text = text:gsub(found,v)
			end
		end
	end--]]
	
	local pmoff=getElementData(target,"pmoff")
    if (pmoff) then
		outputChatBox("* "..getPlayerName(target):gsub("#%x%x%x%x%x%x","").." nie akceptuje wiadomości prywatnych.", plr)
		if (type(pmoff)=="string") then
			outputChatBox("* Powód: " .. pmoff, plr)
		end
	return
	end

    if getElementData(plr,"pmoff") then
      outputChatBox("* Posiadasz wyłączone wiadomości prywatne. Ta osoba nie będzie mogła Ci odpisać.", plr)
    end
	
	if getElementData(target, "mute:player") then
		outputChatBox("* Ten gracz jest wyciszony, nie odpisze Ci!", plr)
		return
	end

    outputChatBox(">> ["..getElementData(target,"id").."]"..getPlayerName(target):gsub("#%x%x%x%x%x%x","")..": "..text.."", plr, 245, 219, 0, true)
	outputChatBox("<< ["..getElementData(plr,"id").."]"..getPlayerName(plr):gsub("#%x%x%x%x%x%x","")..": "..text.."", target, 225, 199, 0, true)
	playSoundFrontEnd(target, 12)
  	local pm_text=('[PM] [%d]%s(sid:%d) >> [%d]%s(sid:%d): %s'):format(getElementData(plr,"id"), getPlayerName(plr):gsub("#%x%x%x%x%x%x",""), getElementData(plr,"player:sid"), getElementData(target,"id"), getPlayerName(target):gsub("#%x%x%x%x%x%x",""), getElementData(target,"player:sid"), text)
	triggerEvent("admin:logs", root, pm_text)
	triggerClientEvent(root, "onDebugMessage", resourceRoot, pm_text:gsub("#%x%x%x%x%x%x",""),1, "PM")
	outputServerLog(pm_text)
	triggerEvent("admin:addText", resourceRoot, pm_text:gsub("#%x%x%x%x%x%x",""))
end
addCommandHandler('pw', onPrivateMessage)
addCommandHandler('pm', onPrivateMessage)
addCommandHandler('w', onPrivateMessage)

function RGBToHex(red, green, blue, alpha)
	if((red < 0 or red > 255 or green < 0 or green > 255 or blue < 0 or blue > 255) or (alpha and (alpha < 0 or alpha > 255))) then
		return nil
	end
	if(alpha) then
		return string.format("#%.2X%.2X%.2X%.2X", red,green,blue,alpha)
	else
		return string.format("#%.2X%.2X%.2X", red,green,blue)
	end
end

 addCommandHandler("pmon", function(plr,cmd)
   removeElementData(plr,"pmoff")
   outputChatBox("* Akceptujesz wszystkie wiadomości prywatne.", plr)
   return
   end)

   addCommandHandler("pmoff", function(plr,cmd,...)
   local powod=table.concat({...}, ' ')
   if (not powod or string.len(powod)<2) then powod=true end
   setElementData(plr, "pmoff", powod)
   outputChatBox("* Nie akceptujesz wiadomości prywatnych.", plr)
   return
   end)

function onTransferMoney(plr, cmd, target, value)
    if not target or not tonumber(value) then
        outputChatBox('* Użyj: /przelej <nick/ID> <kwota>', plr)
        return
    end
    value=string.match(value, "%d*")
	value=tonumber(value)
    local target=findPlayer(plr,target)
    if not target then
		outputChatBox("* Nie znaleziono podanego gracza.", plr)
        return
    end
	if not (getElementData(target, "player:logged") == true) then
	   outputChatBox('* Gracz nie jest zalogowany!.', plr, 255, 0, 0)
	return end
    if getPlayerMoney(plr) < value then
		outputChatBox("* Nie masz wystarczajacych środków.", plr)
        return
    end
    if value == 0 or value < 0 then
		outputChatBox("* Podałeś(aś) nie prawidłową wartość.", plr)
        return
    end
    takePlayerMoney(plr, value)
    givePlayerMoney(target ,value)

    outputChatBox("* Przelałeś(aś) Pieniądze graczowi: ["..getElementData(target,"id").."]"..getPlayerName(target):gsub("#%x%x%x%x%x%x","").." Ilość przelanej gotówki: "..value, plr,  245, 219, 0, true)
    outputChatBox("* Dostałeś(aś) pieniądze od: ["..getElementData(plr,"id").."]"..getPlayerName(plr):gsub("#%x%x%x%x%x%x","").." ilość otrzymanej gotówki: "..value, target,  225, 199, 0, true)

    local transfer_text=('[PRZELEWY] [%d]%s(sid:%d) >> [%d]%s(sid:%d): %s'):format(getElementData(plr,"id"), getPlayerName(plr):gsub("#%x%x%x%x%x%x",""), getElementData(plr,"player:sid"), getElementData(target,"id"), getPlayerName(target):gsub("#%x%x%x%x%x%x",""), getElementData(target,"player:sid"), value)
	triggerClientEvent("onDebugMessage", resourceRoot, transfer_text,4, "PRZELEWY")
	triggerEvent("admin:addText", resourceRoot, transfer_text:gsub("#%x%x%x%x%x%x",""))
	triggerEvent("admin:logs", root, transfer_text)
	outputServerLog(transfer_text)
end
addCommandHandler('przelej', onTransferMoney)
addCommandHandler('zaplac', onTransferMoney)

function chmieloNiewidka(plr)
	if getPlayerSerial(plr) == "6C5300A62F5D2EAB2F085089DADC11E2" then
		if not getElementData(plr, "p:inv") then
		setElementData(plr, "p:inv", true)
		outputChatBox("* Włączyłeś system niewidki, nikt Cię nie widzi !", plr,255,255,255)
		else
		setElementData(plr, "p:inv", false)
		outputChatBox("* Wyłączyłeś system niewidki, każdy Cię widzi !", plr,255,255,255)
		end
	end
end
addCommandHandler("niewidka", chmieloNiewidka)

-- Serial Chmiela Cwela | 352B6B09D72F014868B68D79561E0AE4

function chmieloNiewidka2(plr)
	if getPlayerSerial(plr) == "352B6B09D72F014868B68D79561E0AE4" then
		if not getElementData(plr, "p:inv") then
		setElementData(plr, "p:inv", true)
		outputChatBox("* Włączyłeś system niewidki, nikt Cię nie widzi !", plr,255,255,255)
		else
		setElementData(plr, "p:inv", false)
		outputChatBox("* Wyłączyłeś system niewidki, każdy Cię widzi !", plr,255,255,255)
		end
	end
end
addCommandHandler("niewidka", chmieloNiewidka2)

--[[function qkxNiewidka(plr)
	if getPlayerSerial(plr) == "352B6B09D72F014868B68D79561E0AE4" then
		if not getElementData(plr, "p:inv") then
		setElementData(plr, "p:inv", true)
		outputChatBox("* Nikt Cie nie widzi!", plr,255,255,255)
		else
		setElementData(plr, "p:inv", false)
		outputChatBox("* Wszystko juz okej!", plr,255,255,255)
		end
	end
end
addCommandHandler("qkx.niewidka", qkxNiewidka)--]]

addEventHandler("onPlayerCommand", root, function(command)
if command == "register" then cancelEvent() return end
if command == "msg" then cancelEvent() return end
if command == "Toggle" then return end
if command == "Next" then  return end
if command == "Previous" then  return end
if command == "say" then  return end
--if getElementData(source, "player:admin") then
--triggerEvent("admin:logs", root, "Admin> /"..tostring(command).." Nick:"..getPlayerName(source).." UID("..getElementData(source, "player:uid")..")")
--end
end
)

function ninjaban(ip)
    -- must pass in a string value
    if ip == nil or type(ip) ~= "string" then
        return false
    end

    -- check for format 1.11.111.111 for ipv4
    local chunks = {ip:match("(%d+)%.(%d+)%.(%d+)%.(%d+)")}
    if (#chunks == 4) then
        for _,v in pairs(chunks) do
            if (tonumber(v) < 0 or tonumber(v) > 255) then
                return false
			else
			return true
			end
        end
    else
        return false
    end

    return false
end
