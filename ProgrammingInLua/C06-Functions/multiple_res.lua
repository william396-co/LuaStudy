
function maximum(a)
    local mi = 1 -- index os the maximum value
    local m = a[mi] -- maximum value
    for i = 2, #a do
        if a[i] > m then
            mi = i; m = a[i]
        end
    end
    return m,mi
end

print(maximum({8,10,23,12,5})) --> 23 3

-- Lua always adjusts the number of results from a function to the circumstances of the call.
-- When we call a function as a statement, Lua discards all returns from the function, When
-- we use a call as an expression,Lua keeps only the first result. We get all results only
-- when the call is the last(or the only) expression in a list of expressions. These lists
-- appear in four constructions in Lua: multiple assignments, arguments to function calls,
-- table constructor, and return statement. To illustrate all these cases, we will assume
-- the following definitions for the next examples:

function foo0() end
function foo1() return "a" end
function foo2() return "a", "b" end

x ,y = foo2()
print(x,y)

x = foo2() -- x ="a", "b" is discarded
print(x)

x, y, z = 10, foo2()
print(x,y,z)

--  In a multiple assignment, if a function has fewer results than we need,
--  Lua procedures nils for the missing values:


x,y = foo0() -- x=nil, y=nil
x,y = foo1() -- x="a", y=nil
x,y,z = foo2() -- x="a", y="b", z=nil

-- Remember that multiple results only happen when the call is the last (or only) expression in a list. A
-- function call that is not the last element in the list always produces exactly one result:
x,y = foo2(), 20 -- x="a", y=20 ('b' discarded)
x,y = foo0(), 20, 30 -- x=nil, y=20 (30 is discarded)


print(foo0()) --> (no results)
print(foo1()) --> a
print(foo2()) --> a b
print(foo2(), 1) --> a 1
print(foo2() .. "x") --> ax (see next)
