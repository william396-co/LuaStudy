local EntityMgr = class('EntityMgr')

-- constructor
function EntityMgr:ctor()
	print("EntityMgr constructor\n")
end


function EntityMgr:dtor()
	print("EntityMgr destructor\n")
	for k,_ in pairs(self.dictEntity) do
		self.dictEntity[k]:dtor()
		self.dictEntity[k]=nil
	end
	seld.dictEntity=nil
end


function EntityMgr:getEntity(uid)
	return self.dictEntity[uid]	
end

function EntityMgr:initEntity(pState,uid)
	local entity = Entity(uid,pState);
	self.dictEntity[uid] = entity;
	return entity;
end

function EntityMgr:freeEntity(uid)
	self.dictEntity[uid]=nil
end

return EntityMgr
