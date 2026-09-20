/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// ═════════════════════════════════════════════════════════════════
// 用例: TC-CJO-CM-rej-minor-255(组: CrossPackage;执行域: automated)
// 用例意图: 编译失败;scan 版本不匹配串;与 reject_minor_newer 构成 minor 轴两点覆盖
// fixture: 现场手术:pkg.cjo 经 cjo_mutate.py --set-cjo-version 0.255.255 --set-version-string v0255255probe(minor × patch 双上界)
// 判据: cjo_version_check/errcheck/version_matrix/reject_minor_255
// 需求追溯: DT 设计补盲#2(uint8 边界);BC:minor 上界 255;DT:跨包×error 拒绝
// ═════════════════════════════════════════════════════════════════


// DEPENDENCE: pkg ../cjo_mutate.py
// EXEC: %compiler %pkg_opt pkg %compile_lib_opt -o pkg.%middle
// EXEC: %python cjo_mutate.py --patch-cjo pkg.cjo --set-cjo-version 0.255.255 --set-version-string v0255255probe
// EXEC-PIPE-1: %compiler %cmp_opt pkg.%middle %f -o %output 2>&1 | compare %f
// ASSERT: scan is incompatible: compiled with cjc
// ASSERT: scan but the current compiler is cjc
// ASSERT: scan v0255255probe

import pkg.*

main(): Int64 {
    if (depValue() == 42) {
        return 0
    }
    return 1
}
