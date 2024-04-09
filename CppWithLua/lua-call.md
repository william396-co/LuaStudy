FunctionResultProxy::ReturnValue  = state()["fn"](...)  返回函数结果 无state状态
FunctionResultProxy::ReturnValue = state()["fn").call(...)



返回函数结果 + state的状态(ReturnValue->FunctionResults)
TableKeyReferenceProxy fn
FunctionResults= fn(...) 

无state状态
inline void FunctionResultProxy::ReturnValue(lua_State *state,
                                             int return_status, int retindex,
                                             types::typetag<void>) {
  KAGUYA_UNUSED(return_status); //无state状态
  lua_settop(state, retindex - 1);
}

inline FunctionResults
FunctionResultProxy::ReturnValue(lua_State *state, int return_status,
                                 int retindex,
                                 types::typetag<FunctionResults>) {
  return FunctionResults(state, return_status, retindex);
}

// FunctionResults保护state状态信息
class FunctionResults{
private:
  mutable lua_State *state_;
  int resultStatus_;
  int resultCount_;
};

