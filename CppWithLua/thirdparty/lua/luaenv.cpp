#include <cstdio>
#include <cassert>
#include <string>

#include "luaenv.h"
#include "../../utils/xtime.h"
#include "../../utils/print.h"

bool lua_addpath( kaguya::State * state, int32_t type, const std::string & path )
{
    std::string newpath;
    std::string suffix, rawpath;

    if ( path.empty() ) {
        return false;
    }

    if ( type == 1 ) {
        suffix = "?.lua";
        rawpath = "package.path";
    } else if ( type == 2 ) {
        suffix = "?.so";
        rawpath = "package.cpath";
    }

    newpath += rawpath;
    newpath += " = ";
    newpath += rawpath;
    newpath += " .. \"";
    newpath += ";";
    newpath += path;

    if ( *path.rbegin() != '/' ) {
        newpath += "/";
    }

    newpath += suffix;
    newpath += "\" ";

    return state->dostring( newpath );
}

ILuaEnv::ILuaEnv( const std::string & rootpath, std::string const & routinefile )
    : m_Routine( rootpath + "/" + routinefile ),
      m_RootPath( rootpath ),
      m_State( nullptr )
{
    println( __PRETTY_FUNCTION__ );
}

ILuaEnv::~ILuaEnv()
{
    println( __PRETTY_FUNCTION__ );
    finalize();
}

bool ILuaEnv::initialize()
{
    m_State = new kaguya::State;
    if ( m_State == nullptr ) {
        // LOG_ERROR( "ILuaEnv::initialize() : new kaguya::State failed .\n" );
        return false;
    }

    // 注册panic函数
    m_State->setErrorHandler( exceptions );
    lua_atpanic( m_State->state(), ILuaEnv::panic );

    // 注册
    initEnviroment();
    // 加载入口文件
    m_State->dofile( m_Routine );

    // 钩子
    hook();

    return true;
}

void ILuaEnv::finalize()
{
    unhook();

    delete m_State;
}

void ILuaEnv::gc2()
{
    m_State->gc();
}

size_t ILuaEnv::memusage()
{
    size_t usage = 0ULL;

    usage = lua_gc( m_State->state(), LUA_GCCOUNT, 0 );
    usage <<= 10ULL;
    usage += lua_gc( m_State->state(), LUA_GCCOUNTB, 0 );

    return usage;
}

void ILuaEnv::dofile( const std::string & file )
{
    m_State->dofile( file );
}

void ILuaEnv::dostring( const std::string & script )
{
    m_State->dostring( script );
}

bool ILuaEnv::addpath( const std::string & path )
{
    lua_addpath( m_State, 1, path );
    lua_addpath( m_State, 2, path );

    return true;
}

int32_t ILuaEnv::panic( lua_State * L )
{
    (void)L; // to avoid warnings */
    //  LOG_FATAL( "PANIC: unprotected error in call to Lua API ({}) .\n", lua_tostring( L, -1 ) );
    return 0;
}

void ILuaEnv::exceptions( int code, const char * error )
{
    printf( "ILuaEnv::exceptions(Code:%u, Error:'%s') .\n", code, error );
    //    LOG_ERROR( "ILuaEnv::exceptions(Code:{}, Error:'{}') .\n", code, error );
}

void ILuaEnv::logger( int32_t level, const char * buffer )
{
    //  LOGGER( level, buffer );
}

void ILuaEnv::initEnviroment()
{
    // 添加ROOT
    addpath( m_RootPath );

    // 初始化其他函数
    kaguya::LoadLibs libs {
        { "_G", luaopen_base },
        // { "LUA_MATHLIBNAME", luaopen_math },
        // { "LUA_STRLIBNAME", luaopen_string },
        // { "pb", luaopen_pb },
        // { "vec3", luaopen_vec3 },
        // { "rapidjson", luaopen_rapidjson }
    };
    m_State->openlibs( libs );

    // 定义全局变量
    ( *m_State )["ENV"] = this;
    ( *m_State )["ROOT"] = m_RootPath;
    // 定义全局函数
    ( *m_State )["logger"] = ILuaEnv::logger;
    ( *m_State )["traverse"] = ILuaEnv::traverse;
    ( *m_State )["now_us"] = utils::now_us;
    ( *m_State )["now_s"] = utils::now_s;
    ( *m_State )["now_ms"] = utils::now_ms;

    // 注册其他接口
    registering();
}

void ILuaEnv::helloworld( int32_t n )
{
    //  LOG_DEBUG( "ILuaEnv::helloworld() : ------ [global.lua]'s GlobalValue={} ------\n", n );
}

std::vector<std::string> ILuaEnv::traverse( const std::string & path, const std::string & suffix, bool recursive )
{
    std::vector<std::string> files;
    //  utils::PathUtils( path ).traverse(
    //    files, suffix.empty() ? nullptr : suffix.c_str(), recursive );
    return files;
}

