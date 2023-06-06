a = 15 -- create a global variable
_ENV = {g = _G} -- change current environment
a = 1 -- create a field in _ENV
g.print(_ENV.a, g.a) --> 1 15
