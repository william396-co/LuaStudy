M = 5
N = 5
local mt = {} -- create the matrix
for i = 1, N do
    local row = {}
    mt[i] = row -- create a new row
    for j = 1, M do
        row[j] = i * M + j
    end
end

for  i = 1, #mt do
    local row =""
    for j = 2, #mt[i] do
        row = row..","..mt[i][j]
    end
    print(row)
end
