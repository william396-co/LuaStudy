Account = {balance = 0}
function Account.withdraw(self,v)
    self.balance = self.balance - v
end

-- al = Account; Account = nil
-- al.withdraw(al,100.00) -- OK

a2 = {balance = 0, withdraw = Account.withdraw}
a2.withdraw(a2,32.00) -- OK
