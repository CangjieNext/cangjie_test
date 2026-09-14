// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Verify middle and last Nothing arguments preserve their distinct continuations.
// EXEC-PIPE-0: %compiler %cmp_opt %diag_json %f -o %output 2>&1 | compare %f
// ASSERT: scan-3 "DiagKind": "chir_dce_unreachable_expression_hint"

func stop(): Nothing { throw Exception() }
func next(): Int64 { 1 }
func consume(first: Int64, second: Int64, third: Int64) { }

func middle(): Int64 {
    consume(next(), stop(), next())
    println("unreachable after middle Nothing argument")
    0
}

func last(): Int64 {
    consume(next(), next(), stop())
    println("unreachable after last Nothing argument")
    0
}

main() { middle(); last() }
