#include "def.h"
#include "../utils/print.h"

Base::~Base()
{
    println( __PRETTY_FUNCTION__ );
}
/*
void Base::test()
{
    println( __PRETTY_FUNCTION__ );
}
*/
Derived::~Derived()
{
    println( __PRETTY_FUNCTION__, "(", tablename, ")" );
}

Derived::Derived( std::string const & name )
    : tablename { name }
{
    println( __PRETTY_FUNCTION__, "(", tablename, ")" );
}

Derived::Derived()
    : tablename {}
{
    println( __PRETTY_FUNCTION__, "(", tablename, ")" );
}

void Derived::test()
{
    println( __PRETTY_FUNCTION__ );
}
