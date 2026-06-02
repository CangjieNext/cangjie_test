macro package expr_macro

internal import std.ast.*

public macro M(tokens: Tokens): Tokens {
    let ast = parseDecl(tokens)
    let ast_tokens = ast.toTokens()
    ast_tokens.dump()
    return ast_tokens
}

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
