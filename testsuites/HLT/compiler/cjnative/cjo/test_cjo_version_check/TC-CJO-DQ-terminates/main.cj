/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// ═════════════════════════════════════════════════════════════════
// 用例: TC-CJO-DQ-terminates(组: CrossPackage;执行域: automated)
// 用例意图: 编译失败(PIPE-1 退出非零=error 级别)+ %output 不存在;不得以 warning 降级继续编译(拒绝发生在 AST 消费前)
// fixture: 复用 dep_v020.cjo;追加 (Linux)/(Windows) 双行 EXEC 断言无产物
// 判据: cjo_version_check/diagnose/content/diag_error_terminates
// 需求追溯: DT 设计补盲#4(诊断质量);DT:跨包×error×终止性;error vs warning 降级甄别
// ═════════════════════════════════════════════════════════════════


// LEVEL: 1
// DEPENDENCE: dep_v020.cjo
// EXEC-PIPE-1: %compiler %cmp_opt dep_v020.cjo %f -o %output 2>&1 | compare %f
// ASSERT: scan is incompatible: compiled with cjc
// (Linux)EXEC: test ! -f %output
// (Windows)EXEC: powershell -c "if (Test-Path %output) { exit 1 }"

import pkg.*

main(): Int64 {
    if (depValue() == 42) {
        return 0
    }
    return 1
}
