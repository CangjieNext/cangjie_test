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
// fixture: a/c 兼容(原生),b_v020.cjo = cjoVersion 改 (0,2,0),b_v010.cjo = 兼容基准(用户替换动作);diag_reject/diag_ok 独立规则文件(两次 compare 是独立进程,各抽各的 ASSERT——同文件承载正负断言会对同一流自相矛盾,先例 DuplicateGenericFuncType01 双规则文件)
// 判据: cjo_version_check/combo/deps/combo_single_bad_dep
// 需求追溯: DT 设计补盲#5(组合);DT:跨包×多依赖×单点坏;诊断定位精确性+用户替换闭环
// ═════════════════════════════════════════════════════════════════


// LEVEL: 1
// DEPENDENCE: pkg_a pkg_c b_v020.cjo b_v010.cjo diag_reject.txt diag_ok.txt
// EXEC: %compiler %pkg_opt pkg_a %compile_lib_opt -o a.%middle
// EXEC: %compiler %pkg_opt pkg_c %compile_lib_opt -o c.%middle
// EXEC-PIPE-1: %compiler %cmp_opt a.%middle b_v020.cjo c.%middle %f -o %output 2>&1 | compare diag_reject.txt
// EXEC-0: %compiler %cmp_opt a.%middle b_v010.cjo c.%middle %f -o %output 2>&1 | compare diag_ok.txt
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
