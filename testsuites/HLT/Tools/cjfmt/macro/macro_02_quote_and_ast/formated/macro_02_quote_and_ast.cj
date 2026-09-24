/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

macro package macro_definition

import std.ast.*

public macro ModifyFunc(input: Tokens): Tokens {
    println("I'm in macro body")
    let funcDecl = FuncDecl(input)
    return quote(
        func $(funcDecl.identifier)(id: Int64) {
            println("start ${id}")
            $(funcDecl.block.nodes)
            println("end")
        })
}

public macro addToMul(inputTokens: Tokens): Tokens {
    var expr: BinaryExpr = match (parseExpr(inputTokens) as BinaryExpr) {
        case Some(v) => v
        case None => throw Exception()
    }
    var op0: Expr = expr.leftExpr
    var op1: Expr = expr.rightExpr
    return quote(  ($(op0))   *   ($(op1))  )
}
