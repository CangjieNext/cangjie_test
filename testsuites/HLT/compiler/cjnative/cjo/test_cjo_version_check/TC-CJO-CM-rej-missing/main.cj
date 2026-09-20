/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// ═════════════════════════════════════════════════════════════════
// 用例: TC-CJO-CM-rej-missing(组: CrossPackage;执行域: automated)
// 用例意图: 编译失败;scan 版本不匹配串;缺失版本不等于 (0,0,0)——安全拒绝而非静默放行
// fixture: dep_nover.cjo = flatc JSON 往返删除 cjoVersion 字段、保留 version 字符串(Verifier 必须通过;./flatc -t ./CjoFormat.fbs -- ./dep_v010.cjo → 删 cjoVersion → ./flatc -b ./CjoFormat.fbs ./dep_v010.json 得 .bin 后 mv 改名)
// 判据: cjo_version_check/errcheck/version_matrix/reject_missing_version
// 需求追溯: DT 设计补盲#1(缺失版本);EC:缺失类;DT:跨包×error(与缓存路径行为分叉,见 cache_missing_version)
// ═════════════════════════════════════════════════════════════════


// LEVEL: 1
// DEPENDENCE: dep_nover.cjo
// EXEC-PIPE-1: %compiler %cmp_opt dep_nover.cjo %f -o %output 2>&1 | compare %f
// ASSERT: scan is incompatible: compiled with cjc
// ASSERT: scan but the current compiler is cjc

import pkg.*

main(): Int64 {
    if (depValue() == 42) {
        return 0
    }
    return 1
}
