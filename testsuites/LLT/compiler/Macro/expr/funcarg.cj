// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan a, b

internal import std.ast.*

main() {
    let input = quote(Dog(a, b))
    let expr = (parseExpr(input) as CallExpr).getOrThrow()
    println(expr.arguments.toTokens())
    0
}
