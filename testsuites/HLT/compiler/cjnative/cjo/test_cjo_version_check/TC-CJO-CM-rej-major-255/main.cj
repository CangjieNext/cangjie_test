/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// ═════════════════════════════════════════════════════════════════
// 用例: TC-CJO-CM-rej-major-255(组: CrossPackage;执行域: automated)
// 用例意图: 编译失败;scan 版本不匹配串;与 reject_major 构成 major 轴两点覆盖
// fixture: 现场手术:pkg.cjo 经 cjo_mutate.py --set-cjo-version 255.1.0 --set-version-string v255100probe(major uint8 上界)
// 判据: cjo_version_check/errcheck/version_matrix/reject_major_255
// 需求追溯: DT 设计补盲#2(uint8 边界);BC:major 上界 255;DT:跨包×error 拒绝
// ═════════════════════════════════════════════════════════════════


// DEPENDENCE: pkg ../cjo_mutate.py
// EXEC: %compiler %pkg_opt pkg %compile_lib_opt -o pkg.%middle
// EXEC: %python cjo_mutate.py --patch-cjo pkg.cjo --set-cjo-version 255.1.0 --set-version-string v255100probe
// EXEC-PIPE-1: %compiler %cmp_opt pkg.%middle %f -o %output 2>&1 | compare %f
// ASSERT: scan is incompatible: compiled with cjc
// ASSERT: scan but the current compiler is cjc
// ASSERT: scan v255100probe

import pkg.*

main(): Int64 {
    if (depValue() == 42) {
        return 0
    }
    return 1
}
