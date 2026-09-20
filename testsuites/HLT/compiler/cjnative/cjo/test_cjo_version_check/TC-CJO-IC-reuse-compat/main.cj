/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// ═════════════════════════════════════════════════════════════════
// 用例: TC-CJO-IC-reuse-compat(组: IncrementalCache;执行域: automated)
// 用例意图: 三档各一轮 patch+增量编译均缓存命中(无版本 error;末轮缓存日志断言无回退 kind 行)、运行成功;版本检查不破坏既有缓存命中(三兼容形态×三轮全过)
// fixture: cjo_mutate.py --patch-cjo pkg.cjo 三档轮换 (0,0,0)/(0,1,255)/(0,1,0)(兄弟 cjo 手术,实测定谳 .cached 内 cjo 不被读,缓存命中全程维持)。勿混淆:同目录 .cachedast 的 HashedPackage.version:string 是既有 CANGJIE_VERSION 门禁字段,非本特性手术目标。
// 判据: cjo_version_check/verify/incr_cache/cache_reuse_compat
// 需求追溯: DFX#5~8 兼容侧;DT 设计正常场景 B 用例1 参数1 三档;EC:三兼容形态;DT:增量缓存×命中
// ═════════════════════════════════════════════════════════════════


// DEPENDENCE: pkg pkg.old.cj ../cjo_mutate.py log_reuse.txt
// EXEC: %cp pkg.old.cj pkg.cj
// EXEC: %compiler %cmp_opt pkg.cj %compile_lib_opt -o pkg.%middle
// EXEC: %compiler %incremental_compile %cmp_opt pkg.%middle %f -o %output
// 三档兼容轮换(0.0.0 → 0.1.255 → 0.1.0):各档手术兄弟 cjo 后增量编译,缓存命中
// EXEC: %python cjo_mutate.py --patch-cjo pkg.cjo --set-cjo-version 0.0.0
// EXEC-PIPE-0: %compiler %incremental_compile %cmp_opt pkg.%middle %f -o %output 2>&1 | compare %f
// ASSERT: scan-not module_version_not_identical
// EXEC: %python cjo_mutate.py --patch-cjo pkg.cjo --set-cjo-version 0.1.255
// EXEC-PIPE-0: %compiler %incremental_compile %cmp_opt pkg.%middle %f -o %output 2>&1 | compare %f
// ASSERT: scan-not module_version_not_identical
// EXEC: %python cjo_mutate.py --patch-cjo pkg.cjo --set-cjo-version 0.1.0
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
