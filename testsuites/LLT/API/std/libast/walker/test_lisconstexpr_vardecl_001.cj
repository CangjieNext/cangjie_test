// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// EXEC: %run %run_opt %output %run_args

internal import std.ast.*
internal import std.collection.*

class MyVisitor <: Visitor {
    public var literals: ArrayList<String> = ArrayList<String>(0)
    public var exprs: ArrayList<LitConstExpr> = ArrayList<LitConstExpr>(0)
    public var initializers: ArrayList<Expr> = ArrayList<Expr>(0)

    // collect all literals.
    // literals: 2021, 2, 3, 1, 1, 4
    public override func visit(e: LitConstExpr) {
        let name = e.literal.value
        literals.add(name)
        exprs.add(e)
        return
    }

    // collect all initializers in VarDecl.
    // initializers: 2021, 2+3+a
    public override func visit(d: VarDecl) {
        let initExpr = d.expr
        initializers.add(initExpr)
        return
    }
}

main(): Int64 {
    let input = quote(
    class Data {
        let a: Int32 = 2021
        let b: Int32 = 2 + 3 + a
        func getA(): Int32 {
            return a + 1
        }
        func getB(): Int32 {
            return b + 1 + 4
        }
    })
    let decl = parseDecl(input)

    let myVisitor = MyVisitor()
    decl.traverse(myVisitor)

    // check myVisitor.
    if (myVisitor.literals.size != 6) {
        return 1
    }
    if (myVisitor.literals[0] != "2021" || myVisitor.literals[2] != "3") {
        return 1
    }
    let exprs = myVisitor.exprs
    if (exprs.size != 6) {
        return 1
    }
    let initializers = myVisitor.initializers
    if (initializers.size != 2) {
        return 1
    }
    if (!(initializers[0] is LitConstExpr) || !(initializers[1] is BinaryExpr)) {
        return 1
    }
    return 0
}
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
