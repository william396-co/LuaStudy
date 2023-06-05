t ={}
print(getmetatable(t)) -- nil

t1 = {}
setmetatable(t,t1)
print(getmetatable(t) == t1) -- true

print("===========")
print(getmetatable(t)) -- table: 0x1679ac0
print(getmetatable(t1))-- nil


print("===========")
print(getmetatable("hi")) -- table: 0x1676e50 maybe String
print(getmetatable("xix"))-- table: 0x1676e50
print(getmetatable(10)) -- nil
print(getmetatable(print)) -- nil
