--[[
-- Notification sink, e.g. for urxvt -name notsink windows
--]]

notsink = {}

local NAME = 'notsink'
local ATTR = 'sink'

defwinprop{
    instance = NAME,
    target = NAME,
}

function notsink.set() -- FIXME Not global please, use pkg and all
    -- XXX Difference between a parent and a manager?
    cur = ioncore.current()
    if obj_is(cur, 'WFrame') then
        cur:set_name(NAME)
        cur:set_grattr(ATTR, 'set')
    elseif obj_is(cur, 'WClientWin') then
        cur:parent():set_name(NAME)
        cur:parent():set_grattr(ATTR, 'set')
    end
end
