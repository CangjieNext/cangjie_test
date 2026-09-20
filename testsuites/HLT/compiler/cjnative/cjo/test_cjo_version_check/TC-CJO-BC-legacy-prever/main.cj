/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// ═════════════════════════════════════════════════════════════════
// 用例: TC-CJO-BC-legacy-prever(组: CrossPackage;执行域: automated)
// 用例意图: 版本串缺失(溯源 unknown)但兼容三元组 → 接受(判据=三元组非版本串);真实存量若出现拒绝须升级需求出口确认
// fixture: 现场手术:pkg.cjo 经 cjo_mutate.py --clear-version-string(兼容三元组 (0,1,0) 保留、版本串清空→溯源 unknown)
// ═════════════════════════════════════════════════════════════════


// DEPENDENCE: pkg ../tools/cjo_mutate.py
// EXEC: %compiler %pkg_opt pkg %compile_lib_opt -o pkg.%middle
// EXEC: %python cjo_mutate.py --patch-cjo pkg.cjo --clear-version-string
// EXEC-PIPE-0: %compiler %cmp_opt pkg.%middle %f -o %output 2>&1 | compare %f
// ASSERT: scan-not is incompatible: compiled with cjc
// ASSERT: scan-not validation of
// EXEC-0: %run %run_opt %output %run_args

import pkg.*

main(): Int64 {
    if (depValue() == 42) {
        return 0
    }
    return 1
}
