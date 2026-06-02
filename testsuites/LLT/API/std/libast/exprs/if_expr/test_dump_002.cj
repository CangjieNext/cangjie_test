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
        if (a > 2) {
            let b = a + foo()
            var c = b + 2
            c = c + 200 * 3
            return c
        } else if ( a < -2) {
            let c = 42
            return c
        } else {
            return 42
        }
    )
    let expr = match (parseExpr(input) as IfExpr) {
        case Some(v) => v
        case None => throw Exception()
    }
    let flag = compareTokens(input, expr.toTokens())
    if (!flag) {
        return 1
    }
    var elseExpr = expr.elseExpr
    if (!(elseExpr is IfExpr)) {
        return 2
    }
    var ifExprNode = (elseExpr as IfExpr).getOrThrow()
    var block = ifExprNode.elseExpr
    if (!(block is Block)) {
        return 3
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
