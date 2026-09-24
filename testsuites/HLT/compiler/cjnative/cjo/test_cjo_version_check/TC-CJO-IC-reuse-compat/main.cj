/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// ═════════════════════════════════════════════════════════════════
// 用例: TC-CJO-IC-reuse-compat(组: IncrementalCache;执行域: automated)
// 用例意图: 三档各一轮 patch+增量编译均缓存命中(无版本 error;末轮缓存日志断言无回退行)、运行成功——版本检查不破坏既有缓存命中
// fixture: 现场手术:pkg.cjo 经 cjo_mutate.py 三档轮换 (0,0,0)/(0,1,255)/(0,1,0);手术目标=兄弟 cjo(.cached 内 cjo 不被读)
// ═════════════════════════════════════════════════════════════════


// DEPENDENCE: pkg pkg.old.cj ../tools log_reuse.txt
// EXEC: %cp pkg.old.cj pkg.cj
// EXEC: %compiler %cmp_opt pkg.cj %compile_lib_opt -o pkg.%middle
// EXEC: %compiler %incremental_compile %cmp_opt pkg.%middle %f -o %output
// EXEC: %python tools/cjo_mutate.py --patch-cjo pkg.cjo --set-cjo-version 0.0.0
// EXEC-PIPE-0: %compiler %incremental_compile %cmp_opt pkg.%middle %f -o %output 2>&1 | compare %f
// ASSERT: scan-not module_version_not_identical
// EXEC: %python tools/cjo_mutate.py --patch-cjo pkg.cjo --set-cjo-version 0.1.255
// EXEC-PIPE-0: %compiler %incremental_compile %cmp_opt pkg.%middle %f -o %output 2>&1 | compare %f
// ASSERT: scan-not module_version_not_identical
// EXEC: %python tools/cjo_mutate.py --patch-cjo pkg.cjo --set-cjo-version 0.1.0
// EXEC-PIPE-0: %compiler %incremental_compile %cmp_opt pkg.%middle %f -o %output 2>&1 | compare %f
// ASSERT: scan-not module_version_not_identical
// (Linux)EXEC: cat .cached/*.log | compare log_reuse.txt
// (Windows)EXEC: powershell Get-Content .cached/*.log | compare log_reuse.txt
// EXEC-0: %run %run_opt %output %run_args

import pkg.*

main(): Int64 {
    if (depValue() == 42) {
        return 0
    }
    return 1
}
