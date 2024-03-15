--[[
	Resource: OURGame
	Developers: Split <split.programista@gmail.com>
	Copyright <split.programista@gmail.com> 2015-2016
	You have no right to use this code without my permission.
]]

stanowiskaNaprawcze = {
	stanowiskoDoherty={
		mpos={-2050.97, 167.33, 28.84}, -- marker
		cpos={-2055.11,167.20,27.34, 9.4964599609375, 6.6574096679688, 3.5895790100098}, -- cuboid
		faction_id="mechanik-sf", -- (id) frakcja która będzie miała dostęp
		text="Naprawa pojazdu"
	},
}

for i,v in pairs(stanowiskaNaprawcze) do

	v.cuboid=createColCuboid(unpack(v.cpos))
	v.marker=createMarker(v.mpos[1], v.mpos[2], v.mpos[3]-1, "cylinder", 1.2, 0, 0, 255, 100)
	setElementData(v.marker,"snn_faction",v.faction_id)
	setElementData(v.marker,"snn_cs",v.cuboid)

	t=createElement("text")
	setElementData(t,"name",v.text)
	setElementPosition(t,v.mpos[1], v.mpos[2], v.mpos[3])
end