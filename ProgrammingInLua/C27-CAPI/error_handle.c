#include <stdio.h>
#include "lua.h"
#include "lauxlib.h"

int foo( lua_State * L )
{
    printf( "%s\n", __PRETTY_FUNCTION__ );
}

int secure_foo( lua_State * L )
{
    lua_pushcfunction( L, foo );
    return ( lua_pcall( L, 0, 0, 0 ) == 0 );
}

int main()
{
    lua_State * L = luaL_newstate();

    secure_foo( L );

    lua_close( L );

    return 0;
}
