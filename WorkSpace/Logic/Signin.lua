local SignConf = require 'GameConfig/con_38_signin'

local Signin = class('Signin')

function Signin:ctor(ch, sysId)
	print("signin ctor")
	self.owner = ch
	self.sysId = sysId
	self.tablename = "Signin"

	-- 解析数据
	self.owner:getResultProcessor():bind(self.tablename, function (table,results)
			if table == self.tablename then
				if #results > 0 then
					self.data = gDataMgr:parse(results[1])
				end
			end
	end);

end

function Signin:dtor()
	if self.data then
		gDataMgr:destroy(self.data)
	end

	self.owner:getResultProcessor():unbind(self.tablename);
end

function Signin:login(mode)
	print("Signin login")

	return true;
end

function Signin:isDraw(day)
	return self.data:get_db_signstate() & (1 << (day-1))
end

function Signin:skipday(now)
	println("Signin skipday")

	if self:isSkipMonth() then
		self:reissue()
		self:nextRound()
	end

	local state = self.data:get_db_loginstate()
	state = state | (1 << self:getTotalDays())
	self.data:set_db_signtime(Time())
	self.data:set_db_loginstate(state)
	gDataMgr:update(self.data)
end

function Signin:logout()
	println("Signin logout")
end

function Signin:launch(sysId)
	if ~self.data then
		self.data = Signin_Data.new()
		-- self.data = gDataMgr:create()
		self.data:set_db_roleid(self.owner:getID())
		self.data:set_db_loginstate(1)
		self.data:set_db_rounds(0)
		self.data:set_db_signstate(0)
		gDataMgr:insert(self.data)
	end
end

function Signin:notify(sysId)
	if self.data then
		if self:getSignDays() < self:getTotalDays() then
			return 1
		end
	end
	return 0
end

function Signin:getTotalDays()
	return math.count1Bits(self.data:get_db_loginstate())
end

function Signin:isSkipMonth()
	return self:getTotalDays() >= SignConf.getSigninDays(self.data:get_db_rounds()) 
end

function Signin:nextRound()
	local round = self.data:get_db_rounds()
	local maxround = SignConf.getMaxRounds()

	round = round + 1
	if round > maxround then
			round = maxround
	end
	
	self.data:set_db_loginstate(0)
	self.data:set_db_signstate(0)
	self.data:set_db_rounds(round)
	gDataMgr:update(self.data)
end

return Signin
