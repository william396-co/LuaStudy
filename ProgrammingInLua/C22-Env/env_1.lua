function  getfield(f)
    local v = _G -- start with the table of globals
    for w in string.gmatch(f,"[%a_][%w_]*") do
        v = v[w]
    end
    return v
end


function setfield(f,v)
    local t = _G -- start with the table of globals
    for w,d in string.gmatch(f,"([%a_][%w_]*)(%.?)") do
        if d == '.' then -- not last name?
            t[w] = t[w] or {} -- create table if absent
            t = t[w] -- get the table
        else -- last name
            t[w] = v -- do the assignment
        end
    end
end


setfield("t.x.y",10)
print(t.x.y) --> 10
print(getfield("t.x.y")) --> 10

print(b)
