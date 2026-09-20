# TC-CJO-QY-cross-major(组: Manual;执行域: manual)

- 用例意图: requiredMajor=1 → 三接口均 false;跨 major 不满足同一 major 内的版本要求(§4.1 约束),不被误判为可排序版本
- fixture: cjoVersion=(0,1,0) 与 (255,1,0) 各一。
- 判据: cjo_version_check/whitebox/version_query/query_cross_major
- 需求追溯: DT 设计补盲#9(分流接口);白盒:跨 major 不可排序语义锚

查询接口白盒 UT 规格(Manual)

装载 (0,1,0) 与 (255,1,0) 各一 → requiredMajor=1:
  三接口对两种装载态均返回 false;
  (0,1,0) 装载 + requiredMajor=1:不得因 0<1 的可排序误判产生任何 true;
  跨 major 不被当作可排序版本比较(§4.1 约束)。