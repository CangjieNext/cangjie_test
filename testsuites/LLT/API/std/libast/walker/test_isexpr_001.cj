// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// EXEC: %run %run_opt %output %run_args
internal import std.ast.*

class MyVisitor <: Visitor {

    /* ========== Expr ========= */

    public override func visit(curExpr: IsExpr) {
        println("IsExpr")
        return
    }
}

main(): Int64 {
    let input = quote(
        try {
            while(true) {
                let range1 = 0..=10:3
                Array<Int32>(10,2)
                a++
                {=> 42}
                break
            }
        } catch (e: IOException) {
            throw e
        } finally {
            if (true) {
                Int64.foo
                1 is Int64
            }
        }
    )
    let decl = parseExpr(input)

    let myVisitor = MyVisitor()
    decl.traverse(myVisitor)

    let input2 = quote(
        synchronized(mtx) {
            count = count + 1
        }
    )
    let decl2 = parseExpr(input2)
    decl2.traverse(myVisitor)
    return 0
}
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
