// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Regression: a last Nothing argument in a try block reports only its following continuation.
// EXEC-PIPE-0: %compiler %cmp_opt %diag_json %f -o %output 2>&1 | compare %f
// ASSERT: scan-1 "DiagKind": "chir_dce_unreachable_expression_hint"

func stop(): Nothing { throw Exception() }
func next(): Int64 { 1 }
func consume(a: Int64, b: Nothing) {}

func test() {
    try {
        consume(next(), stop())
        println("unreachable after try call")
    } catch (_) {
        ()
    }
}

main() { test() }
