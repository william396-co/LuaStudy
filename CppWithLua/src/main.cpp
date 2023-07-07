#include "../utils/print.h"
#include "../utils/xtime.h"
#include "luaenv.h"

#include <cassert>
#include <memory>
#include <thread>
#include <vector>
#include <algorithm>
#include <functional>

void multi_luaState( int n );

int main()
{

    multi_luaState( 3 );
    /*   std::unique_ptr<LuaEnv> luaEnv = std::make_unique<LuaEnv>( "scripts", "routine.lua" );
       if ( !luaEnv->initialize() ) {
           println( "LuaEnv initialize failed" );
           return 1;
       }*/

    // kaguya::State state;
    //    state.dofile( "scripts/routine.lua" );

    return 0;
}

void multi_luaState( int n )
{
    std::vector<std::thread> tds;

    for ( int i = 0; i < n; ++i ) {
        tds.emplace_back( []() {
            std::unique_ptr<LuaEnv> luaEnv = std::make_unique<LuaEnv>( "scripts", "routine.lua" );
            if ( !luaEnv->initialize() ) {
                println( "LuaEnv initialize failed" );
            }
            println( "thread ", std::this_thread::get_id(), " lua state running" );
        } );
    }

    std::for_each( tds.begin(), tds.end(), std::mem_fn( &std::thread::join ) );
}
