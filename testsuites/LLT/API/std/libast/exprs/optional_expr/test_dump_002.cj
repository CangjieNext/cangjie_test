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

let opTokens = quote(c?.a?(b))
let opExpr3 = parseExpr(opTokens)
let myVisitor = MyVisitor()

main(): Int64 {
    var flag = opExpr3 is CallExpr
    if (!flag) {
        return 1
    }
    let expr = (opExpr3 as CallExpr).getOrThrow()
    let call = (expr.callFunc as OptionalExpr).getOrThrow()
    if (!(call.baseExpr is MemberAccess)) {
        return 2
    }

    expr.traverse(myVisitor)
    if (myVisitor.ident.size != 2) {
        return 3
    }
    opExpr3.dump()

    return 0
}
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
