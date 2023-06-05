function newAccount(initBalance)
    local self = {
        balance = initBalance,
        LIM = 10000.00,
    }

    local withdraw = function(v)
        self.balance = self.balance - v
    end

    local deposit = function(v)
        self.balance = self.balance + v
    end

    local extra = function()
        if self.balance > self.LIM then
            return self.balance * 0.1
        end
        return 0
    end
    local getBalance = function()
        return self.balance + extra()
    end
    return {
        withdraw = withdraw,
        deposit = deposit,
        getBalance = getBalance
    }
end

acc = newAccount(100.0)
acc.withdraw(30)
print(acc.getBalance())
