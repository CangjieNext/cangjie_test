/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// EXEC: %run %run_opt %output %run_args | compare %f

/* SCAN-IN
=== WhileExpr ===
Inside WhileExpr!
Inside Expr!
Insede Node!
Inside Expr!
Insede Node!
Inside Expr!
Insede Node!
===  Pattern ===
Inside VarPattern!
Insede Pattern!
Insede Node!
===  TypeNode ===
Insede PrimitiveType!
Insede TypeNode!
Insede Node!
*/

import std.ast.*

class MyVisitor <: Visitor {
    public override func visit(_: WhileExpr) {
        println("Inside WhileExpr!")
    }
    public override func visit(_: Expr) {
        println("Inside Expr!")
    }
    public override func visit(_: VarPattern) {
        println("Inside VarPattern!")
    }
    public override func visit(_:Pattern) {
        println("Insede Pattern!")
    }
    public override func visit(_:PrimitiveType) {
        println("Insede PrimitiveType!")
    }
    public override func visit(_:TypeNode) {
        println("Insede TypeNode!")
    }
    public override func visit(_:Node) {
        println("Insede Node!")
    }
}

main(): Unit {
    let visitor = MyVisitor()

    println("=== WhileExpr ===")
    // while(true) {}
    let whileNode = (WhileExpr(quote(while(true) {})) as Expr).getOrThrow()
    whileNode.traverse(visitor)

    println("===  Pattern ===")
    // a
    let patternNode = (VarPattern(quote(a)[0]) as Pattern).getOrThrow()
    patternNode.traverse(visitor)

    println("===  TypeNode ===")
    // Int64
    let typeNode = (PrimitiveType(quote(Int64)) as TypeNode).getOrThrow()
    typeNode.traverse(visitor)


}