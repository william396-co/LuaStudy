function allwords()
    local line = io.read() -- current line
    local pos = 1 -- current position in the line
    return function()
        while line do
            local w,e = string.match(line, "(%w+)()", pos)
            if w then -- found a word?
                pos = e -- next position is after this word
                return w -- return the word
            else
                line = io.read() -- word not found, try next line
                pos = 1 -- restart from first position
            end
            return nil -- no more lines: end of traversal
        end
    end
end

for word in allwords() do
    print(word)
end
