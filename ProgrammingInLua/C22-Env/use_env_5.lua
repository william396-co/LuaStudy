a = 15 -- create a global variable
_ENV = {_G = _G} -- change current environment
a = 1 -- create a field in _ENV
_G.print(_ENV.a, _G.a) --> 1 15
