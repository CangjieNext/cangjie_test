/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// ═════════════════════════════════════════════════════════════════
// 用例: TC-CJO-IC-missing(组: IncrementalCache;执行域: automated)
// 用例意图: 不兼容三元组+版本串抹除(无溯源形态)→ 增量路径同样拒绝(PIPE-1),provenance 落 cjc 'unknown';与 BC-legacy-prever(抹串但三元组兼容→接受)构成极性对
// fixture: 现场手术:pkg.cjo 经 cjo_mutate.py --set-cjo-version 0.2.0 --clear-version-string((0,2,0)+版本串抹除);手术目标=兄弟 cjo(.cached 内 cjo 不被读)
// 判据: cjo_version_check/errcheck/incr_cache/cache_missing_version
// 需求追溯: DT 设计补盲#1(缺失版本缓存位);EC:缺失;DT:增量缓存×拒绝(与跨包路径判定一致)
// ═════════════════════════════════════════════════════════════════


// DEPENDENCE: pkg pkg.old.cj ../cjo_mutate.py log_reject.txt
// EXEC: %cp pkg.old.cj pkg.cj
// EXEC: %compiler %cmp_opt pkg.cj %compile_lib_opt -o pkg.%middle
// EXEC: %compiler %incremental_compile %cmp_opt pkg.%middle %f -o %output
// EXEC: %python cjo_mutate.py --patch-cjo pkg.cjo --set-cjo-version 0.2.0 --clear-version-string
// EXEC-PIPE-1: %compiler %incremental_compile %cmp_opt pkg.%middle %f -o %output 2>&1 | compare %f
// ASSERT: scan is incompatible: compiled with cjc
// ASSERT: scan cjc 'unknown'
// (Linux)EXEC: cat .cached/*.log | compare log_reject.txt
// (Windows)EXEC: powershell Get-Content .cached/*.log | compare log_reject.txt

import pkg.*

main(): Int64 {
    if (depValue() == 42) {
        return 0
    }
    return 1
}
