#include "abc.h"

int ABC::cnt { 1000 };

void ABC::incRef()
{
    ++cnt;
}

int ABC::getRef()
{
    return cnt;
}

void ABC::bind( int id, cpp_fn const & pf )
{
    auto it = funcMap.find( id );
    if ( it != funcMap.end() )
        funcMap.erase( it );
    funcMap.emplace( id, pf );
}

void ABC::bind( int id, lua_ref const & self, lua_fn const & pf )
{
    auto it = funcMap.find( id );
    if ( it != funcMap.end() )
        funcMap.erase( it );
    funcMap.emplace( id, Processor { self, pf } );
}

void ABC::unbind( int id )
{
    auto it = funcMap.find( id );
    if ( it != funcMap.end() ) {
        funcMap.erase( it );
    }
}
