Account = {balance = 0}

function Account.withdraw(v)
    Account.balance = Account.balance - v -- Account is global variable
end

a, Account = Account, nil
a.withdraw(100.0) --ERROR
print(a.balance)
