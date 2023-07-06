#include "../utils/print.h"
#include "../utils/xtime.h"

#include "../thirdparty/lua/kaguya/kaguya.hpp"

int main()
{
    println( "hello kaguya" );

    kaguya::State state;
    state.dofile( "scripts/routine.lua" );

    return 0;
}
