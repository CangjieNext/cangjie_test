# TC-CJO-WR-values(组: Manual;执行域: manual)

- 用例意图: 普通 CJO 与 ExportASTSignature 缓存 CJO 的 cjoVersion 均为 (0,1,0)、version 为当前 cjc 版本;ASTLoader 读回三元组与写侧逐项一致(写读闭环)
- fixture: 配方见套件根 test_design.md §四(运行时现场手术,套件零 .cjo 预存)。 本场景只读产物,不制造变体。
- 判据: cjo_version_check/write_read/write_side/write_read_values
- 需求追溯: DT 设计补盲#8(写读闭环);FN-01 写侧规格;特性一半在写侧:SaveCjo/ExportASTSignature 必须写入当前三元组

写侧白盒 UT 规格(Manual:ASTLoader/SaveCjo C++ 测试挂载点)

步骤:
  1. 当前 cjc 编译普通包导出 CJO(产物A) + 触发增量签名导出 ExportASTSignature 缓存 CJO(产物B);
  2. flatc -t ./CjoFormat.fbs -- ./产物A.cjo 与 ./产物B.cjo 转 JSON;
  3. 断言:两产物 cjoVersion 字段均精确为 {0,1,0};version 字符串均为当前 cjc 版本;
  4. ASTLoader 读回产物A/产物B 的三元组 → 与写侧逐项一致(GetCjoVersion==写值,HasCjoVersion==true)。
  预言:完全确定(字段值相等断言)。