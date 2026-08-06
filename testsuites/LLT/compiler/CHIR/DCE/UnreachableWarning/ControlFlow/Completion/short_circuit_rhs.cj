// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Short-circuit operators make their skipped right operands unreachable.
// EXEC-PIPE-0: %compiler %cmp_opt %diag_json %f -o %output 2>&1 | compare %f

// ASSERT: scan-3 "DiagKind": "chir_dce_unreachable_expression"

func sideEffect(): Bool {
    println("side effect")
    true
}

main() {
    let reachable = sideEffect()
    let first = false && sideEffect()
    let second = true || sideEffect()
    let third = Option<Bool>.Some(true) ?? sideEffect()
    println(reachable)
    println(first)
    println(second)
    println(third)
}
