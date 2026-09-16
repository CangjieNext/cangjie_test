// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Verify successors of all-terminating if, match, and try/catch expressions.
// EXEC-PIPE-0: %compiler %cmp_opt %diag_json %f -o %output 2>&1 | compare %f

// ASSERT: scan-2 "DiagKind": "chir_dce_unreachable_expression_hint"

func returnsEveryBranch(value: Bool): Int64 {
    if (value) { return 1 } else { return 2 }
    println("unreachable after all-return if")
    return 3
}

func matchThrows(value: Bool) {
    match (value) { case true => throw Exception(); case false => throw Exception() }
    println("unreachable after all-throw match")
    println("also unreachable after all-throw match")
}

func catchesThrow() {
    try { throw Exception() } catch (_: Exception) { throw Exception() }
    println("unreachable after all-throw try")
    println("also unreachable after all-throw try")
}

main() {
    returnsEveryBranch(true)
    matchThrows(true)
    catchesThrow()
}
