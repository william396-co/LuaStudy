#pragma once

#include "../utils/print.h"
#include "../thirdparty/lua/kaguya/kaguya.hpp"

#include <functional>
#include <unordered_map>
#include <string>

using lua_ref = kaguya::LuaRef;
using lua_fn = kaguya::LuaFunction;
using cpp_fn = std::function<void( int, std::string const & )>;

class ABC
{
    //    using lua_fn = kaguya::LuaFunction;
    //  using cpp_fn = std::function<void( int, std::string const & )>;

    struct Processor
    {
    private:
        enum class fn_type
        {
            cpp,
            lua
        };

    public:

        Processor( cpp_fn const & fn )
            : type( fn_type::cpp ), cppfn( fn ) {}
        Processor( lua_ref self, lua_fn fn )
            : type( fn_type::lua), self( self ), luafn( fn ) {}
        void operator()( int idx, std::string const & str )
        {
            switch ( type ) {
                case fn_type::lua: luafn( idx, str ); break;
                case fn_type::cpp: std::invoke( cppfn, idx, str ); break;
            }
        }

    private:
        fn_type type;
        lua_ref self;
        lua_fn luafn;
        cpp_fn cppfn;
    };

public:
    ABC()
        : data {}
    {
        println( __PRETTY_FUNCTION__, "(", data, ")" );
        incRef();
    }

    ABC( std::string const & d )
        : data { d }
    {
        println( __PRETTY_FUNCTION__, "(", data, ")" );
    }
    ~ABC()
    {
        println( __PRETTY_FUNCTION__, "(", data, ")" );
    }

    void overload1() { println( __PRETTY_FUNCTION__ ); }
    void overload2( int ) { println( __PRETTY_FUNCTION__ ); }

    void update( std::string const & d )
    {
        data = d;
    }

    std::string const & getData() const
    {
        return data;
    }

    void bind( int id, cpp_fn const & pf );
    void bind( int id, lua_ref const & ref, lua_fn const & pf );
    void dataset( int id, std::string const & str )
    {
        data = str;
        println( __PRETTY_FUNCTION__, "(", id, ",", str, ")" );
    }
    void process( int id )
    {
        auto it = funcMap.find( id );
        if ( it != funcMap.end() ) {
            it->second( id, id == 1 ? "testXXXX" : "testYYYYY" );
        }
    }

    void unbind( int id );

    static void incRef();

    static int getRef();

private:
    std::string data;
    std::unordered_map<int, Processor> funcMap;
    static int cnt;
};
