#pragma once

#include "../utils/print.h"
#include "../thirdparty/lua/kaguya/kaguya.hpp"

#include <functional>
#include <unordered_map>
#include <string>

struct Processor
{
    using cpp_fn = std::function<void( int idx, std::string const & str )>;

    enum fn_type
    {
        cpp,
        lua
    };

public:
    Processor( cpp_fn fn )
        : type( cpp ), cppfn( fn ) {}
    Processor( kaguya::LuaFunction fn )
        : type( lua ), luafn( fn ) {}

    void operator()( int idx, std::string const & str )
    {
        switch ( type ) {
            case cpp:
                std::invoke( cppfn, idx, str );
                break;
            case lua:
                luafn( idx, str );
                break;
        }
    }

private:
    fn_type type;
    kaguya::LuaFunction luafn;
    cpp_fn cppfn;
};

class ABC
{
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
    void bind( int id, Processor func );

    void dataset( int id, std::string const & str )
    {
        println( __PRETTY_FUNCTION__, "(", id, ",", str, ")" );
    }
    void process( int id )
    {
        auto it = funcMap.find( id );
        if ( it != funcMap.end() ) {
            it->second( id, id==1? "testXXXX":"testYYYYY" );
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
