print("enter a number")
n = io.read()
-- if not n then
--    error("invalid input")
--end

assert(tonumber(n), "invalid input: "..n.." is not a number")
