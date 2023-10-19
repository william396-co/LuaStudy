require 'utils.memorycheck'
require 'utils.analysishelper'
require 'utils.stringex'
require 'utils.class'
require 'utils.luautil'
--require 'utils.restrict_global'
--require 'utils.log'
require 'utils.xmath'

local pb = require 'pb'
local factory = require 'protocol/factory'
local msg = factory:namescope()


print("Hello kaguya from Lua")

print("ROOT=",ROOT)


for n in ipairs(_G) do 
	print(n)
end


for n in ipairs(_ENV) do
	print(n)
end


local abc1 = ABC.new()

local abc2 = ABC.new("hello")

local tablename = "Fight_Data"
local def = Derived.new(tablename)
local tmp = def:getTableName()
print(tmp)
def:test()
print("def metatable ")
print(getmetatable(def))
print("abc1 metatable ")
print(getmetatable(abc1))
print("abc2 metatable ")
print(getmetatable(abc2))

local b1 = Base.new();
b1:test()
print("b1 metatable ")
print(getmetatable(b1))

-- abc1.overload()
-- abc1.overload(1)

abc1:update("abc1");
print(abc1:getData())

abc2:update("abc2")
print(abc2:getData())

--[[
abc1:bind(1,function(idx, idstr)
		print(idx,idstr)
end)
abc1:process(1)]]




print(getRef())
incRef()
print(getRef())

lambdatest()

abc1 = nil
abc2 = nil


--local req = msg.HeroLevelRequest(10,200);
--print(req.heroid);
--print(req.level);

