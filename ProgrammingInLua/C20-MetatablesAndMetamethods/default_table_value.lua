local key = {} -- unqiue key
local mt = {__index = function(t) return t[key] end}
function setDefault(t, d)
    t[key] = d
    setmetatable(t,mt)
end

tab  = {x = 19, y = 20}
print(tab.x, tab.z) --> 19, nil
setDefault(tab,0)
print(tab.x, tab.z) --> 19, 0
print(tab.y, tab.n) --> 20, 0
