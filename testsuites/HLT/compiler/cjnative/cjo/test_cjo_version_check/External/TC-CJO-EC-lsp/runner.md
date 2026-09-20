# TC-CJO-EC-lsp(组: External;执行域: external)

- 用例意图: 三方库 cjo 版本不匹配 → LSP 报错误提示而非 crash(遗留问题9 的体验改善锚);编译器版本更新后 LSP 清理 AstData 缓存重建,不因残留缓存产生错误结果
- fixture: 配方见套件根 test_design.md §四(运行时现场手术,套件零 .cjo 预存)。 本场景治具为 LSP 工作区 + 三方库不兼容 cjo。
- 判据: cjo_version_check/ecosystem/toolchain/eco_ide_lsp
- 需求追溯: DT 设计补盲#10(生态);DT:IDE 入口×不 crash+缓存清理;遗留问题9 改善锚

LSP 治具 runner 规格(External:LSP 环境)

子断言①(遗留问题9 改善锚):三方库 cjo 版本不匹配(现场手术产出的不兼容 cjo 进工程依赖) →
  LSP 触发编译检查 → 返回错误提示(diagnostic)而非 crash(LSP 进程存活);
子断言②缓存清理:编译器版本更新后 LSP 检查 cjc 版本 → 清理工程源码 AstData 缓存并重建,
  不因残留缓存产生错误结果(诊断/跳转/补全与新版本一致)。
预言:①进程存活+错误提示;②更新后无陈旧缓存症状。