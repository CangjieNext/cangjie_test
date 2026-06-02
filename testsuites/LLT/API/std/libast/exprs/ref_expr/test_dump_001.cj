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
    }
}

let myVisitor = MyVisitor()

main(): Int64 {
    let input = quote(
        foo<Int32, T>(a,b)
    )
    let expr = match (parseExpr(input) as CallExpr) {
        case Some(v) => v
        case None => throw Exception()
    }
    let flag = compareTokens(input, expr.toTokens())
    if (!flag) {
        return 1
    }

    let refExpr = (expr.callFunc as RefExpr).getOrThrow()
    if (refExpr.typeArguments.size != 2) {
        return 2
    }
    if (refExpr.identifier.value != "foo") {
        return 3
    }

    expr.traverse(myVisitor)
    if (myVisitor.ident.size != 3) {
        return 4
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
