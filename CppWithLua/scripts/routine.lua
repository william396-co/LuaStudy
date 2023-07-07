require 'utils.memorycheck'
require 'utils.analysishelper'
require 'utils.stringex'
require 'utils.class'
require 'utils.luautil'
require 'utils.restrict_global'
require 'utils.log'
require 'utils.xmath'


print("Hello kaguya from Lua")

print("ROOT=",ROOT)



local abc1 = ABC.new()

local abc2 = ABC.new("hello")

local tablename = "Fight_Data"
local def = Derived.new(tablename)
print(def.getTableName())

-- abc1.overload()
-- abc1.overload(1)

print(getRef())
incRef()
print(getRef())

lambdatest()

abc1 = nil
abc2 = nil



