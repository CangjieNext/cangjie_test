/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// ═════════════════════════════════════════════════════════════════
// 用例: TC-CJO-DQ-no-cjoVersion(组: CrossPackage;执行域: automated)
// 用例意图: 编译失败;完整诊断输出 scan-not cjoVersion——报错使用编译器版本号而非 cjo 格式版本(内部 cjo 版本不向用户暴露)
// fixture: 现场手术:pkg.cjo 经 cjo_mutate.py --set-cjo-version 0.2.0(与 CM-rej-minor-020 同款不兼容形态,独立断言点)
// ═════════════════════════════════════════════════════════════════


// DEPENDENCE: pkg ../cjo_mutate.py
// EXEC: %compiler %pkg_opt pkg %compile_lib_opt -o pkg.%middle
// EXEC: %python cjo_mutate.py --patch-cjo pkg.cjo --set-cjo-version 0.2.0
// EXEC-PIPE-1: %compiler %cmp_opt pkg.%middle %f -o %output 2>&1 | compare %f
// ASSERT: scan is incompatible: compiled with cjc
// ASSERT: scan-not cjoVersion

import pkg.*

main(): Int64 {
    if (depValue() == 42) {
        return 0
    }
    return 1
}
