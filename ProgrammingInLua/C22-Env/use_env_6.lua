a = 1
local newgt = {} -- create new environment
setmetatable(newgt,{__index = _G})
_ENV = newgt
print(a)

a = 10
print(a, _G.a)-- 10 , 1
_G.a = 20
print(a, _G.a) -- 10 20
