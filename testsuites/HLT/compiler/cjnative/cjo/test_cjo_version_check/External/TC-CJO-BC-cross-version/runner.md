# TC-CJO-BC-cross-version(组: External;执行域: external)

- 用例意图: 新读旧(minor/patch 档)静默通过;旧读新 patch 档可用、minor 档拒绝输出诊断、major 档拒绝;CI 缺省不具备时标注受限场景
- fixture: fixture 全部由真实双版本 SDK 产出(非 flatc 变体):patch/minor/major 三档 × 两方向。
- 判据: cjo_version_check/import/backward_compat/compat_cross_version
- 需求追溯: DT 设计补盲#7(双向跨版本,受限场景);DT:双向×三档判定表;design-spec 非目标范围的双向兜底验证

双版本 SDK 专项 runner 规格(External:CI 缺省不具备,需并存双版本 SDK 环境)

矩阵位:
  新读旧(旧 SDK 产出 cjo → 当前 cjc 消费):
    minor/patch 档 → 静默通过(PIPE-0 + scan-not 版本串)
  旧读新(当前 cjc 产出 cjo → 旧 cjc 消费):
    patch 档     → 可用(旧端编译成功)
    minor 档     → 拒绝(旧端输出诊断;串形态以旧端实现为准)
    major 档     → 拒绝

驱动形态与 compat_legacy 同(crossPositiveHeader/crossRejectHeader),cjo 由两端真实 SDK 产出。