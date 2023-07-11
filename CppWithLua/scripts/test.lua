local Sign = require 'sign'

print(testfn(1,2,3))


va_fun(3232,":hello,",233234.45)


local self1 = {x =1 ,y = 2}

aaHandler = ABC("aaHandler")
bbHandler = ABC("bbHandler")

local aa = Sign("aa",aaHandler)

--[[
gABC:bind(2,self1,
	function(idx, str)
		print(self1.x,self1.y)
		print("Lua dataset",idx,str);
		gABC:update("DDDDDDDDDDDD===============")
		print(gABC:getData())
	end
)
gABC:process(2)]]


local bb = Sign("bb",bbHandler)


aaHandler:process(3,888,"aa sign data set handler")

bbHandler:process(3, 999, "bb sign data set handler")
bb:output()
aa:output()

