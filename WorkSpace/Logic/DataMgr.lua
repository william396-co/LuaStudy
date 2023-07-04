local DataMgr = class('DataMgr')

function DataMgr:ctor(pState)
	print("DataMgr ctor")
	self.pState = nil 
end

function DataMgr:setState(pState)
	self.pState = pState
end

function DataMgr:update(block)
	self.pState:update(block)
end

function DataMgr:destroy(block)
	self.pState:destroy(block)
end

function DataMgr:insert(block)
	self.pState:insert(block)
end

return DataMgr
