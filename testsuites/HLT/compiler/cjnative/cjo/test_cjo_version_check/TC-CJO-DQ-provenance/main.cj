/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// ═════════════════════════════════════════════════════════════════
// 用例: TC-CJO-DQ-provenance(组: CrossPackage;执行域: automated)
// 用例意图: 编译失败;诊断含 99.99.99(而非当前编译器版本)——provenance 引用产物 version 字段
// fixture: 现场手术:pkg.cjo 经 cjo_mutate.py --set-cjo-version 1.0.0 --set-version-string 99.99.99(与当前编译器版本任何一位都不同)
// 判据: cjo_version_check/diagnose/content/diag_provenance
// 需求追溯: DT 设计补盲#4(诊断质量);DT:跨包×error×溯源;FN-04 诊断内容规格
// ═════════════════════════════════════════════════════════════════


// DEPENDENCE: pkg ../cjo_mutate.py
// EXEC: %compiler %pkg_opt pkg %compile_lib_opt -o pkg.%middle
// EXEC: %python cjo_mutate.py --patch-cjo pkg.cjo --set-cjo-version 1.0.0 --set-version-string 99.99.99
// EXEC-PIPE-1: %compiler %cmp_opt pkg.%middle %f -o %output 2>&1 | compare %f
// ASSERT: scan is incompatible: compiled with cjc
// ASSERT: scan 99.99.99

import pkg.*

main(): Int64 {
    if (depValue() == 42) {
        return 0
    }
    return 1
}
