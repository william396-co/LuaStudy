#include "luaenv.h"
#include "abc.h"
#include "def.h"
#include "data_mgr.h"
#include "../thirdparty/lua/kaguya/kaguya.hpp"

#include "../utils/print.h"
#include <string>

void LuaEnv::hook()
{
    println( __PRETTY_FUNCTION__ );
}
void LuaEnv::unhook()
{
    println( __PRETTY_FUNCTION__ );
}
ILuaEnv * LuaEnv::clone()
{
    println( __PRETTY_FUNCTION__ );
    return nullptr;
}
void LuaEnv::registering()
{
    println( __PRETTY_FUNCTION__ );

    state()["DataMgr"].setClass( kaguya::UserdataMetatable<DataMgr>()
                                     //                                     .setConstructors<DataMgr>()
                                     .addFunction( "insert", &DataMgr::insert )
                                     .addFunction( "destory", &DataMgr::destory )
                                     .addFunction( "parse", &DataMgr::Parse ) );

    /*   state()["Base"].setClass( kaguya::UserdataMetatable<Base>()
                                     .setConstructors<Base()>()
                                     .addFunction( "test", &Base::test ) );*/

    state()["Derived"].setClass( kaguya::UserdataMetatable<Derived>()
                                     .setConstructors<Derived(), Derived( std::string const & )>()
                                     .addFunction( "test", &Derived::test )
                                     .addFunction( "getTableName", &Derived::getTableName ) );

    // state()["Processor"].setClass( kaguya::UserdataMetatable<Processor>().setConstructors<Processor( kaguya::LuaRef, kaguya::LuaFunction )>() );

    state()["ABC"].setClass( kaguya::UserdataMetatable<ABC>()
                                 .setConstructors<ABC(), ABC( std::string const & )>()
                                 .addFunction( "update", &ABC::update )
                                 .addFunction( "getData", &ABC::getData )
                                 //        .addFunction( "bind", &ABC::bind )
                                 .addOverloadedFunctions( "bind", static_cast<void ( ABC::* )( int, lua_ref const &, lua_fn const & )>( &ABC::bind ) )
                                 .addFunction( "unbind", &ABC::unbind )
                                 .addFunction( "process", &ABC::process )
                                 .addOverloadedFunctions( "overload", &ABC::overload1, &ABC::overload2 ) );

    state()["incRef"] = &ABC::incRef;
    state()["getRef"] = &ABC::getRef;
    state()["lambdatest"] = kaguya::function( []() {
        println( "call C++ lambda function" );
    } ); // use kaguay::function package c++ lambda
}

