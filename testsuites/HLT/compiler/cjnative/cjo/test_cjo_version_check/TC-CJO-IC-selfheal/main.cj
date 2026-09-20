/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// ═════════════════════════════════════════════════════════════════
// 用例: TC-CJO-IC-selfheal(组: IncrementalCache;执行域: automated)
// 用例意图: 回退重建后第三次构建恢复缓存命中(缓存日志无回退 kind 行)、无错误;失效只影响本次构建,不演变为永久全量退化
// fixture: cjo_mutate.py --patch-cache 第一段 patch-cache 改 cjoVersion (1,0,0) 触发回退;回退的全量重编自动重导出当前版本缓存(无需再次手术):现场编译建缓存后对 .cached 内 <hash>.cjo 做 cjoVersion 三元组手术(与跨包路径同一矩阵;flatc/字节兜底同跨包配方)。勿混淆:同目录 .cachedast 的 HashedPackage.version:string 是既有 CANGJIE_VERSION 门禁字段,非本特性手术目标。
// 判据: cjo_version_check/verify/incr_cache/cache_selfheal
// 需求追溯: DT 设计补盲#6(自愈);DT:增量缓存×回退→恢复;失效不持久化退化
// ═════════════════════════════════════════════════════════════════


// LEVEL: 1
// DEPENDENCE: pkg.old.cj ../cjo_mutate.py log_selfheal_p1.txt log_selfheal_p2.txt
// EXEC: cp pkg.old.cj pkg.cj
// (Windows) EXEC: copy pkg.old.cj pkg.cj
// EXEC: %compiler %cmp_opt pkg.cj %compile_lib_opt -o pkg.%middle
// EXEC: %compiler %incremental_compile %cmp_opt pkg.%middle %f -o %output
// EXEC: %python cjo_mutate.py --patch-cache --set-cache-cjo-version 1.0.0
// EXEC-PIPE-0: %compiler %incremental_compile %cmp_opt pkg.%middle %f -o %output 2>&1 | compare %f
// ASSERT: scan-not module_version_not_identical
// (Linux)EXEC: cat .cached/*.log | compare log_selfheal_p1.txt
// EXEC-PIPE-0: %compiler %incremental_compile %cmp_opt pkg.%middle %f -o %output 2>&1 | compare %f
// ASSERT: scan-not module_version_not_identical
// ASSERT: scan-not is incompatible: compiled with cjc
// (Linux)EXEC: cat .cached/*.log | compare log_selfheal_p2.txt
// EXEC-0: %run %run_opt %output %run_args

import pkg.*

main(): Int64 {
    if (depValue() == 42) {
        return 0
    }
    return 1
}
