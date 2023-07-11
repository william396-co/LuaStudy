#include "../utils/print.h"
#include "../utils/xtime.h"
#include "luaenv.h"
#include "abc.h"

#include <cassert>
#include <memory>
#include <thread>
#include <vector>
#include <algorithm>
#include <functional>

void multi_luaState( int n );
int defargfn( int a = 1, int b = 2, int c = 3 )
{
    return a * b * c;
}

int main()
{

    //   multi_luaState( 1 );
    std::unique_ptr<ILuaEnv> luaEnv = std::make_unique<LuaEnv>( "scripts", "routine.lua" );
    if ( !luaEnv->initialize() ) {
        println( "LuaEnv initialize failed" );
        return 1;
    }

    // registering
    {

        luaEnv->state()["va_fun"] = kaguya::function( []( kaguya::VariadicArgType args ) {for (auto v : args) { std::cout << v.get<std::string>() << ","; }std::cout << std::endl; } ); // C++11 lambda
                                                                                                //      state( "va_fun(3,4,6,\"text\",6,444)" );                                      // 3,4,6,text,6,444,
        luaEnv->state()["testfn"] = &defargfn;

        ABC gabc( "gABC" );
        luaEnv->state()["gABC"] = &gabc;

        using namespace std::placeholders;
        gabc.bind(1,{std::bind(&ABC::dataset,&gabc,_1,_2)});
        gabc.process(1);
    }

    // 加载lua测试代码
    luaEnv->dofile( "scripts/test.lua" );

    // kaguya::State luaEnv->state()
    //    luaEnv->state()dofile( "scripts/routine.lua" );

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
            println( "thread ", std::this_thread::get_id(), " lua luaEnv->state()running" );
        } );
    }

    std::for_each( tds.begin(), tds.end(), std::mem_fn( &std::thread::join ) );
}
