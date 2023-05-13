names = {"Peter", "Paul", "Mary"}
grades = {Mary = 10, Paul=7, Peter = 8}
table.sort(names, function(n1,n2) return grades[n1]> grades[n2] end)

function order_print(t)
    for i = 1, #t do
        print(t[i])
    end
end

order_print(names)

function sortbygrade(names, grades)
    table.sort(names, function(n1,n2) return grades[n1] < grades[n2] end)
end

print("==== use sortbygrades=====")
sortbygrade(names,grades)
order_print(names)


function newCounter()
    local count = 0
    return function()
        count = count + 1
        return count
    end
end

c1 = newCounter()
print(c1()) -->1
print(c1()) -->2

c2 = newCounter()
print(c2()) -->1
print(c1()) -->3
print(c2()) -->2
