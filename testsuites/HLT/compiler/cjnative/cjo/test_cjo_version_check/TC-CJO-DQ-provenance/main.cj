/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// ═════════════════════════════════════════════════════════════════
// 用例: TC-CJO-DQ-provenance(组: CrossPackage;执行域: automated)
// 用例意图: 编译失败;诊断含 99.99.99(而非当前编译器版本)——证明 compiled with cjc 引用的是产物 version 字段,堵住诊断拼当前版本的实现捷径
// fixture: dep_v100_9999.cjo = cjoVersion 改 (1,0,0) 且 version 字符串改 99.99.99
// 判据: cjo_version_check/diagnose/content/diag_provenance
// 需求追溯: DT 设计补盲#4(诊断质量);DT:跨包×error×溯源甄别;FN-04 诊断内容规格
// ═════════════════════════════════════════════════════════════════


// LEVEL: 1
// DEPENDENCE: dep_v100_9999.cjo
// EXEC-PIPE-1: %compiler %cmp_opt dep_v100_9999.cjo %f -o %output 2>&1 | compare %f
// ASSERT: scan 99.99.99
// ASSERT: scan is incompatible: compiled with cjc

import pkg.*

main(): Int64 {
    if (depValue() == 42) {
        return 0
    }
    return 1
}
