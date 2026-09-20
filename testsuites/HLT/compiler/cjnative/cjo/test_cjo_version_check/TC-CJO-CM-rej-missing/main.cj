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
// fixture: 现场手术:pkg.cjo 经 cjo_mutate.py --set-cjo-version 0.0.0(与 CM-older-minor 同输入不同意图:跨包路径镜像位)
// 判据: cjo_version_check/errcheck/version_matrix/reject_missing_version
// 需求追溯: DT 设计补盲#1(缺失版本);EC:缺失类;DT:跨包×error(与缓存路径行为分叉,见 cache_missing_version)
// ═════════════════════════════════════════════════════════════════


// DEPENDENCE: pkg ../cjo_mutate.py
// EXEC: %compiler %pkg_opt pkg %compile_lib_opt -o pkg.%middle
// EXEC: %python cjo_mutate.py --patch-cjo pkg.cjo --set-cjo-version 0.0.0
// EXEC-PIPE-0: %compiler %cmp_opt pkg.%middle %f -o %output 2>&1 | compare %f
// ASSERT: scan-not is incompatible: compiled with cjc
// ASSERT: scan-not validation of
// EXEC-0: %run %run_opt %output %run_args

import pkg.*

main(): Int64 {
    if (depValue() == 42) {
        return 0
    }
    return 1
}
