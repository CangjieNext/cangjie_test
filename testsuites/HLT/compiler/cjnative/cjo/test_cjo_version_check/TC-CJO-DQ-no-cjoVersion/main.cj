/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// ═════════════════════════════════════════════════════════════════
// 用例: TC-CJO-DQ-no-cjoVersion(组: CrossPackage;执行域: automated)
// 用例意图: 编译失败;完整诊断输出 scan-not cjoVersion——设计要求报错使用编译器版本号而非 cjo 格式版本(cjo 版本号不期望让用户感知)
// fixture: 复用 dep_v020.cjo(reject_minor_newer 同款不兼容 fixture,独立断言点)
// 判据: cjo_version_check/diagnose/content/diag_no_internal_version
// 需求追溯: DT 设计补盲#4(诊断质量);DT:跨包×error×不泄露;FN-04 注意事项1
// ═════════════════════════════════════════════════════════════════


// LEVEL: 1
// DEPENDENCE: dep_v020.cjo
// EXEC-PIPE-1: %compiler %cmp_opt dep_v020.cjo %f -o %output 2>&1 | compare %f
// ASSERT: scan is incompatible: compiled with cjc
// ASSERT: scan-not cjoVersion

import pkg.*

main(): Int64 {
    if (depValue() == 42) {
        return 0
    }
    return 1
}
