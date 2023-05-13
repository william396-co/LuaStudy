local a = {} -- new array
for i = 1, 1000 do
    a[i] = 0
end

print(#a)

-- create an array with indices from -5 to 5
b = {}
for i = -5, 5 do
   b[i] = 0
end

for k,v in ipairs(b) do
    print(k,v)
end

-- we can use a constructor to create and initlialize arrays in a single expression:

squares = {1,4,5,16,25,36,49,81}
for i = 1, #squares do
    print(squares[i])
end
