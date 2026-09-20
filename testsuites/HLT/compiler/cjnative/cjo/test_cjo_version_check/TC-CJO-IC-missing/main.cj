/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// ═════════════════════════════════════════════════════════════════
// 用例: TC-CJO-IC-missing(组: IncrementalCache;执行域: automated)
// 用例意图: 无诊断静默失效、全量重编成功;与 reject_missing_version(跨包=error)配对钉住两路径分叉
// fixture: 现场手术:pkg.cjo 经 cjo_mutate.py --set-cjo-version 0.2.0 --clear-version-string((0,2,0)+版本串抹除→拒绝且 provenance 落 cjc 'unknown')。勿混淆:同目录 .cachedast 的 HashedPackage.version:string 是既有 CANGJIE_VERSION 门禁字段,非本特性手术目标;门禁读兄弟 cjo,.cached 内 cjo 实测不被读(--patch-cache 已在 cjo_mutate.py 显式报错)。
// 判据: cjo_version_check/errcheck/incr_cache/cache_missing_version
// 需求追溯: DT 设计补盲#1(缺失版本缓存位);EC:缺失;DT:增量缓存×静默失效(分叉位)
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
