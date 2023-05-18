
function track(t)
    local proxy = {} -- proxy table for `t`

    -- create metable for the proxy
    local mt ={
        __index = function(_,k)
            print("*access to element "..tostring(k))
            return t[k] -- access the original table
        end,

        __newindex = function(_,k,v)
            print("*update of element "..tostring(k).." to ".. tostring(v))
            t[k] = v -- update original table
        end,

        __pairs = function()
            return function(_,k) -- iteration function
                local nextk, nextv = next(t,k)
                if nextk ~= nil then -- avoid last value
                    print("*traversing element "..tostring(nextk) .. " to "..tostring(nextv))
                end
                return nextk,nextv
            end
        end,

        __len = function() return #t end
    }

    setmetatable(proxy,mt)
    return proxy
end

t = {} -- an arbitrary table
t = track(t)
t[2] = "hello"
print(t[2])

t[1] = "morning"
t[3] ="evening"

for k,v in ipairs(t) do
    print(k,v)
end
