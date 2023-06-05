Account = {balance = 0}

function Account:deposit(v)
    self.balance = self.balance + v
end

function Account:withdraw(v)
    self.balance = self.balance - v
end

local mt = {__index = Account}

function Account.new(o)
    o = o or {} -- create table if user does not provide one
    setmetatable(o,mt)
    return o
end

a = Account.new{balance = 0}
a:deposit(100.00) -- 100.00
print(a.balance)
a:withdraw(20.89) -- 79.11
print(a.balance)
