local Set = require "set"

s1 = Set.new{2,3,5,7,11,17,23}
s2 = Set.new{1,3,5,7,9}
print(getmetatable(s1))
print(getmetatable(s2))


print(Set.tostring(s1))
s3 = s1 + s2
print(Set.tostring(s3))

print(Set.tostring((s1+s2)*s1))

s = Set.new{1,2,3}
-- s = s +8

s5 = Set.new{2,4}
s6 = Set.new{4,10,2}
print(s5 <= s6) -- true
print(s5 < s6) -- true
print(s5 >= s5) -- true
print(s5 > s5) --false
print(s5 == s6 * s5) -- true


print(s5)
print(s6)

print(Set.new{2,3,4})


print(getmetatable(s1)) -- not your business
setmetatable(s1,{})
