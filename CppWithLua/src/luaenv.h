#pragma once
#include <string>

#include "../thirdparty/lua/luaenv.h"

class LuaEnv : public ILuaEnv
{
public:
    LuaEnv( std::string const & root, std::string const & routine )
        : ILuaEnv( root, routine ) {}

public:
    virtual void hook() override;
    virtual void unhook() override;
    virtual ILuaEnv * clone() override;
    virtual void registering() override;
};
