/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// ═════════════════════════════════════════════════════════════════
// 用例: TC-CJO-CB-single-bad(组: CrossPackage;执行域: automated)
// 用例意图: 编译失败;诊断指向 b_v020 的 cjo 路径与包名,不误报 a/c;替换 b 为兼容版本后重编成功(PIPE-0)且运行通过
// fixture: a/c 兼容(原生);b 现场手术:b.cjo 先 --set-cjo-version 0.2.0(坏档),恢复轮再 --set-cjo-version 0.1.0(模拟用户替换);diag_reject/diag_ok 独立规则文件(两次 compare 各抽各的 ASSERT,正负断言不共流)
// ═════════════════════════════════════════════════════════════════


// DEPENDENCE: pkg_a pkg_c pkg_b ../cjo_mutate.py diag_reject.txt diag_ok.txt
// EXEC: %compiler %pkg_opt pkg_a %compile_lib_opt -o a.%middle
// EXEC: %compiler %pkg_opt pkg_c %compile_lib_opt -o c.%middle
// EXEC: %compiler %pkg_opt pkg_b %compile_lib_opt -o b.%middle
// EXEC: %python cjo_mutate.py --patch-cjo b.cjo --set-cjo-version 0.2.0
// EXEC-PIPE-1: %compiler %cmp_opt a.%middle b.%middle c.%middle %f -o %output 2>&1 | compare diag_reject.txt
// ASSERT: scan is incompatible: compiled with cjc
// ASSERT: scan b.cjo
// EXEC: %python cjo_mutate.py --patch-cjo b.cjo --set-cjo-version 0.1.0
// EXEC-PIPE-0: %compiler %cmp_opt a.%middle b.%middle c.%middle %f -o %output 2>&1 | compare diag_ok.txt
// ASSERT: scan-not is incompatible: compiled with cjc
// EXEC-0: %run %run_opt %output %run_args

import a.*
import b.*
import c.*

main(): Int64 {
    if (aValue() + bValue() + cValue() == 126) {
        return 0
    }
    return 1
}
