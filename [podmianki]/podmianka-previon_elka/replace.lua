--[[
Skrypt odpowiadaj¹cy za podmianê pojazdu

@author Daniex0r <daniex0r@gmail.com>
@author Karer <karer.programmer@gmail.com>
@copyright 2012-2013 Daniex0r <daniex0r@gmail.com>
@license GPLv2
@package project-roleplay-rp
@link https://github.com/Daniex0r/project-roleplay-rp
]]--

txd = engineLoadTXD("previon.txd")
engineImportTXD(txd, 436)
dff = engineLoadDFF("previon.dff", 436)
engineReplaceModel(dff, 436)
