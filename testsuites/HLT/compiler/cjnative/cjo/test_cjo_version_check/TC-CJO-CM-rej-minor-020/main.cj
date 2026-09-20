/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// ═════════════════════════════════════════════════════════════════
// 用例: TC-CJO-CM-rej-minor-020(组: CrossPackage;执行域: automated)
// 用例意图: 编译失败;scan 版本不匹配串;旧读端不得静默消费新 minor 产物(旧 SDK 只换新 cjo 崩溃问题的拦截位)
// fixture: dep_v020.cjo = cjoVersion 改 (0,2,0)
// 判据: cjo_version_check/errcheck/version_matrix/reject_minor_newer
// 需求追溯: DFX#2;DT 设计异常场景;EC:minor>cur 类;DT:跨包×error 拒绝
// ═════════════════════════════════════════════════════════════════


// LEVEL: 1
// DEPENDENCE: dep_v020.cjo
// EXEC-PIPE-1: %compiler %cmp_opt dep_v020.cjo %f -o %output 2>&1 | compare %f
// ASSERT: scan is incompatible: compiled with cjc
// ASSERT: scan but the current compiler is cjc

import pkg.*

main(): Int64 {
    if (depValue() == 42) {
        return 0
    }
    return 1
}
