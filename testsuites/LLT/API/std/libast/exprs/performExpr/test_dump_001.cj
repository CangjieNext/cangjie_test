// EXEC: %compiler %enableEH %cmp_opt_chir2hlir %f -o %output
// EXEC: %run %set_stdx_path %run_opt %output

internal import std.ast.*
internal import std.collection.*

class MyVisitor <: Visitor {
    var num = 0
    override public func visit(curNode: PerformExpr) {
        num++
    }
}

let myVisitor = MyVisitor()

main(): Int64 {
    let input = quote(
        perform Eff()
    )
    let te = parseExpr(input)
    let flag = compareTokens(input, te.toTokens())
    if (!flag) {
        return 1
    }
    te.traverse(myVisitor)
    if (myVisitor.num != 1) {
        return 2
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