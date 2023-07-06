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

void ABC::bind( int id, Func && func )
{
    auto it = funcMap.find( id );
    if ( it == funcMap.end() ) {
        funcMap.emplace( id, func );

    } else {
        it->second = func;
    }
}

void ABC::unbind( int id )
{
    auto it = funcMap.find( id );
    if ( it != funcMap.end() ) {
        funcMap.erase( it );
    }
}
