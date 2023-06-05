Account = {balance = 0}

function Account.withdraw(self,v)
    self.balance = self.balance - v
end

 a, Account = Account,nil
a.withdraw(a,100.0) -- -100.0
print(a.balance)
