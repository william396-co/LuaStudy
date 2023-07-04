local Signin = require 'Logic/Signin'

local Entity = class("Entity")

function Entity:ctor(uid,pState)
	print("Entity ctor")
	self.uid = uid
	self.pState = pSate
	
	-- 签到模块
	self.dictAgent[SystemID_Signin] = Signin(self,SystemID_Signin)
end

function Entity:dtor()
	print("Entity dtor")	
	self.pState = nil

	for k, _ in pairs(self.dictAgent) do
		self.dictAgent[k]:dtor()
		self.dictAgent[k]=nil
	end
	self.dictAgent = nil

	gEntityMgr:freeEntity(self.uid)
end

-- bind C++ Agent to lua 
function Entity:attach(id, agent)
	self.dictAgent[id] = agent
end 

function Entity:getAgent(sysId)
	return self.dictAgent[sysId]
end

function Entity:login(mode)
	for _, agent in pairs(self.dictAgent) do
		if(!agent:login(mode)) then 
			return false 
		end
	end
	return true
end

function Entity:skipday(timestamp)
	for _,agent in pairs(self.dictAgent) do
		agent:skipday(timestamp)
	end
end

function Entity:logout(mode, timestamp)
	for _, agent in pairs(self.dictAgent) do
		agent:logout()
	end
end


function Entity:getResultProcessor()
	return pState:getResultProcessor
end


return Entity

