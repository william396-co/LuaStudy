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

