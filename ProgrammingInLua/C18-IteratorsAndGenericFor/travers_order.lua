lines = {
    ["luaH_set"] = 10,
    ["luaH_get"] = 24,
    ["luaH_present"] = 48,
}

a = {}
for n in pairs(lines) do a[#a + 1] = n end
table.sort(a)

for _, n in ipairs(a) do print(n) end


print("==========")


function pairsByKeys(t,f)
    local a = {} -- create a list with all keys
    for n in pairs(t) do
        a[#a+1] = n
    end

    table.sort(a,f) -- sort the list
    local i = 0 -- iterator variable
    return function() -- iterator function
        i = i + 1
        return a[i], t[a[i]] -- return key, value
    end
end

for name,line in pairsByKeys(lines) do
    print(name,line)
end
