// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// EXEC: %run %run_opt %output %run_args

internal import std.ast.*

class MyVisitor <: Visitor {
    // override public func visit(curNode: Node): Bool { true }
}

main(): Int64 {
    let code = "a = 0"
    let assignExprTokens = cangjieLex(code)
    let assignExpr = (parseExpr(assignExprTokens) as AssignExpr).getOrThrow()
    let leftValue = (assignExpr.leftExpr as RefExpr).getOrThrow()
    let leftIdentifier = leftValue.identifier
    if (leftIdentifier != Token(TokenKind.IDENTIFIER, "a").addPosition(0, 1, 1)) {
        return -1
    }
    let rightExpr = (assignExpr.rightExpr as LitConstExpr).getOrThrow()
    let rightExprToken = rightExpr.literal
    if (rightExprToken != Token(TokenKind.INTEGER_LITERAL, "0").addPosition(0, 1, 5)) {
        return 1
    }
    let unary = "!1"
    let unaryExprTokens = cangjieLex(unary)
    let unaryIsAssign = parseExpr(unaryExprTokens) is AssignExpr
    if (unaryIsAssign) {
        return 2
    }
    let assignExpr1 = (parseExpr(assignExprTokens) as AssignExpr).getOrThrow()
    let myVisitor = MyVisitor()
    assignExpr1.traverse(myVisitor)
    return 0
}
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
