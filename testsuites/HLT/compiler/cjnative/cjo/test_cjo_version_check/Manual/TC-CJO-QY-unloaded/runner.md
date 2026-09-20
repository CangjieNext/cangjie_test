# TC-CJO-QY-unloaded(组: Manual;执行域: manual)

- 用例意图: 未加载查询:header 未加载的 loader → HasCjoVersion=false、三元组默认 {0,0,0}、三接口均 false、不崩溃;缺版本时 AtLeast=false 为 §4.1 明文约束(防把未知版本误判为满足要求)
- fixture: fixture:未加载态 loader(UT 内直构,不依赖 cjo 文件——单测边界)。
- 判据: cjo_version_check/whitebox/version_query/query_unloaded
- 需求追溯: DT 设计补盲#9(分流接口);白盒:未加载态边界;§4.1 缺版本明文约束锚

查询接口白盒 UT 规格(Manual)

构造未读取 header 的 ASTLoader(或读入无 cjoVersion 字段的 CJO)→
  HasCjoVersion=false;
  GetCjoVersion 返回默认 {0,0,0};
  IsCjoVersionAtLeast/AtMost/Exactly 对 required=(0,0) 均返回 false 且不崩溃
  (缺版本时 AtLeast=false 是 design-spec §4.1 明文约束——防把未知版本误判为满足要求)。