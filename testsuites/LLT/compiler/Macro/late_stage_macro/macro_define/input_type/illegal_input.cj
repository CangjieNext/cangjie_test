// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// ERRCHECK: %compiler %cmp_opt %cmp_macro illegal_input.cj
// ASSERT: scan redefinition of declaration 'M'

macro package define

import stdx.syntax.*
import stdx.syntax
import std.ast

public late macro LateM0(input: Pattern): Decl {
    println("LateM with Pattern input")
    return input
}

public late macro LateM(input: ClassDecl): Decl {
    println("LateM with ClassDecl input")
    return input
}

public late macro LateM1(input: Tokens): Decl {
    println("LateM with Tokens input")
    return (parseTokens(input).node.getOrThrow() as Decl).getOrThrow()
}

public late macro LateM2(input: BinaryExpr): Expr {
    println("LateM with BinaryExpr input")
    return input
}

public late macro LateM3(input: ast.Expr): syntax.Expr {
    println("LateM with ast.Expr input")
    return input
}