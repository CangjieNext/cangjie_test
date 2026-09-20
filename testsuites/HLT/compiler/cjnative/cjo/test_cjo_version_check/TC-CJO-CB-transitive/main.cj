/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// ═════════════════════════════════════════════════════════════════
// 用例: TC-CJO-CB-transitive(组: CrossPackage;执行域: automated)
// 用例意图: mid 编译即失败(其依赖闭包内含不兼容 dep_bad);诊断出现不兼容依赖标识(粒度以实现为准);传递链上不得静默放过不兼容 cjo
// fixture: mid 兼容但 import pkg;现场手术:pkg.cjo 经 cjo_mutate.py --set-cjo-version 1.0.0
// ═════════════════════════════════════════════════════════════════


// DEPENDENCE: pkg pkg_mid ../cjo_mutate.py
// EXEC: %compiler %pkg_opt pkg %compile_lib_opt -o pkg.%middle
// EXEC: %python cjo_mutate.py --patch-cjo pkg.cjo --set-cjo-version 1.0.0
// EXEC-PIPE-1: %compiler %pkg_opt pkg_mid %compile_lib_opt -o mid.%middle 2>&1 | compare %f
// ASSERT: scan is incompatible: compiled with cjc
// ASSERT: scan pkg.cjo

import mid.*

main(): Int64 {
    if (midValue() == 42) {
        return 0
    }
    return 1
}
