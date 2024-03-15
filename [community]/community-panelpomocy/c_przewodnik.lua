--[[
@author Lukasz Biegaj <wielebny@bestplay.pl>
@author Karer <karer.programmer@gmail.com>
@author WUBE <wube@lss-rp.pl>
@copyright 2011-2013 Lukasz Biegaj <wielebny@bestplay.pl>
@license Dual GPLv2/MIT
@package MTA-XyzzyRP
@link https://github.com/lpiob/MTA-XyzzyRP GitHub
]]--



local files = {"pomoc/pomocnik.xml;Pomoc","pomoc/komendy.xml;Komendy","pomoc/aktualizacje.xml;Aktualizacje","pomoc/animacje.xml;Animacje","pomoc/administracja.xml;Administracja","pomoc/premium.xml;Premium","pomoc/regulamin.xml;Regulamin"}
local resX,resY = guiGetScreenSize()

function startup()
	window = guiCreateWindow(resX*1/10,resY*2/10,resX/10*8,resY/10*6,"Play Your Stories - Polski Serwer RPG",false)
	guiSetVisible(window,false)
	guiWindowSetMovable(window,false)
	guiWindowSetSizable(window,false)
	tPanel = guiCreateTabPanel(0,0.1,1,1,true,window)
	local t1=guiCreateTab("Przewodnik", tPanel)
--	guiCreateStaticImage ( 0.02, 0.04, 0.94, 0.4, "img/lss.png", true, t1 )

        -- pozostawienie ponizszej linii jest wymagane w ramach udzielonej licencji - jeśli wybrałeś GPLv2
        -- pozostawienie poniższej linii jest w dobrym smaku - jeśli wybrałeś MIT
	guiCreateLabel( 0.02, 0.70, 0.94, 0.20, "III Edycja serwera PYStories.\n\nZałożyciele serwera: Bone & stacker123\n\n\nTymczasowy panel pomocy\nhttp://github.com/lpiob/MTA-XyzzyRP/ licencja GPLv2/MIT", true, t1)


	for k, v in ipairs(files) do
		local data = split(v,string.byte(";"))
		local node = xmlLoadFile(data[1])
		local text = xmlNodeGetValue(node)
		local tab = guiCreateTab(data[2],tPanel)
		local memo = guiCreateMemo(0.02,0.04,0.94,0.94,text,true,tab)
		guiMemoSetReadOnly(memo,true)
		xmlUnloadFile(node)
	end
end
addEventHandler("onClientResourceStart",getResourceRootElement(),startup)

function togglePrzewodnik()
	if (guiGetVisible(window)) then
		showCursor(false)
		guiSetVisible(window,false)
	elseif (not isCursorShowing()) then
		showCursor(true)
		guiSetVisible(window,true)
	end
end
bindKey("F1","down",togglePrzewodnik)
