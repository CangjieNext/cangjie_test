/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// ═════════════════════════════════════════════════════════════════
// 用例: TC-CJO-VP-truncated(组: CrossPackage;执行域: automated)
// 用例意图: 编译失败;scan validation 专串(validation of ... failed, please confirm...)且 scan-not 版本不匹配串——证明失败发生在 Verifier 层而非版本层
// fixture: dep_trunc.cjo = 基准产物截断至 Verifier 恰好失败(可带伪造 cjoVersion)
// 判据: cjo_version_check/errcheck/pipeline_order/verifier_truncated
// 需求追溯: DT 设计模块间接口1 用例1(补盲#3);DT:跨包×Verifier 拒绝;FN-02 次序:Verifier→版本→AST
// ═════════════════════════════════════════════════════════════════


// LEVEL: 1
// DEPENDENCE: dep_trunc.cjo
// EXEC-PIPE-1: %compiler %cmp_opt dep_trunc.cjo %f -o %output 2>&1 | compare %f
// ASSERT: scan validation of
// ASSERT: scan failed, please confirm it was created by compiler whose version is
// ASSERT: scan-not is incompatible: compiled with cjc

import pkg.*

main(): Int64 {
    if (depValue() == 42) {
        return 0
    }
    return 1
}
