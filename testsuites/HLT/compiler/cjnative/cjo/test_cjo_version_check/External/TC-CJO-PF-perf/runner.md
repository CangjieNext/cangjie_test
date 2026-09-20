# TC-CJO-PF-perf(组: External;执行域: external)

- 用例意图: 多依赖工程 --profile-compile-time 取样——兼容缓存构建无明显版本检查开销;不兼容缓存耗时接近全量构建且无错误诊断(回退耗时上升为预期行为,首次回退后缓存重导出、后续构建恢复命中,不演变为永久回退退化)
- fixture: 配方见设计文档 test_design.md(位于 talkless/test_designs/lang/cjo_version_check) §四(运行时现场手术,套件零 .cjo 预存)。 本场景不改字段语义,仅性能取样;兼容/不兼容两形态由现场手术产出。
- 判据: cjo_version_check/robustness/perf_fuzz/perf_negligible
- 需求追溯: DT 设计补盲#10(性能);DT:缓存×开销区分;FN 性能规格:固定读取+常量比较

性能取样 runner 规格(External:--profile-compile-time 治具)

工程:多依赖工程(≥8 依赖);取样:
  A. 兼容缓存构建 vs 干净全量构建,--profile-compile-time 多次取样;
     断言:兼容缓存构建无明显额外开销(版本检查只加固定三字节读取+常量比较);
  B. 不兼容缓存构建:
     断言:耗时接近全量构建且无错误诊断(回退耗时上升为预期行为);
     首次回退后缓存重导出当前版本、后续构建恢复命中(与 selfheal 同机制,
     不得演变为每次构建都回退的永久退化)。
预言:阈值型断言(允许的回退开销 vs 无谓开销),取样口径在 runner 内固定。