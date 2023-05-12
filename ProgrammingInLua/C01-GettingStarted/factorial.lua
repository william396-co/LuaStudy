-- defines a factorial function

function fact(n)
    if 0 == n then
        return 1
    else
        return n * fact(n -1)
    end
end

print("enter a number:")
a = io.read("*n") -- reads a number
print(fact(a))
