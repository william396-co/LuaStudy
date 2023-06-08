#include <stdio.h>
#include <stdlib.h>

#include "lua.h"
#include "lauxlib.h"
#include "lualib.h"

int getglobaint( lua_State * L, const char * var )
{
    int isnum, result;
    lua_getglobal( L, var );
    result = (int)lua_tointegerx( L, -1, &isnum );
    if ( !isnum )
        printf( "'%s' should be a number\n", var );
    lua_pop( L, 1 );
    return result;
}

void load( lua_State * L, const char * fname, int * w, int * h )
{
    if ( luaL_loadfile( L, fname ) || lua_pcall( L, 0, 0, 0 ) )
        printf( "cannot run config. file: %s\n", lua_tostring( L, -1 ) );
    *w = getglobaint( L, "width" );
    *h = getglobaint( L, "height" );
}
