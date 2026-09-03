// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Nothing calls, throws, and returns report the first sequential successor.
// EXEC-PIPE-0: %compiler %cmp_opt %diag_json %f -o %output 2>&1 | compare %f

// ASSERT: scan-3 "DiagKind": "chir_dce_unreachable_expression_hint"

func stop(): Nothing {
    throw Exception()
}

func nothingCallSuccessor(): Int64 {
    stop()
    // EXPECT: chir_dce_unreachable_expression_hint
    println("unreachable after Nothing call")
    0
}

func catchThrow() {
    try {
        throw Exception()
    } catch (error: Exception) {
        throw error
        // EXPECT: chir_dce_unreachable_expression_hint
        println("unreachable catch")
    }
}

func consecutiveReturns(): Int64 {
    return 1
    // EXPECT: chir_dce_unreachable_expression_hint
    return 2
    return 3
}

main() {
    nothingCallSuccessor()
    catchThrow()
    println(consecutiveReturns())
}
