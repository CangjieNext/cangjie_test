/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// ═════════════════════════════════════════════════════════════════
// 用例: TC-CJO-VP-bad-ident(组: CrossPackage;执行域: automated)
// 用例意图: 编译失败;scan validation 专串;伪造的兼容版本字段被无视——版本检查不替代 Verifier(design-spec 非目标)
// fixture: dep_badident.cjo = file identifier 改为非 CJOF,cjoVersion 伪造成 (0,1,0)
// 判据: cjo_version_check/errcheck/pipeline_order/verifier_bad_identifier
// 需求追溯: DT 设计模块间接口1 变体(补盲#3);DT:跨包×Verifier 拒绝;版本兼容不能豁免结构校验
// ═════════════════════════════════════════════════════════════════


// LEVEL: 1
// DEPENDENCE: dep_badident.cjo
// EXEC-PIPE-1: %compiler %cmp_opt dep_badident.cjo %f -o %output 2>&1 | compare %f
// ASSERT: scan validation of
// ASSERT: scan failed, please confirm it was created by compiler whose version is
// ASSERT: scan-not is incompatible: compiled with cjc

import pkg.*

main(): Int64 {
    if (depValue() == 42) {
        return 0
    }
    return 1
}
