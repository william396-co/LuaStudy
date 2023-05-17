
function values(t)
    local i =0
    return function() i = i + 1; return t[i] end
end


t = {10,20,30,40}
iter = values(t) -- creates the iterator
while true do
    local element = iter() -- calls the iterator
    if nil == element then break end
    print(element)
end
