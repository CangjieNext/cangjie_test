/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// ═════════════════════════════════════════════════════════════════
// 用例: TC-CJO-IC-selfheal(组: IncrementalCache;执行域: automated)
// 用例意图: 回退重建后第三次构建恢复缓存命中(缓存日志无回退行)、无错误;失效只影响本次构建,不演变为永久全量退化
// fixture: 现场手术:第一段 pkg.cjo 经 cjo_mutate.py --set-cjo-version 1.0.0 触发回退;第二段 --set-cjo-version 0.1.0 恢复后增量编译自愈(回退的全量重编已自动重导出当前版本缓存,无需再次手术);手术目标=兄弟 cjo(.cached 内 cjo 不被读)
// 判据: cjo_version_check/verify/incr_cache/cache_selfheal
// 需求追溯: DT 设计补盲#6(自愈);DT:增量缓存×回退→恢复;失效不持久化退化
// ═════════════════════════════════════════════════════════════════


// DEPENDENCE: pkg pkg.old.cj ../cjo_mutate.py log_selfheal_p1.txt log_selfheal_p2.txt diag_p1.txt diag_p2.txt
// EXEC: %cp pkg.old.cj pkg.cj
// EXEC: %compiler %cmp_opt pkg.cj %compile_lib_opt -o pkg.%middle
// EXEC: %compiler %incremental_compile %cmp_opt pkg.%middle %f -o %output
// 第一段:手术 (1,0,0) → 增量构建被拒,缓存日志落 frontend error 回退行
// EXEC: %python cjo_mutate.py --patch-cjo pkg.cjo --set-cjo-version 1.0.0
// EXEC-PIPE-1: %compiler %incremental_compile %cmp_opt pkg.%middle %f -o %output 2>&1 | compare diag_p1.txt
// (Linux)EXEC: cat .cached/*.log | compare log_selfheal_p1.txt
// (Windows)EXEC: powershell Get-Content .cached/*.log | compare log_selfheal_p1.txt
// 第二段:恢复 (0,1,0) → 增量构建恢复命中(自愈),缓存日志无回退行
// EXEC: %python cjo_mutate.py --patch-cjo pkg.cjo --set-cjo-version 0.1.0
// EXEC-PIPE-0: %compiler %incremental_compile %cmp_opt pkg.%middle %f -o %output 2>&1 | compare diag_p2.txt
// (Linux)EXEC: cat .cached/*.log | compare log_selfheal_p2.txt
// (Windows)EXEC: powershell Get-Content .cached/*.log | compare log_selfheal_p2.txt
// EXEC-0: %run %run_opt %output %run_args

import pkg.*

main(): Int64 {
    if (depValue() == 42) {
        return 0
    }
    return 1
}
