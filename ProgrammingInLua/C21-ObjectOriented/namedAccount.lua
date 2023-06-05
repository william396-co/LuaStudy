local function search(k,plist)
    for i =1, #plist do
        local v = plist[i][k] -- try 'i' -th superclass
        if v then
            return v
        end
    end
end

function createClass(...)
    local c = {} -- new class
    local parents = {...} -- list of parents

    -- class search for absent methods in its list of parents
    setmetatable(c, {__index = function(t,k)
        return search(k,parents);
    end})

    -- prepare 'c' to be the metable of its instance
    c.__index = c

    -- define a new constructor for this new class
    function c:new(o)
        o = o or {}
        setmetatable(o,c)
        return o
    end
    return c -- return new class
end

-- class Named
Named = {}

function Named:getname()
    return self.name
end

function Named:setname(n)
    self.name = n
end

--class Account
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

-- Multiple Inheritance
NamedAccount = createClass(Account,Named)

pualAccount = NamedAccount:new{name= "Paul"}
print(pualAccount:getname())
pualAccount:deposit(100.0)
print(pualAccount.balance)
pualAccount:withdraw(28.8)
print(pualAccount.balance)
pualAccount:setname("Joe")
print(pualAccount:getname().." account left money:"..pualAccount.balance)
