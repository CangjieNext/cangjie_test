// DEPENDENCE: %n.expect
// EXEC: %compiler %cmp_opt_chir2hlir %coverage_opt %f -o %output
// EXEC: %run %run_opt %output > %n.txt
// EXEC: %diff %n.expect %n.txt

internal import std.ast.*
internal import std.collection.*

class MyVisitor <: Visitor {
    var ident: ArrayList<String> = ArrayList<String>()
    public override func visit(curNode: RefExpr) {
        ident.add(curNode.identifier.value)
        breakTraverse()
    }
}

let myVisitor = MyVisitor()

main(): Int64 {
    let input = quote(
        while(readLen > 0) {
            writeChunks(data.slice(0, readLen))
            readLen = body.read(data)
        }
    )
    let expr = match (parseExpr(input) as WhileExpr) {
        case Some(v) => v
        case None => throw Exception()
    }
    let flag = compareTokens(input, expr.toTokens())
    if (!flag) {
        return 1
    }
    expr.traverse(myVisitor)
    if (myVisitor.ident.size != 7) {
        return 2
    }
    expr.dump()

    var newNode = DoWhileExpr()
    newNode.keywordD = Token(TokenKind.DO)
    newNode.block = expr.block
    newNode.keywordW = Token(TokenKind.WHILE)
    newNode.condition = expr.condition

    var doWhileExpr = parseExpr(newNode.toTokens())
    doWhileExpr.dump()
    return 0
}
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
