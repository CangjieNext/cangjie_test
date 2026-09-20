/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// ═════════════════════════════════════════════════════════════════
// 用例: TC-CJO-BC-legacy-prever(组: CrossPackage;执行域: automated)
// 用例意图: 设计内拒绝(缺失≠兼容);测试意图盯生态影响:须确认真实存量不存在此形态或提供重编迁移指引,避免生态误伤
// fixture: legacy_nover.cjo = 缺失 cjoVersion 字段的旧格式 cjo(与 reject_missing_version 同输入、不同测试意图)
// 判据: cjo_version_check/errcheck/version_matrix/compat_legacy_pre_version
// 需求追溯: DT 设计补盲#7(向后兼容,预版本化位);EC:缺失;DT:跨包×error(生态视角)
// ═════════════════════════════════════════════════════════════════


// LEVEL: 1
// DEPENDENCE: legacy_nover.cjo
// EXEC-PIPE-1: %compiler %cmp_opt legacy_nover.cjo %f -o %output 2>&1 | compare %f
// ASSERT: scan is incompatible: compiled with cjc
// ASSERT: scan but the current compiler is cjc

import pkg.*

main(): Int64 {
    if (depValue() == 42) {
        return 0
    }
    return 1
}
