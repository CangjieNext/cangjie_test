# TC-CJO-WR-values(组: Manual;执行域: manual)

- 用例意图: 普通 CJO 与 ExportASTSignature 缓存 CJO 的 cjoVersion 均为 (0,1,0)、version 为当前 cjc 版本;ASTLoader 读回三元组与写侧逐项一致(写读闭环)
- fixture: 基准:当前 cjc 编译 pkg/(导出 public func depValue(): Int64)得 dep_v010.cjo(cjoVersion=(0,1,0),version=当前 cjc 版本)。变体 fixture:./flatc -t ./CjoFormat.fbs -- ./dep_v010.cjo 转 JSON(flatc 输出 relaxed JSON,键名不带引号;stderr 的 snake_case warning 可忽略)→ 按用例说明修改/删除 cjoVersion(必要时同步改 version 字符串)→ ./flatc -b ./CjoFormat.fbs ./dep_v010.json 得 dep_v010.bin → mv 改名回 dep_v010.cjo → 断言 Verifier 通过(仅版本字段变化不得引入结构错误)。字节定点修改仅作 flatc 不可用时的兜底。工具:cjo_mutate.py 一次性产出全部命名 fixture。缓存形态(增量缓存用例):被测门禁读的是缓存内 <hash>.cjo 的 cjoVersion 三元组(与跨包路径同一矩阵),手术目标即该字段(cjo_mutate.py --patch-cache 对 .cached 内 cjo 做 cjoVersion 手术,flatc/字节兜底同跨包配方)。注意勿混淆两类缓存机制:同目录 .cachedast 的 HashedPackage.version:string 是既有 CANGJIE_VERSION 门禁的字段(DT 设计 FN-05 明示两类机制勿混淆),不属于本特性手术目标。缓存 fixture 由 cjo_mutate.py 在现场编译产出 .cached 后手术;不以源码替换注入(同编译器重编源码版本必然一致,注入空转)。 本场景只读产物,不制造变体。
- 判据: cjo_version_check/write_read/write_side/write_read_values
- 需求追溯: DT 设计补盲#8(写读闭环);FN-01 写侧规格;特性一半在写侧:SaveCjo/ExportASTSignature 必须写入当前三元组

写侧白盒 UT 规格(Manual:ASTLoader/SaveCjo C++ 测试挂载点)

步骤:
  1. 当前 cjc 编译普通包导出 CJO(产物A) + 触发增量签名导出 ExportASTSignature 缓存 CJO(产物B);
  2. flatc -t ./CjoFormat.fbs -- ./产物A.cjo 与 ./产物B.cjo 转 JSON;
  3. 断言:两产物 cjoVersion 字段均精确为 {0,1,0};version 字符串均为当前 cjc 版本;
  4. ASTLoader 读回产物A/产物B 的三元组 → 与写侧逐项一致(GetCjoVersion==写值,HasCjoVersion==true)。
  预言:完全确定(字段值相等断言)。