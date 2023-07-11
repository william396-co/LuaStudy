local Sign= class("Sign")

function Sign:ctor()
	gHandler:bind(3, self, function(idx, str)
		print("closure param",idx,str)	
		self.idx = idx
		self.str = str
		print("==== bind callback=====================")
		print(self.idx,self.str)
		print("==== bind callback=====================")

	end)
	self.idx =100
	self.str = "Sign"
	print("Sign constructor",self.idx,self.str)
end


function Sign:output()
	print(self.idx)
	print(self.str)
end

return Sign
