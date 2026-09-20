/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// ═════════════════════════════════════════════════════════════════
// 用例: TC-CJO-IC-rej-minor(组: IncrementalCache;执行域: automated)
// 用例意图: 无错误丢弃缓存退化全量;失效只影响本次构建(回退重编自动重导出当前版本缓存,后续构建正常命中——与 selfheal 场景同机制)
// fixture: cjo_mutate.py --patch-cjo pkg.cjo --set-cjo-version 0.2.0 对兄弟 cjo 做 cjoVersion 三元组手术(实测定谳:.cached/<hash>.cjo 从不被读,门禁读兄弟 cjo)。勿混淆:同目录 .cachedast 的 HashedPackage.version:string 是既有 CANGJIE_VERSION 门禁字段,非本特性手术目标。
// 判据: cjo_version_check/errcheck/incr_cache/cache_reject_minor
// 需求追溯: DFX#6;DT 设计正常场景 B;EC:minor>cur;DT:增量缓存×静默回退
// ═════════════════════════════════════════════════════════════════


// DEPENDENCE: pkg pkg.old.cj ../cjo_mutate.py log_reject.txt
// EXEC: %cp pkg.old.cj pkg.cj
// EXEC: %compiler %cmp_opt pkg.cj %compile_lib_opt -o pkg.%middle
// EXEC: %compiler %incremental_compile %cmp_opt pkg.%middle %f -o %output
// EXEC: %python cjo_mutate.py --patch-cjo pkg.cjo --set-cjo-version 0.2.0
// EXEC-PIPE-1: %compiler %incremental_compile %cmp_opt pkg.%middle %f -o %output 2>&1 | compare %f
// ASSERT: scan is incompatible: compiled with cjc
// (Linux)EXEC: cat .cached/*.log | compare log_reject.txt
// (Windows)EXEC: powershell Get-Content .cached/*.log | compare log_reject.txt

import pkg.*

main(): Int64 {
    if (depValue() == 42) {
        return 0
    }
    return 1
}
