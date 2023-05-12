-- a sample func

function sum(a)
    local sum = 0
    for i = 1, #a do
        sum = sum + a[i]
    end
    return sum
end

t = {1,2,3,4,5}
print(sum(t))
