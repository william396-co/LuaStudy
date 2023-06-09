#include <stdio.h>
#include <string.h>
#ifdef ___cplusplus
extern "C"
{
#endif
#include "lua.h"
#include "lauxlib.h"
#include "lualib.h"
#include <stdarg.h>
#include <stdlib.h>
#ifdef __cplusplus
}
#endif

/*
void error( lua_State * L, const char * fmt, ... )
{
    va_list argp;
    va_start( argp, fmt );
    vfprintf( stderr, fmt, argp );
    va_end( argp );
    lua_close( L );
    exit( EXIT_FAILURE );
}
*/
int main()
{
    char buff[256];
    int error;
    lua_State * L = luaL_newstate(); /* opens lua */
    luaL_openlibs( L );              /* opens the standard library */

    while ( fgets( buff, sizeof( buff ), stdin ) != NULL ) {
        error = luaL_loadstring( L, buff ) || lua_pcall( L, 0, 0, 0 );
        if ( error ) {
            fprintf( stderr, "%s\n", lua_tostring( L, -1 ) );
            lua_pop( L, 1 ); /* pop error message from the stack*/
        }
    }
    lua_close( L );
    return 0;
}
