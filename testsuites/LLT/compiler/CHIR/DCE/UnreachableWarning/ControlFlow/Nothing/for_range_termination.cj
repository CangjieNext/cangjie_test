// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Verify range-for termination CFG construction and a return successor diagnostic.
// EXEC-PIPE-0: %compiler %cmp_opt %diag_json %f -o %output 2>&1 | compare %f

// ASSERT: scan-1 "DiagKind": "chir_dce_unreachable_expression_hint"

func returnFromRange(shouldReturn: Bool): Int64 {
    for (_ in 0..1) {
        if (shouldReturn) {
            return 1
        }
    }
    0
}

func returnThenUnreachableInRange(): Int64 {
    for (_ in 0..1) {
        return 1
        // EXPECT: chir_dce_unreachable_expression_hint
        println("unreachable after range-for return")
    }
    0
}

main() {
    println(returnFromRange(true))
    println(returnFromRange(false))
    println(returnThenUnreachableInRange())
}
