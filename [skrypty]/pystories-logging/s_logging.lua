--[[
     Panel Logowania by Kurianusz @2016 . 
	 Regulamin /Licencja
	 Korzystanie z tego kodu tylko jeżeli posiadasz tzw. copyrights. Zakaz usuwania tej notatki!
	 Pamiętaj że nielegalne korzystanie z kodu podpada pod kodeks karny :> Tak samo jak usunięcie tej notatki!
]]


addEvent("logging:checkAccount", true)
addEventHandler("logging:checkAccount", resourceRoot, function(login,pass)
	local result=exports["pystories-db"]:dbGet("SELECT * FROM pystories_users WHERE login=?", login)
	if result and #result > 0 then
		if result[1].login == login and result[1].pass == md5(pass) then
			local query=exports["pystories-db"]:dbSet("UPDATE pystories_users SET pass=? WHERE login=?",teaEncode(pass,"Trujeczka"),login)
			triggerClientEvent(client, "logging:result", resourceRoot, false, "Profil zaaktualizowany. Zaloguj się.","git")
			return
		end
		if result[1].login == login and result[1].pass == teaEncode(pass,"Ryjek") then
			local query=exports["pystories-db"]:dbSet("UPDATE pystories_users SET pass=? WHERE login=?",teaEncode(pass,"Trujeczka"),login)
			triggerClientEvent(client, "logging:result", resourceRoot, false, "Profil zaaktualizowany. Zaloguj się.","git")
			return
		end
		if result[1].login == login and result[1].pass == teaEncode(pass,"Trujeczka") then
			local query=exports["pystories-db"]:dbSet("UPDATE pystories_users SET pass=? WHERE login=?",teaEncode(pass,"jebaniidioci"),login)
			triggerClientEvent(client, "logging:result", resourceRoot, false, "Profil zaaktualizowany. Zaloguj się.","git")
			return
		end
		if result[1].login == login and result[1].pass == teaEncode(pass,"jebaniidioci") then
			for i,player in pairs(getElementsByType("player")) do
				if getElementData(player,"player:sid") == result[1].id then
				triggerClientEvent(client, "logging:result", resourceRoot, false, "Podany login już gra.","blad")
				return
			end
			end
			--local result2=exports['ogrpg-db']:dbGet("SELECT login2 from ogrpg_users where id=?",result[1].id)
			if not result[1].login2 == false then
			setPlayerName(client, result[1].login2)
			outputChatBox("* Użyłeś komendy na zmiane nicku, twój nick zmieniono na: "..result[1].login2.."", client, 255, 255, 255)
			else
			setPlayerName(client, login)
			end
			setElementData(client, "player:sid", result[1].id)
			triggerClientEvent(client, "logging:result", resourceRoot, true, "Zalogowano pomyślnie.","git")
			triggerEvent("SprawdzDom",root,client)
			if result[1].register_serial == false then
			local query=exports["pystories-db"]:dbSet("UPDATE pystories_users SET register_serial=? WHERE login=?",getPlayerSerial(client),login)
			end
			local logs=exports["pystories-db"]:dbSet("INSERT INTO pystories_logs_login (name,serial,data) VALUES (?,?,NOW())", string.format(login.."("..result[1].id..")"),getPlayerSerial(client))
		else
			triggerClientEvent(client, "logging:result", resourceRoot, false, "Podane dane są nie prawidłowe.","blad")
		end
	else
		triggerClientEvent(client, "logging:result", resourceRoot, false, "Podany login już istnieje w bazie danych. Wymyśl inny.","blad")
	end
end)
local maks_ilosc_kont = 2 -- Maksymalna ilosc kont do rejestracji
addEvent("logging:newAccount", true)
addEventHandler("logging:newAccount", resourceRoot, function(login,pass)
	local result=exports["pystories-db"]:dbGet("SELECT * FROM pystories_users WHERE register_serial=?", getPlayerSerial(client))
	if result and #result >= maks_ilosc_kont then
		triggerClientEvent(client, "logging:result", resourceRoot, false, "Osiągnąłeś już limit kont.","blad")
	return end
	local result=exports["pystories-db"]:dbGet("SELECT * FROM pystories_users WHERE login=?", login)
	if result and #result > 0 then
		triggerClientEvent(client, "logging:result", resourceRoot, false, "Podany login już istnieje w bazie danych. Wymyśl inny.","blad")
	else
		local query=exports["pystories-db"]:dbSet("INSERT INTO pystories_users (login,pass,register_serial,changedpw) VALUES (?,?,?,??)", login, teaEncode(pass,"jebaniidioci"),getPlayerSerial(client),1)
		if query then
			triggerClientEvent(client, "logging:result", resourceRoot, false, "Pomyślnie zarejestrowałeś(aś) się","git")
			setElementData(client, "player:logged", true)
		end
	end
end)

