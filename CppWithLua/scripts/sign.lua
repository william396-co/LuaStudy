local Sign= class("Sign")

function Sign:ctor( name, handler)
	handler:bind(3, self,function(id, str)
		print("process args",id,str)	
		self.idx = id 
		self.str = str

--		print("==== bind callback=====================")
--		print(self.name,self.idx,self.str)
--		print("==== bind callback=====================")

	end)
	self.name = name
	self.idx =100
	print("Sign constructor[",self.name,self.idx,self.str,"]")
end


function Sign:output()
	print("Sign:output",self.name, self.idx,self.str)
end

return Sign
