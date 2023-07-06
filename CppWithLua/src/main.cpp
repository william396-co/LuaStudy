#include "../utils/print.h"
#include "../utils/xtime.h"
#include "luaenv.h"

#include <cassert>
#include <memory>

int main()
{
    println( "hello kaguya" );

    std::unique_ptr<LuaEnv> luaEnv = std::make_unique<LuaEnv>( "scripts", "routine.lua" );
    if ( !luaEnv->initialize() ) {
        println( "LuaEnv initialize failed" );
        return 1;
    }

    // kaguya::State state;
    //    state.dofile( "scripts/routine.lua" );

    return 0;
}
