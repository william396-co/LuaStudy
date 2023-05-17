local Set = {}

local mt ={} -- metatable for sets

-- create a new set with the values of a given list
function Set.new(l)
    local set ={}
    setmetatable(set,mt)
    for _,v in ipairs(l) do
        set[v] = true
    end
    return set
end

function Set.union(a,b)
    if getmetatable(a) ~= mt or getmetatable(b) ~= mt then
        error("attemp to 'add' a set with a non-set value",2)
    end
    local res = Set.new{}
    for k in pairs(a) do res[k] = true end
    for k in pairs(b) do res[k] = true end
    return res
end


function Set.intersection(a,b)
    local res = Set.new{}
    for k in pairs(a) do
        res[k] = b[k]
    end
    return res
end

-- presents a set a string
function Set.tostring(set)
    local l ={} -- list to put all elements from the set
    for e in pairs(set) do
        l[#l+1] = tostring(e)
    end
    return "{" .. table.concat(l,", ") .."}"
end


-- operator +
mt.__add = Set.union
-- operator *
mt.__mul = Set.intersection

-- relational metamethods

mt.__le = function(a,b) --subset
    for k in pairs(a) do
        if not b[k] then return false end
    end
    return true
end

mt.__lt = function(a,b) --proper subset
    return a <= b and not (b <= a)
end


mt.__eq = function(a,b)
    return a <= b and b <= a
end


mt.__tostring= Set.tostring

-- mt.__metatable = "not your business"

return Set
