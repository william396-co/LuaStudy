
-- random without seed test
function test_random_without_seed(n)
    local res = "";
    for i = 1, n do
        res = res .. ",".. math.random()
    end
    print("test random without seed result:")
    print(res)
end

-- random with seed test
function test_random_with_seed(n)
    math.randomseed(os.time())
    local res = "";
    for i = 1, n do
        res = res .. ",".. math.random()
    end
    print("test random with seed result:")
    print(res)
end



print(" enter the time for random:")
a  = io.read("*n")
test_random_without_seed(a)
test_random_with_seed(a)
