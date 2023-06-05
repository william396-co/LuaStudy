local balance = {}

Account = {}

function Account:withdraw(v)
    balance[self] = balance[self] - v
end

function Account:deposit(v)
    balance[self] = balance[self] + v
end

function Account:balance()
    return balance[self]
end

function Account:new(o)
    o = o or {}
    setmetatable(o,self)
    self.__index = self
    balance[o] = 0 -- initial balance
    return o
end

a = Account:new{}
a:deposit(100.00)
print(a:balance())
a:withdraw(89.9)
print(a:balance())
