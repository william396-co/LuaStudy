#pragma once
#include "def.h"
#include <set>
#include "../utils/print.h"

class DataMgr
{
public:
    void insert( Base * data )
    {
        println( __PRETTY_FUNCTION__ );
        dataList.insert( data );
    }
    void destory( Base * data )
    {
        println( __PRETTY_FUNCTION__ );
        auto it = dataList.find( data );
        if ( it != dataList.end() ) {
            delete *it;
            dataList.erase( it );
        }
    }

    Derived* Parse()
    {
        auto ret = new Derived( "From DataMgr" );
        return ret;
    }

private:
    std::set<Base *> dataList;
};
