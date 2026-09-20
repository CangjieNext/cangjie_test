# TC-CJO-PF-perf(组: External;执行域: external)

- 用例意图: 多依赖工程 --profile-compile-time 取样——兼容缓存构建无明显版本检查开销;不兼容缓存耗时接近全量构建且无错误诊断(回退耗时上升为预期行为,首次回退后缓存重导出、后续构建恢复命中,不演变为永久回退退化)
- fixture: 基准:当前 cjc 编译 pkg/(导出 public func depValue(): Int64)得 dep_v010.cjo(cjoVersion=(0,1,0),version=当前 cjc 版本)。变体 fixture:./flatc -t ./CjoFormat.fbs -- ./dep_v010.cjo 转 JSON(flatc 输出 relaxed JSON,键名不带引号;stderr 的 snake_case warning 可忽略)→ 按用例说明修改/删除 cjoVersion(必要时同步改 version 字符串)→ ./flatc -b ./CjoFormat.fbs ./dep_v010.json 得 dep_v010.bin → mv 改名回 dep_v010.cjo → 断言 Verifier 通过(仅版本字段变化不得引入结构错误)。字节定点修改仅作 flatc 不可用时的兜底。工具:cjo_mutate.py 一次性产出全部命名 fixture。缓存形态(增量缓存用例):被测门禁读的是缓存内 <hash>.cjo 的 cjoVersion 三元组(与跨包路径同一矩阵),手术目标即该字段(cjo_mutate.py --patch-cache 对 .cached 内 cjo 做 cjoVersion 手术,flatc/字节兜底同跨包配方)。注意勿混淆两类缓存机制:同目录 .cachedast 的 HashedPackage.version:string 是既有 CANGJIE_VERSION 门禁的字段(DT 设计 FN-05 明示两类机制勿混淆),不属于本特性手术目标。缓存 fixture 由 cjo_mutate.py 在现场编译产出 .cached 后手术;不以源码替换注入(同编译器重编源码版本必然一致,注入空转)。 本场景不改字段语义,仅性能取样;兼容/不兼容缓存两形态由 cjo_mutate.py 生成。
- 判据: cjo_version_check/robustness/perf_fuzz/perf_negligible
- 需求追溯: DT 设计补盲#10(性能);DT:缓存×开销甄别;FN 性能规格:固定读取+常量比较

性能取样 runner 规格(External:--profile-compile-time 治具)

工程:多依赖工程(≥8 依赖);取样:
  A. 兼容缓存构建 vs 干净全量构建,--profile-compile-time 多次取样;
     断言:兼容缓存构建无明显额外开销(版本检查只加固定三字节读取+常量比较);
  B. 不兼容缓存构建:
     断言:耗时接近全量构建且无错误诊断(回退耗时上升为预期行为);
     首次回退后缓存重导出当前版本、后续构建恢复命中(与 selfheal 同机制,
     不得演变为每次构建都回退的永久退化)。
预言:阈值型断言(允许的回退开销 vs 无谓开销),取样口径在 runner 内固定。