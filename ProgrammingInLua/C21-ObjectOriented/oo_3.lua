Account = {balance = 0}

function Account.withdraw(self,v)
    self.balance = self.balance - v
end


a2 = {balance = 200, withdraw = Account.withdraw}
a2.withdraw(a2,240)
print(a2.balance) -- -40.0
