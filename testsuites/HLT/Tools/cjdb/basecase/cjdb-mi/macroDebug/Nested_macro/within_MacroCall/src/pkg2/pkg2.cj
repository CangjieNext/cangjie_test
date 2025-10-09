/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

macro package pkg2

import std.ast.*

public macro AddToMul(inputTokens: Tokens): Tokens {
    var expr: BinaryExpr = parseBinaryExpr(inputTokens)
    var op0: Expr = expr.getLeftExpr()
    var op1: Expr = expr.getRightExpr()
    return quote(($(op0)) * ($(op1)))
}
