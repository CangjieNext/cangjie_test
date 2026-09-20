// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// [B1_blackbox_dead_stmt] blackBox 不复活死代码但死语句仍报告
// Tier-A: 本地 SDK 1.3.0-alpha 实测计数一致，可常驻 CI。
// 规格: 规格 §5 函数.md:1259 blackBox（input 被视为已用——计算不被消除, 但不改变死代码判定: return 后继仍报 1 条且运行期 sideEffect 不执行; hint 锚于 blackBox 实参表达式; 1.3.0-alpha 探针 hint L10C14 实测, 附带 chir_dce_unused_function 不计入本断言——scan-N 只锚 unreachable 族; runtime 侧 se 不输出）
// EXEC-PIPE-0: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

// ASSERT: scan-1 "DiagKind": "chir_dce_unreachable_expression_hint"

import std.runtime.*

func sideEffect(): Int64 {
    println("se")
    return 1
}

func f(): Int64 {
    return 0
    blackBox(sideEffect())
}

main() {
    println(f())
}
