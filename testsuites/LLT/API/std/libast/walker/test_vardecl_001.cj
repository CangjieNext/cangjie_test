// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// EXEC: %run %run_opt %output %run_args

internal import std.ast.*
internal import std.collection.*

class MyVisitor <: Visitor {
    public var initializers: ArrayList<Expr> = ArrayList<Expr>(0)

    public override func visit(d: VarDecl) {
        try {
            initializers.add(d.expr)
        } catch (e: Exception) {
            ()
        }
        return
    }
}

main(): Int64 {
    let input = quote(
        class Data {
            let a: Int32 = 42
            var b: Int32 // unitialized. Might cause segfault if visit initializer by default.
            func getA() {
                return a
            }
            func getB() {
                return b
            }
            init(a_: Int32, b_: Int32) {
                this.a = a_
                this.b = b_
            }
            init() {
                this.b = 42
            }
        }
    )
    let decl = parseDecl(input)

    let myVisitor = MyVisitor()
    decl.traverse(myVisitor)

    let initializers = myVisitor.initializers
    if (initializers.size != 1) {
        return 1
    }
    if (((initializers)[0] is LitConstExpr)) {
        let lit = (initializers[0] as LitConstExpr).getOrThrow() // 42
        if (lit.literal.value != "42") {
            return 2
        }
    } else {
        return 3
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
