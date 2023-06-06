
local results = {}
setmetatable(results,{__mode = "v"}) -- make values weak
function createRGB(r,g,b)
    local key  = string.format("%d-%d-%d",r,g,b)
    local color = results[key]
    if color == nil then
        color = {red =r, green = g, blue = b}
        results[key] = color
    end
    return color
end


c1 = createRGB(1,255,255)
c2 = createRGB(1,255,255)
c3 = createRGB(1,255,255)
