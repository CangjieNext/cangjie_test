// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// EXEC: %run %run_opt %output %run_args

internal import std.ast.*
internal import std.collection.*

class MyVisitor <: Visitor {
    public override func visit(t: TypeNode) {
        return
    }
}

main(): Int64 {
    let input = quote(
        [1, 2, 3]
        
    )
    let arraylit = parseExpr(input)
    let myVisitor = MyVisitor()
    arraylit.traverse(myVisitor)

    let input2 = quote(
        (1, 2, 3, 4)
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
