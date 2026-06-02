// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// EXEC: %run %run_opt %output %run_args
internal import std.ast.*

class MyVisitor <: Visitor {

    /* ========== Decl ========= */

    public override func visit(curExpr: Node) {
        println("Node")
        return
    }
}

main(): Int64 {
    let input = quote(
        let arr5: VArray<Int64, \$5> = VArray<Int64, \$5>({i => i})
    )
    let decl = parseDecl(input)
    let myVisitor = MyVisitor()
    decl.traverse(myVisitor)
    return 0
}
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
