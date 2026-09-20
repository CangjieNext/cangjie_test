/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// ═════════════════════════════════════════════════════════════════
// 用例: TC-CJO-CM-rej-major-100(组: CrossPackage;执行域: automated)
// 用例意图: 编译失败(PIPE-1 退出非零);scan 两根版本不匹配串(含 cjo 路径+包名+双端 cjc 版本);无产物
// fixture: 现场手术:pkg.cjo 经 cjo_mutate.py --set-cjo-version 1.0.0 --set-version-string v100probe(结构合法,确保拒绝来自版本判断而非 schema 损坏)
// 判据: cjo_version_check/errcheck/version_matrix/reject_major
// 需求追溯: DFX#1;DT 设计异常场景;EC:major 异类;DT:跨包×error 拒绝;major 判等语义(非大小比较)
// ═════════════════════════════════════════════════════════════════


// DEPENDENCE: pkg ../cjo_mutate.py
// EXEC: %compiler %pkg_opt pkg %compile_lib_opt -o pkg.%middle
// EXEC: %python cjo_mutate.py --patch-cjo pkg.cjo --set-cjo-version 1.0.0 --set-version-string v100probe
// EXEC-PIPE-1: %compiler %cmp_opt pkg.%middle %f -o %output 2>&1 | compare %f
// ASSERT: scan is incompatible: compiled with cjc
// ASSERT: scan but the current compiler is cjc
// ASSERT: scan v100probe

import pkg.*

main(): Int64 {
    if (depValue() == 42) {
        return 0
    }
    return 1
}
