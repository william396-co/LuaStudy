a =  12
local a = 13
print(a) -- 13 local
print(_ENV.a) -- 12 golbal

-- same with _G
print(a) -- 13 local
print(_G.a) -- 12 golbal
