// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

macro package define

import stdx.syntax.*
import stdx.syntax
import std.ast

public late macro LateM0(input: Decl): Pattern {
    println("LateM with Pattern output")
    return input
}

public late macro LateM(input: Decl): ClassDecl {
    println("LateM with ClassDecl output")
    return input
}

public late macro LateM1(input: Decl): Tokens {
    println("LateM with Tokens output")
    return (parseTokens(input).node.getOrThrow() as Decl).getOrThrow()
}

public late macro LateM2(input: Expr): BinaryExpr {
    println("LateM with BinaryExpr output")
    return input
}

public late macro LateM3(input: Expr): ast.Expr {
    println("LateM with ast.Expr output")
    return input
}