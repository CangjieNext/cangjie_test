// DEPENDENCE: %n.expect
// EXEC: %compiler %cmp_opt_chir2hlir %coverage_opt %f -o %output
// EXEC: %run %run_opt %output > %n.txt
// EXEC: %diff %n.expect %n.txt

internal import std.ast.*

class MyVisitor <: Visitor {
    public override func visit(curNode: Node) {}
}

main(): Int64 {
    let input = quote(
        derive1 as Base1
    )
    let asExpr = (parseExpr(input) as AsExpr).getOrThrow()
    let myVisitor = MyVisitor()
    asExpr.traverse(myVisitor)
    let expr = asExpr.expr
    let ty = asExpr.shiftType
    if (!(expr is RefExpr)) {
        return 1
    }
    let exprID = (expr as RefExpr).getOrThrow().identifier
    if (exprID.value != "derive1") {
        return 2
    }

    if (!(ty is RefType)) {
        return 3
    }
    let tyID = (ty as RefType).getOrThrow().identifier
    if (tyID.value != "Base1") {
        return 4
    }
    asExpr.dump()
    0
}
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
