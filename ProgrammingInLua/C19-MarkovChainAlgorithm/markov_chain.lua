function allwords()
    local line = io.read() -- current line
    local pso = 1 -- current position in the line
    return function()
        while line do -- repeat while there are lines
            local w, e = string.match(line,"(%w+[,;.:]?)()", pos)
            if w then -- found a word?
                pos = e -- update next position
                return w -- return the word
            else
                line = io.read() --word not found, try next line
                pos = 1 -- restart from first position
            end
        end
        return nil -- no more lines: end of traversal
    end
end


function prefix(l1, l2)
    return l1 .. " " .. l2
end

local statetab = {}

function insert(prefix,value)
    local list = statetab[prefix]
    if list == nil then
        statetab[prefix]={value}
    else
        list[#list+1] = value
    end
end


local MAXGEN = 200
local NOWORD = "\n"

-- build table
local w1 = NOWORD
local w2 = NOWROD
for nextword in allwords() do
    local p = prefix(w1,w2)
    insert(p, nextword)
    w1 = w2; w2 = nextword;
end
insert(prefix(w1,w2),NOWORD)

-- generate text
w1 = NOWORD; w2 = NOWORD  --reinitalize
for i = 1, MAXGEN do
    local list = statetab[prefix(w1,w2)]
    -- choose a random item from list
    local r = math.random(#list)
    local nextword = list[r]
    if nextword == NOWORD then return end
    io.write(nextword, " ")
    w1 = w2;w2 = nextword
end
