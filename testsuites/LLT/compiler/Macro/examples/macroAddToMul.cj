// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

macro package macro_add_to_mul

internal import std.ast.*

public macro AddToMul(inputTokens: Tokens): Tokens {
    var expr: BinaryExpr = (parseExpr(inputTokens) as BinaryExpr).getOrThrow()
    var op0: Expr = expr.leftExpr
    var op1: Expr = expr.rightExpr
    return quote(($(op0)) * ($(op1)))
}
