require 'utils.memorycheck'
require 'utils.analysishelper'
require 'utils.stringex'
require 'utils.class'
require 'utils.luautil'
--require 'utils.restrict_global'
--require 'utils.log'
require 'utils.xmath'


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



