#pragma once

#include <string>

class Base
{
public:
    Base() {}
    virtual ~Base() {}

    virtual void test();
};

class Derived : public Base
{
public:
    Derived();
    Derived( std::string const & name );
    virtual ~Derived();

    virtual void test();

    std::string const & getTableName() const
    {
        return tablename;
    }

private:
    std::string tablename;
};
