﻿--[[

@copyright 2015 Rudy <kmil50489@gmail.com>
@author Rudy <kmil50489@gmail.com>

Nie masz prawa używac tego kodu bez mojej zgody.
Napisz do mnie być może się zgodzę na użycie kodu.
--]]

local b=createElement("text")
setElementData(b,"name","PRACA: Łatacz dziur\nZAROBEK:\nGRACZ 300PLN | PREMIUM 350PLN\nOPIS: Łatanie dziur")
setElementPosition(b,1352.89, 1162.27, 10.82)

createBlip(1352.89, 1162.27, 10.82, 46,2,0,0,0,0,0,275)

local m1 = createMarker(1352.89, 1162.27, 10.82-1, "cylinder", 1.5, 35, 142, 150)
vehs = {}


function removePreviousVehicles(plr)
    for i,v in ipairs(getElementsByType("vehicle", resourceRoot)) do
        local sby = getElementData(v, "zrespilGracz")
        if sby and sby == plr and getPedOccupiedVehicle(plr) ~= v then
            destroyElement(v)
        end
    end
end

addEventHandler("onMarkerHit", m1, function(el, md)
    if getElementData(el, "zrespilGracz") then
        --outputChatBox("Praca w trakcie przygotowania.", el)
        return
    end
    
    if not md or getElementType(el) ~= "player" or getPedOccupiedVehicle(el) then return end
    
    local x,y,z = getElementPosition(el)
    local bus = createVehicle(552, 1363.20, 1156.06, 10.52, 359.2, 0.0, 359.3)
 
	setElementData(bus,"vehicle:desc","Praca łatania dziur\n! Proszę zachować ostrożność !")
    setElementData(bus, "zrespilGracz", el)
    setElementData(bus, "vehicle:fuel", 100)
    setElementData(bus, "vehicle:mileage", math.random(9018,31892))
	setVehiclePlateText(bus, " PRACA" )
	setVehicleColor(bus, 0, 96, 255 )
    
    setVehicleHandling(bus,"maxVelocity", 100.00) -- 40 + 10 = 50km/h
    
    warpPedIntoVehicle(el, bus)
    removePreviousVehicles(el)
    triggerClientEvent(el, "STARTJobBus", resourceRoot, bus)
    setVehicleHandling(bus,"maxVelocity", 100.00) -- 40 + 10 = 50km/h
	setElementData(bus, "blokada:reczny_latdziur", true)

    vehs[el] = bus
end)

addEvent("STOPJobBus", true)
addEventHandler("STOPJobBus", resourceRoot, function()
    local pojazd = getPedOccupiedVehicle(localPlayer)
    if pojazd then
        destroyElement(pojazd)
    end
end)

addEvent("destroyVeh", true)
addEventHandler("destroyVeh", getRootElement(),
function()
     if vehs[source] then
          if isElement(vehs[source]) then destroyElement(vehs[source]) end
     end
end)

addEvent("onPlayerQuit", true)
addEventHandler ( "onPlayerQuit", getRootElement(), function()
     if vehs[source] then
          if isElement(vehs[source]) then destroyElement(vehs[source]) end
    end
end)