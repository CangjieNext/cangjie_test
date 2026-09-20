/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// ═════════════════════════════════════════════════════════════════
// 用例: TC-CJO-CM-same(组: CrossPackage;执行域: automated)
// 用例意图: 编译成功、运行 exit 0;scan-not 版本不匹配串且 scan-not validation 串(不过度拒绝的 parity 基准)
// fixture: 无变体:pkg 由当前 cjc 现场编译,cjoVersion=(0,1,0) 原生未改;其余用例的变体均为运行时现场手术(见 test_design.md §四)
// ═════════════════════════════════════════════════════════════════


// DEPENDENCE: pkg
// EXEC: %compiler %pkg_opt pkg %compile_lib_opt -o pkg.%middle
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
