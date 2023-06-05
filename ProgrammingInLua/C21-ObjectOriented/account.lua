Account = { balance = 0   }

function Account:withdraw(v)
    if v  > self.balance then
        error "insufficient funds"
    end
    self.balance = self.balance - v
end

function Account:deposit(v)
    self.balance = self.balance + v
end

function Account:new(o)
    o = o or {}
    self.__index = self
    setmetatable(o,self)
    return o
end


-- inheritance
SpecialAccount = Account:new()

function SpecialAccount:getLimit()
--    return self.limit or 0
    return self.balance * 0.1
end

s = SpecialAccount:new{limit = 1000.0}
s:deposit(100)
print(s.balance) -- 100
s:withdraw(20)
print(s.balance) -- 80

print("s limit "..s:getLimit()) -- 0.8


a = Account:new{balance = 100.0}
a:deposit(100)
print(a.balance) -- 200
a:withdraw(20)
print(a.balance) --180
