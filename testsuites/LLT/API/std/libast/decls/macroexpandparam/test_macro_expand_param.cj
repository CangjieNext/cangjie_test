/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args | compare %f

internal import std.ast.*

class MyVisitor <: Visitor {}

main() {
    var tokens: Tokens = quote(func foo<T> (@!Anno1["1"] a: Int64){ a })
    var decl = (parseDecl(tokens) as FuncDecl).getOrThrow()
    let myVisitor = MyVisitor()
    decl.funcParams[0].traverse(myVisitor)
    decl.funcParams[0].toTokens().dump()
    tokens = quote(func foo<T> (@A.a a: Int64){ a })
    decl = (parseDecl(tokens) as FuncDecl).getOrThrow()
    decl.funcParams[0].traverse(myVisitor)
    decl.funcParams[0].toTokens()
    return 0
}

// ASSERT: scan description: at_exclamation, token_id: 155, token_literal_value: @!
// ASSERT: scan description: identifier, token_id: 137, token_literal_value: Anno1
// ASSERT: scan description: l_square, token_id: 4, token_literal_value: [
// ASSERT: scan description: double_quoted_string_literal, token_id: 147, token_literal_value: 1
// ASSERT: scan description: r_square, token_id: 5, token_literal_value: ]
// ASSERT: scan description: newline, token_id: 143, token_literal_value: \\n
// ASSERT: scan description: identifier, token_id: 137, token_literal_value: a
// ASSERT: scan description: colon, token_id: 28, token_literal_value: :
// ASSERT: scan description: Int64, token_id: 65, token_literal_value: Int64
