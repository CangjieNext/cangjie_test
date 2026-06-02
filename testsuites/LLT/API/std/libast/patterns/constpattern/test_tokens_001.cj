// DEPENDENCE:
// EXEC: %compiler %cmp_opt_chir2hlir %coverage_opt %f -o %output
// EXEC: %run %run_opt %output

internal import std.ast.*
internal import std.collection.*

class MyVisitor <: Visitor {
    var num = 0
    public override func visit(curNode: ConstPattern) {
        num++
        breakTraverse()
    }
}

let myVisitor = MyVisitor()

main(): Int64 {
    let input = quote(
        match(b) {
            case 0 | 10 => 1
            case _ => 2
        }
    )
    let me = (parseExpr(input) as MatchExpr).getOrThrow()
    let flag = compareTokens(input, me.toTokens())
    if (!flag) {
        return 1
    }
    me.traverse(myVisitor)
    if (myVisitor.num != 2) {
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
