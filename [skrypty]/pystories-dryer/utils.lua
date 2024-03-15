--[[
    Resource: OURGame
    Developers: Split,xScatta <split.programista@gmail.com> <xscatta1@gmail.com>
    Copyright <split.programista@gmail.com> 2015-2016
    You have no right to use this code without my permission.
]]

function isPedAiming(player)
    if isElement(player) then
        if getElementType(player) == "player" or getElementType(player) == "vehicle" then
            if getPedTask(player, "secondary", 0) == "TASK_SIMPLE_USE_GUN" then
                return true
            end
        end
    end
    return false
end