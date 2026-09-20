/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// ═════════════════════════════════════════════════════════════════
// 用例: TC-CJO-CM-older-minor(组: CrossPackage;执行域: automated)
// 用例意图: 编译成功、运行 exit 0;scan-not 版本不匹配串且 scan-not validation 串(静默=无任何版本诊断,非 warning 继续)
// fixture: 现场手术:pkg 编译产物 pkg.cjo 经 cjo_mutate.py --set-cjo-version 0.0.0(version 串保留当前 cjc)
// 判据: cjo_version_check/import/version_matrix/compat_older_minor
// 需求追溯: DFX#3;DT 设计正常场景 A;EC:minor<cur 类;BC:minor 下界 0;DT:跨包×静默读取
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
