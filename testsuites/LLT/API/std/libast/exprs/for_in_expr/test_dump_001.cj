// DEPENDENCE: %n.expect
// EXEC: %compiler %cmp_opt_chir2hlir %coverage_opt %f -o %output
// EXEC: %run %run_opt %output > %n.txt
// EXEC: %diff %n.expect %n.txt

internal import std.ast.*
internal import std.collection.*

class MyVisitor <: Visitor {
    var ident: ArrayList<String> = ArrayList<String>()
    public override func visit(curNode: IfExpr) {
        breakTraverse()
    }
    public override func visit(curNode: VarDecl) {
        ident.add(curNode.identifier.value)
    }
}

let myVisitor = MyVisitor()

main(): Int64 {
    let input = quote(
        for (i in 0..attrSize-1) {
            var attrStr = attr[i].getOrThrow()
            var t = Tokens() + Token(TokenKind.IDENTIFIER, attrStr)
            if (attrStr.startsWith("Skip") || attrStr.startsWith("Bench") || attrStr.startsWith("TestCase")) {
                return Tokens()
            }
            t = t + Token(TokenKind.COMMA)
            tksInSquare = tksInSquare + t
        }
    )
    let expr = match (parseExpr(input) as ForInExpr) {
        case Some(v) => v
        case None => throw Exception()
    }
    let flag = compareTokens(input, expr.toTokens())
    if (!flag) {
        return 1
    }

    expr.traverse(myVisitor)
    if (myVisitor.ident.size != 2) {
        println(myVisitor.ident.size)
        return 2
    }
    try {
        expr.patternGuard
        return 3
    } catch (e: Exception) {
        ()
    }

    expr.dump()
    return 0
}
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
