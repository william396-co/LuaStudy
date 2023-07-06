local items = {
        [1]={["id"]=1,["group"]=0,["number"]=1,["Reward"]={{10002,300,},},},
        [2]={["id"]=2,["group"]=0,["number"]=2,["Reward"]={{140001,10,},},},
        [3]={["id"]=3,["group"]=0,["number"]=3,["Reward"]={{10003,100000,},},}
}

local data = { Items = items, reloaddata = true, SortedItems = sortedItems}
function data:get(id)
    return self.Items[id] or self.Items[tostring(id)]
end

return data

