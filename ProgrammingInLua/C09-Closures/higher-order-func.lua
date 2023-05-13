-- f'(x) = (f(x + d) - f(x)) / d
derivative = function(f, delta)
    delta = delta or 1e-4
    return function(x)
            return (f(x + delta) - f(x))/delta
    end
end

c = derivative(math.sin)
print(math.cos(5.2), c(5.2))

print(math.cos(10), c(10))
