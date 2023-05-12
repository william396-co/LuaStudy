
function f(...)
    local s = 0
    for _, v in ipairs{...} do
        s = s + v
    end
    return s
end

print(f(table.unpack{1,2,5,2}))

print(table.unpack({"sun","Mon","Tue","Wed"},2,3))
