Lib = {
	foo = function(x, y) return x + y end,
    goo = function(x,y) return x - y end
}

print(Lib.foo(2,3))
print(Lib.goo(3,5))

local fact -- forward declaration
fact = function(n)
    if 0 == n then return  1
    else return n * fact(n -1) -- buggy
    end
end

print(fact(5))


--  local function foo(params） body end
--  expands to local foo; foo = function(params) body end
local function fact2(n)
    if 0 == n then return 1
    else return n * fact2(n -1)
    end
end

print(fact2(5))
