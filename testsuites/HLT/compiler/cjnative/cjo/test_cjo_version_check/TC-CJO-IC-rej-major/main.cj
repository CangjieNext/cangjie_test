/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// ═════════════════════════════════════════════════════════════════
// 用例: TC-CJO-IC-rej-major(组: IncrementalCache;执行域: automated)
// 用例意图: 无错误丢弃缓存退化为全量编译:stderr 无版本 error(scan-not 两串,与跨包路径分叉:同版本跨包=error,缓存=静默);缓存日志含回退 kind 行(rollback);产物与干净全量一致
// fixture: cjo_mutate.py --patch-cache 将缓存内 cjo 的 cjoVersion 改为 (1,0,0)(major 异):现场编译建缓存后对 .cached 内 <hash>.cjo 做 cjoVersion 三元组手术(与跨包路径同一矩阵;flatc/字节兜底同跨包配方)。勿混淆:同目录 .cachedast 的 HashedPackage.version:string 是既有 CANGJIE_VERSION 门禁字段,非本特性手术目标。
// 判据: cjo_version_check/errcheck/incr_cache/cache_reject_major
// 需求追溯: DFX#5;DT 设计正常场景 B;EC:major 异;DT:增量缓存×静默回退(分叉位)
// ═════════════════════════════════════════════════════════════════


// LEVEL: 1
// DEPENDENCE: pkg.old.cj ../cjo_mutate.py log_reject.txt
// EXEC: cp pkg.old.cj pkg.cj
// (Windows) EXEC: copy pkg.old.cj pkg.cj
// EXEC: %compiler %cmp_opt pkg.cj %compile_lib_opt -o pkg.%middle
// EXEC: %compiler %incremental_compile %cmp_opt pkg.%middle %f -o %output
// EXEC: %python cjo_mutate.py --patch-cache --set-cache-cjo-version 1.0.0
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
