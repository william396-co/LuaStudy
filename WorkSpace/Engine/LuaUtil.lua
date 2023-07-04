local unpack = unpack or table.unpack

-- 解决原生pack的nil截断问题，SafePack与SafeUnpack要成对使用
function SafePack(...)
	local params = {...}
	params.n = select('#', ...)
	return params
end

-- 解决原生unpack的nil截断问题，SafePack与SafeUnpack要成对使用
function SafeUnpack(safe_pack_tb)
	return unpack(safe_pack_tb, 1, safe_pack_tb.n)
end

-- 对两个SafePack的表执行连接
function ConcatSafePack(safe_pack_l, safe_pack_r)
	local concat = {}
	for i = 1,safe_pack_l.n do
		concat[i] = safe_pack_l[i]
	end
	for i = 1,safe_pack_r.n do
		concat[safe_pack_l.n + i] = safe_pack_r[i]
	end
	concat.n = safe_pack_l.n + safe_pack_r.n
	return concat
end

-- 闭包绑定
function Bind(self, func, ...)
	assert(self == nil or type(self) == "table")
	assert(func ~= nil and type(func) == "function")
	local params = nil
	if self == nil then
		params = SafePack(...)
	else
		params = SafePack(self, ...)
	end
	return function(...)
		local args = ConcatSafePack(params, SafePack(...))
		return func(SafeUnpack(args))
	end
end

-- 回调绑定
-- 重载形式：
-- 1、成员函数、私有函数绑定：BindCallback(obj, callback, ...)
-- 2、闭包绑定：BindCallback(callback, ...)
function BindCallback(...)
	local bindFunc = nil
	local params = SafePack(...)
	assert(params.n >= 1, "BindCallback : error params count!")
	if type(params[1]) == "table" and type(params[2]) == "function" then
		bindFunc = Bind(...)
	elseif type(params[1]) == "function" then
		bindFunc = Bind(nil, ...)
	else
		error("BindCallback : error params list!")
	end
	return bindFunc
end
