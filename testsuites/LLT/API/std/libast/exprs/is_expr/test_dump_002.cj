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
    var input = quote(
        a is T
    )
    let isExpr = match (parseExpr(input) as IsExpr) {
        case Some(v) => v
        case None => throw Exception()
    }
    var flag = compareTokens(input, isExpr.toTokens())
    if (!flag) {
        return 1
    }
    isExpr.traverse(myVisitor)
    if (myVisitor.ident.size != 1) {
        return 2
    }
    isExpr.dump()

    return 0
}
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
