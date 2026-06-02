// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan @Annotation
// ASSERT: scan class A {
// ASSERT: scan }

internal import std.ast.*

main(): Int64 {
    var input: Tokens = quote(
        @Annotation
        class A {}
    )
    var decl = parseDecl(input)
    println(decl.toTokens())
    0
}
