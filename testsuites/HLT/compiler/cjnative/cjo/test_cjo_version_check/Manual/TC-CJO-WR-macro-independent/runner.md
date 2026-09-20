# TC-CJO-WR-macro-independent(组: Manual;执行域: manual)

- 用例意图: 启用/禁用 native backend 两配置导出的 CJO 均含版本字段,交叉导入无差异;版本常量定义不再受 native backend 宏控制(DT 设计明确)
- fixture: 基准:当前 cjc 编译 pkg/(导出 public func depValue(): Int64)得 dep_v010.cjo(cjoVersion=(0,1,0),version=当前 cjc 版本)。变体 fixture:./flatc -t ./CjoFormat.fbs -- ./dep_v010.cjo 转 JSON(flatc 输出 relaxed JSON,键名不带引号;stderr 的 snake_case warning 可忽略)→ 按用例说明修改/删除 cjoVersion(必要时同步改 version 字符串)→ ./flatc -b ./CjoFormat.fbs ./dep_v010.json 得 dep_v010.bin → mv 改名回 dep_v010.cjo → 断言 Verifier 通过(仅版本字段变化不得引入结构错误)。字节定点修改仅作 flatc 不可用时的兜底。工具:cjo_mutate.py 一次性产出全部命名 fixture。缓存形态(增量缓存用例):被测门禁读的是缓存内 <hash>.cjo 的 cjoVersion 三元组(与跨包路径同一矩阵),手术目标即该字段(cjo_mutate.py --patch-cache 对 .cached 内 cjo 做 cjoVersion 手术,flatc/字节兜底同跨包配方)。注意勿混淆两类缓存机制:同目录 .cachedast 的 HashedPackage.version:string 是既有 CANGJIE_VERSION 门禁的字段(DT 设计 FN-05 明示两类机制勿混淆),不属于本特性手术目标。缓存 fixture 由 cjo_mutate.py 在现场编译产出 .cached 后手术;不以源码替换注入(同编译器重编源码版本必然一致,注入空转)。 本场景变体为构建配置(native backend 宏开/关),非字段篡改。
- 判据: cjo_version_check/write_read/write_side/write_macro_independence
- 需求追溯: DT 设计补盲#8(宏无关性);FN-01;版本定义与宏配置解耦回归

宏配置白盒 UT 规格(Manual:双构建配置)

步骤:
  1. 启用 native backend 宏的构建配置编译 pkg 导出 CJO(产物A);
  2. 禁用 native backend 宏的构建配置编译同一 pkg 导出 CJO(产物B);
  3. flatc -t ./CjoFormat.fbs 分别转 JSON 断言:产物A/产物B 均含 cjoVersion 字段且同为 {0,1,0};
  4. 交叉导入:下游分别消费 A/B/A+B,均无版本诊断(PIPE-0 + scan-not)。
  预言:两种配置均写入版本字段,交叉导入无兼容性差异。