// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Verify Nothing successors in loop bodies.
// EXEC-PIPE-0: %compiler %cmp_opt %diag_json %f -o %output 2>&1 | compare %f


// ASSERT: scan-5 "DiagKind": "chir_dce_unreachable_expression_hint"

func doWhileBreak() {
    do {
        break
        println("unreachable do while")
    } while (true)
}

func whileReturn(): Int64 {
    while (true) {
        return 1
        return 2
    }
    return 3
}

func forThrow() {
    for (_ in 0..1) {
        throw Exception()
        println("unreachable for throw")
    }
}

func forBreak() {
    for (_ in 0..1) {
        break
        println("unreachable for break")
    }
}

func continueInFor() {
    for (_ in 0..1) {
        continue
        println("unreachable continue")
    }
}

main() {
    doWhileBreak()
    println(whileReturn())
    forThrow()
    forBreak()
    continueInFor()
}
