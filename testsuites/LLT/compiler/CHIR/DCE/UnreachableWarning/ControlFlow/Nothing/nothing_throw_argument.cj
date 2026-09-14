// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Verify a throwing argument and the following statement form separate unreachable regions.
// EXEC-PIPE-0: %compiler %cmp_opt %diag_json %f -o %output 2>&1 | compare %f
// ASSERT: scan-2 "DiagKind": "chir_dce_unreachable_expression_hint"

func next(): Int64 { 1 }
func consume(first: Int64, second: Int64, third: Int64) { }

main() {
    consume(next(), throw Exception(), next())
    println("unreachable after throw argument")
}
