a = {}
mt = {__mode = "k"}
setmetatable(a,mt) -- now 'a' has weak keys
key = { x = 10} -- create first key
a[key] = 1
key = {x = 10} --create second key
a[key] = 2
collectgarbage() ---force a garbage collection cycle
for k,v  in pairs(a) do
    print(k.x.." "..v) --> 20 2
end
