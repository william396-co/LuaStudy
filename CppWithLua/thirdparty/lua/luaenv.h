#pragma once
#include <string>
#include "kaguya.hpp"

// 添加lua路径
bool lua_addpath( kaguya::State * state, int32_t type, const std::string & path );

//
// Lua环境
//
class ILuaEnv
{
public:
    ILuaEnv( const std::string & rootpath, std::string const & routinefile );
    virtual ~ILuaEnv();
    // 钩子(替换lua全局方法)
    virtual void hook() { }
    virtual void unhook() {  }
    // 克隆
    virtual ILuaEnv * clone() { return nullptr; }
    // 注册
    virtual void registering() {}

    // 初始化/销毁
    bool initialize();

    // 强制gc
    void gc2();
    size_t memusage();

    // lua栈和kaguya栈
    kaguya::State & state() const { return *m_State; }
    lua_State * luastate() const { return m_State->state(); }
    // 根目录以及入口脚本
    const std::string & root() const { return m_RootPath; }
    const std::string & routine() const { return m_Routine; }

    // 添加路径
    // package.path
    // package.cpath
    bool addpath( const std::string & p );

    // 调用文件
    void dofile( const std::string & file );
    void dostring( const std::string & script );

protected:
    void finalize();

    // 注册
    void initEnviroment();
    // 测试函数
    void helloworld( int32_t n );
    // lua异常处理
    static int32_t panic( lua_State * L );
    // 异常函数
    static void exceptions( int code, const char * error );
    // 日志接口
    static void logger( int32_t level, const char * buffer );
    // 遍历文件
    static std::vector<std::string> traverse(
        const std::string & path, const std::string & suffix, bool recursive );

protected:
    std::string m_Routine;   // 入口文件
    std::string m_RootPath;  // 根目录
    kaguya::State * m_State; // kaguya状态机
};
