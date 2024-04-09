local Sign = require 'sign'

print(testfn(1,2,3))


va_fun(3232,":hello,",233234.45)


local self1 = {x =1 ,y = 2}

aaHandler = ABC("aaHandler")
bbHandler = ABC("bbHandler")

local aa = Sign("aa",aaHandler)



local bb = Sign("bb",bbHandler)
ccHandler = ABC("cchandler")
local cc = Sign("cc",ccHandler)

aaHandler:process(3,888,"aa sign data set handler")

local sum = 0
for i =0, 10 do
	sum = sum + i
end
print(sum)
bbHandler:process(3, 999, "bb sign data set handler")

aaHandler:process(3,889,"aa sign data set handler")
aaHandler:process(3,890,"aa sign data set handler")
aaHandler:process(3,891,"aa sign data set handler")

bbHandler:process(3, 1999, "bb sign data set handler")
bb:output()
aa:output()

print("=============================================")
local tablename = "Fight_Data1"
local def = Derived.new(tablename)
local tmp = def:getTableName()
print(tmp)
def:test()
print("def metatable ")
print(getmetatable(def))


local d2 = gDataMgr:parse();
print("d2 metatable")
print(getmetatable(d2))
print(d2:getTableName())



print("gABC metatable")
print(getmetatable(gABC))

local abc = ABC.new()
print("local abc metatable")
print(getmetatable(abc))

gDataMgr:insert(def)
gDataMgr:destory(def)
