/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Description:  Aux file with some macros for testing

  @Structure:    complex-aux

  @MacroLib
*/

macro package aux_macros_01
import std.ast.*

public macro rec(x: Tokens) : Tokens {
    try {
        let expr = parseExpr(x)
        var p = match (expr as BinaryExpr ) {
            case Some(v) => v
            case None => throw Exception()
        }
        let lhs = p.leftExpr.toTokens()
        let op = p.op
        let rhs = p.rightExpr.toTokens()
        quote(@rec($lhs) + @rec($rhs))
    } catch (_) {
        x
    }
}
