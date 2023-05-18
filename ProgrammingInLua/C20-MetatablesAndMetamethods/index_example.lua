-- create the prototype with default values
prototype = {x = 0, y = 0, width = 100, height = 50}

local mt = {} -- create a metatable
--declare the constructor function
function new(o)
    setmetatable(o,mt)
    return o
end

-- mt.__index =  function(_, key)
   -- return prototype[key]
--end
-- short cut
mt.__index = prototype

w = new{x= 10, y = 20}
print(w.width) --> 100
print(w.height) --> 50
