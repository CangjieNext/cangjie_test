/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// ═════════════════════════════════════════════════════════════════
// 用例: TC-CJO-VP-truncated(组: CrossPackage;执行域: automated)
// 用例意图: 编译失败;scan validation 专串(validation of ... failed, please confirm...)且 scan-not 版本不匹配串——证明失败发生在 Verifier 层而非版本层
// fixture: 现场手术:pkg.cjo 编译产物经 cjo_mutate.py --truncate 500 截断至 500 字节(结构坏,可带可读版本字段——次序测试价值所在)
// 判据: cjo_version_check/errcheck/pipeline_order/verifier_truncated
// 需求追溯: DT 设计模块间接口1 用例1(补盲#3);DT:跨包×Verifier 拒绝;FN-02 次序:Verifier→版本→AST
// ═════════════════════════════════════════════════════════════════


// DEPENDENCE: pkg ../cjo_mutate.py
// EXEC: %compiler %pkg_opt pkg %compile_lib_opt -o pkg.%middle
// EXEC: %python cjo_mutate.py --patch-cjo pkg.cjo --truncate 500
// EXEC-PIPE-1: %compiler %cmp_opt pkg.%middle %f -o %output 2>&1 | compare %f
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
