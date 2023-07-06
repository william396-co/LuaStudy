#pragma once

#include "../utils/print.h"

#include <functional>
#include <unordered_map>

using Func = std::function<void( int, std::string const & )>;

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

    void bind( int id, Func && func );

    template<typename... Args>
    void execute( int id, Args &&... args )
    {
        auto it = funcMap.find( id );
        if ( it != funcMap.end() ) {
            ( it->second )( std::forward<Args>( args )... );
        }
    }

    void unbind( int id );

    static void incRef();

    static int getRef();

private:
    std::string data;
    std::unordered_map<int, Func> funcMap;
    static int cnt;
};
