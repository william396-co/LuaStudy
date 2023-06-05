Account = {
        balance = 0,
        withdraw = function(self,v)
                    self.balance = self.balance - v
                    end
}

function Account:deposit(v) -- colon operator hidden self(:)
    self.balance = self.balance + v
end

Account.deposit(Account, 200.0)
Account:withdraw(100.0)
