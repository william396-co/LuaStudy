local complex = {}

-- create a new complex number
local function new(r,i)
    return {r=r,i=i}
end

complex.new = new -- add 'new' to the module

-- constant 'i'
complex.i = new(0,1)

function complex:add(c1,c2)
    return new(c1.r + c2.r, c1.i + c2.i)
end

function complex:sub(c1,c2)
    return new(c1.r - c2.r, c1.i - c2.i)
end

function complex:mul(c1,c2)
    return new(c1.r * c2.r, c1.i * c2.i)
end

local function inv(c)
    local n = c.r^2 + c.i^2
    return new(c.r/n,-c.i/n)
end

function complex:div(c1,c2)
    return complex.mul(c1,inv(c2))
end

function complex:tostring(c)
    return string.format("(%g,%G)",c.r,c.i)
end

local i  complex.new(0,1)

return {
    new = new,
    i = i,
    add = add,
    sub = sub,
    mul = mul,
    div = div,
    tostring = tostring,
}
