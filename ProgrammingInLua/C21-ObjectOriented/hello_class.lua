Account = {
        balance = 0,
        withdraw = function(self,v)
                    self.balance = self.balance - v
                    end
}

function Account:deposit(v) -- colon operator hidden self(:)
    self.balance = self.balance + v
end

function Account:new(o)
    o = o or {} -- create table if user does not provide one
    self.__index = self
    setmetatable(o,self)
    return o
end

a = Account:new{ balance = 1000}
a:deposit(100.00)
print(a.balance)
a:withdraw(20)
print(a.balance)


b = Account:new{balance = 200.0}
b:withdraw(20)
print(b.balance)
b:deposit(200)
print(b.balance)
