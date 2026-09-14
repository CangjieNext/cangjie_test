// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Verify Nothing receiver and Nothing callee diagnostics retain their source locations.
// EXEC-PIPE-0: %compiler %cmp_opt %diag_json %f -o %output 2>&1 | compare %f
// ASSERT: scan-4 "DiagKind": "chir_dce_unreachable_expression_hint"

extend Nothing {
    func consume(value: Int64) { }
}
func stop(): Nothing { throw Exception() }
func next(): Int64 { 1 }

func receiver(): Int64 {
    stop().consume(next())
    println("unreachable after Nothing receiver")
    0
}

func callee(): Int64 {
    stop()(next())
    println("unreachable after Nothing callee")
    0
}

main() { receiver(); callee() }
