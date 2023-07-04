-- rapidjson = require 'rapidjson'

require 'Engine/MemoryCheck'
require 'Engine/analysisHelper'
require 'Engine/StringEx'
require 'Engine/Class'
require 'Engine/Random'
require 'Engine/LuaUtil'
require 'Engine/Restrict_Global'
require 'Engine/Log'
require 'Engine/XMath'

-- gEntityMgr
local EntityMgr = require 'Logic/EntityMgr'
declare_global("gEntityMgr")
gEntityMgr = EntityMgr()


-- initEntity
declare_global("initEntity")
function initEntity(pSate,uid)
	return gEntityMgr:initEntity(pState,uid)
end

-- gDataMgr bind from C++
local DataMgr = require 'Logic/DataMgr'
declare_global("gDataMgr")
gDataMgr = DataMgr()

-- init gDataMgr
declare_global("initgDataMgr")
function initgDataMgr(pState)
	gDataMgr:setState(pState)
end

