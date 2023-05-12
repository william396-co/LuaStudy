-- tree recursion
function fib1(n)
    print("call fib1("..n..")")
    if n <= 1 then
        return 1
    else
        return fib1(n -1) + fib1(n -2)
    end
end

-- linear recursion
function fib2(n)
    function fib_r(a,b,n)
        if n <= 1 then
            return 1
        else
            return a + fib_r(b, a + b, n -1)
        end
    end
    return fib_r(1,1,n)
end

-- iterator
function fib3(n)
    local a = 1; b = 1
    for i = 1, n do
        local a_= a
        local b_ = a + b
        a = a_
        b = b_
    end
    return a
end

-- tail call recusion
function fib4(n)
    function fib_iter(a,b,n)
        print("call fib_iter("..a..","..b..","..n..")")
        if 0 == n then
            return a
        else
            return fib_iter(b, a + b, n -1)
        end
    end
    return fib_iter(1,1,n)
end


-- test
print(fib1(10))
print(fib2(10))
print(fib3(10))
print(fib4(10))
