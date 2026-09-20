/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// ═════════════════════════════════════════════════════════════════
// 用例: TC-CJO-VP-random-bytes(组: CrossPackage;执行域: automated)
// 用例意图: 编译失败;scan validation 专串;无 ICE/越界/崩溃(安全拒绝三态之一)
// fixture: dep_rand.cjo = 等长随机字节替换全文(保留文件名与导入路径)
// 判据: cjo_version_check/errcheck/pipeline_order/verifier_random_bytes
// 需求追溯: DT 设计补盲#3 极端输入;DT:跨包×Verifier 拒绝;fuzz 设计衔接:仅安全拒绝或成功导入
// ═════════════════════════════════════════════════════════════════


// LEVEL: 1
// DEPENDENCE: dep_rand.cjo
// EXEC-PIPE-1: %compiler %cmp_opt dep_rand.cjo %f -o %output 2>&1 | compare %f
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
