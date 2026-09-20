# TC-CJO-EC-lsp(组: External;执行域: external)

- 用例意图: 三方库 cjo 版本不匹配 → LSP 报错误提示而非 crash(遗留问题9 的体验改善锚);编译器版本更新后 LSP 清理 AstData 缓存重建,不因残留缓存产生错误结果
- fixture: 基准:当前 cjc 编译 pkg/(导出 public func depValue(): Int64)得 dep_v010.cjo(cjoVersion=(0,1,0),version=当前 cjc 版本)。变体 fixture:./flatc -t ./CjoFormat.fbs -- ./dep_v010.cjo 转 JSON(flatc 输出 relaxed JSON,键名不带引号;stderr 的 snake_case warning 可忽略)→ 按用例说明修改/删除 cjoVersion(必要时同步改 version 字符串)→ ./flatc -b ./CjoFormat.fbs ./dep_v010.json 得 dep_v010.bin → mv 改名回 dep_v010.cjo → 断言 Verifier 通过(仅版本字段变化不得引入结构错误)。字节定点修改仅作 flatc 不可用时的兜底。工具:cjo_mutate.py 一次性产出全部命名 fixture。缓存形态(增量缓存用例):被测门禁读的是缓存内 <hash>.cjo 的 cjoVersion 三元组(与跨包路径同一矩阵),手术目标即该字段(cjo_mutate.py --patch-cache 对 .cached 内 cjo 做 cjoVersion 手术,flatc/字节兜底同跨包配方)。注意勿混淆两类缓存机制:同目录 .cachedast 的 HashedPackage.version:string 是既有 CANGJIE_VERSION 门禁的字段(DT 设计 FN-05 明示两类机制勿混淆),不属于本特性手术目标。缓存 fixture 由 cjo_mutate.py 在现场编译产出 .cached 后手术;不以源码替换注入(同编译器重编源码版本必然一致,注入空转)。 本场景治具为 LSP 工作区 + 三方库不兼容 cjo。
- 判据: cjo_version_check/ecosystem/toolchain/eco_ide_lsp
- 需求追溯: DT 设计补盲#10(生态);DT:IDE 入口×不 crash+缓存清理;遗留问题9 改善锚

LSP 治具 runner 规格(External:LSP 环境)

子断言①(遗留问题9 改善锚):三方库 cjo 版本不匹配(dep_v020.cjo 进工程依赖) →
  LSP 触发编译检查 → 返回错误提示(diagnostic)而非 crash(LSP 进程存活);
子断言②缓存清理:编译器版本更新后 LSP 检查 cjc 版本 → 清理工程源码 AstData 缓存并重建,
  不因残留缓存产生错误结果(诊断/跳转/补全与新版本一致)。
预言:①进程存活+错误提示;②更新后无陈旧缓存症状。