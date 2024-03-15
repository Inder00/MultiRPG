wejscie = createMarker (-2655.07, 640.16, 14.85+1, "arrow", 1.5, 255, 200, 0, 150)
wyjscie = createMarker (1577.6, -2599.2, 14.3, "arrow", 1.5, 255, 200, 0, 150)
setElementDimension(wyjscie, 120)
setElementInterior(wyjscie, 20)

addEventHandler("onMarkerHit", wejscie, function(el, md)
    if isPedInVehicle(el) then return end
	fadeCamera(el ,false)
	setElementFrozen(el, true)
	setTimer(function ()
	outputChatBox( "* Wszedłeś(aś) do Szpitala.", el)
    setElementDimension(el, 120)
    setElementInterior(el, 20)
    setElementPosition(el, 1577.7,-2601.7,13.6)
	setElementFrozen(el, false)
	showPlayerHudComponent(el, "radar", false)
	fadeCamera(el, true)
	end, 1500, 1)
end)

addEventHandler("onMarkerHit", wyjscie, function(el, md)
    if isPedInVehicle(el) then return end
	fadeCamera(el ,false)
	setElementFrozen(el, true)
	setTimer(function ()
	outputChatBox("* Wyszedłeś(aś) ze Szpitala.", el)
    setElementDimension(el, 0)
    setElementInterior(el, 0)
    setElementPosition(el, -2655.32,635.22,14.45)
	setElementFrozen(el, false)
	showPlayerHudComponent(el, "radar", true)
	fadeCamera(el, true)
	end, 1500, 1)
end)

