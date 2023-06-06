function factory(_ENV)
    return function() return a end
end

f1 = factory{a = 6}
f2 = factory{a = 7}
print(f1()) --> 6
print(f2()) --> 7
