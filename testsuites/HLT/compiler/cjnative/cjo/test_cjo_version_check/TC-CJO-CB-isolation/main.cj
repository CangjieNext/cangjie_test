/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// ═════════════════════════════════════════════════════════════════
// 用例: TC-CJO-CB-isolation(组: CrossPackage;执行域: automated)
// 用例意图: 第一次编译拒绝后,同一驱动内 a+c 正常编译运行成功——失败不污染 CjoManager 已加载包/缓存状态,重复加载无累积错误
// fixture: b_v100.cjo = (1,0,0);a/c 兼容;main_iso.cj 只导入 a/c(同驱动内第二次编译,EXEC 引用的文件必须列入 DEPENDENCE——框架只拷 case 文件与 DEPENDENCE 项,缺列即 work_dir 缺文件);diag_reject/diag_ok 独立规则文件(两次 compare 各抽各的 ASSERT,先例 DuplicateGenericFuncType01)
// 判据: cjo_version_check/combo/deps/combo_isolation
// 需求追溯: DT 设计补盲#5(状态隔离);DT:跨包×失败后复用;FN 状态规格:失败状态不得污染
// ═════════════════════════════════════════════════════════════════


// LEVEL: 1
// DEPENDENCE: pkg_a pkg_c b_v100.cjo main_iso.cj diag_reject.txt diag_ok.txt
// EXEC: %compiler %pkg_opt pkg_a %compile_lib_opt -o a.%middle
// EXEC: %compiler %pkg_opt pkg_c %compile_lib_opt -o c.%middle
// EXEC-PIPE-1: %compiler %cmp_opt a.%middle b_v100.cjo c.%middle %f -o %output 2>&1 | compare diag_reject.txt
// EXEC-0: %compiler %cmp_opt a.%middle c.%middle main_iso.cj -o iso.%output 2>&1 | compare diag_ok.txt

import a.*
import b.*
import c.*

main(): Int64 {
    if (aValue() + bValue() + cValue() == 126) {
        return 0
    }
    return 1
}
