Account = {balance = 0}

function Account:deposit(v)
    self.balance = self.balance + v
end

function Account:withdraw(v)
    self.balance = self.balance - v
end

function Account:new(o)
    o = o or {} -- create table if user does not provide one
    self.__index = self
    setmetatable(o,self)
    return o
end

a = Account:new{balance = 0}
a:deposit(100.00) -- 100.00
print(a.balance)
a:withdraw(20.89) -- 79.11
print(a.balance)

b = Account:new{balance = 199.0}
b:withdraw(80.0)


print(getmetatable(a))
print(getmetatable(b))
print(getmetatable(a)==getmetatable(b))
