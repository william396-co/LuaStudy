-- read 10 lines,storing them in a table
a = {}
for i = 1, 10 do
    a[i] = io.read()
end

-- print the lines, from 1 to #a
for i = 1, #a do
    print(a[i])
end
