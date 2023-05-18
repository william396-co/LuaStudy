function readOnly(t)
    local proxy ={}

    local mt = {
        __index = t,
        __newindex = function(t,k,v)
            error("attemp to update a read-only table",2)
        end
    }
    setmetatable(proxy,mt)
    return proxy
end

days = readOnly{"Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday","Saturday"}

print(days[1])
--  days[2] = "Noday"

for _, v in ipairs(days) do
    print(v)
end
