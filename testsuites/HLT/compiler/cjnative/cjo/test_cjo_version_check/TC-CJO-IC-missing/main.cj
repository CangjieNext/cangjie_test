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
// fixture: cjo_mutate.py --patch-cache 删除缓存内 cjo 的 cjoVersion 字段(Verifier 通过口径):现场编译建缓存后对 .cached 内 <hash>.cjo 做 cjoVersion 三元组手术(与跨包路径同一矩阵;flatc/字节兜底同跨包配方)。勿混淆:同目录 .cachedast 的 HashedPackage.version:string 是既有 CANGJIE_VERSION 门禁字段,非本特性手术目标。
// 判据: cjo_version_check/errcheck/incr_cache/cache_missing_version
// 需求追溯: DT 设计补盲#1(缺失版本缓存位);EC:缺失;DT:增量缓存×静默失效(分叉位)
// ═════════════════════════════════════════════════════════════════


// LEVEL: 1
// DEPENDENCE: pkg.old.cj ../cjo_mutate.py log_reject.txt
// EXEC: cp pkg.old.cj pkg.cj
// (Windows) EXEC: copy pkg.old.cj pkg.cj
// EXEC: %compiler %cmp_opt pkg.cj %compile_lib_opt -o pkg.%middle
// EXEC: %compiler %incremental_compile %cmp_opt pkg.%middle %f -o %output
// EXEC: %python cjo_mutate.py --patch-cache --clear-cache-cjo-version
// EXEC-PIPE-0: %compiler %incremental_compile %cmp_opt pkg.%middle %f -o %output 2>&1 | compare %f
// ASSERT: scan-not module_version_not_identical
// ASSERT: scan-not is incompatible: compiled with cjc
// (Linux)EXEC: cat .cached/*.log | compare log_reject.txt
// EXEC-0: %run %run_opt %output %run_args

import pkg.*

main(): Int64 {
    if (depValue() == 42) {
        return 0
    }
    return 1
}
