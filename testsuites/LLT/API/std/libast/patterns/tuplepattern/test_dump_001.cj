// DEPENDENCE: %n.expect
// EXEC: %compiler %cmp_opt_chir2hlir %coverage_opt %f -o %output
// EXEC: %run %run_opt %output > %n.txt
// EXEC: %diff %n.expect %n.txt

internal import std.ast.*
internal import std.collection.*

class MyVisitor <: Visitor {
    var num = 0
    public override func visit(curNode: TuplePattern) {
        num++
        breakTraverse()
    }
}

let myVisitor = MyVisitor()

main(): Int64 {
    let input = quote(
        match (d) {
            case ("Bob", age) => "Bob is ${age} years old"
            case ("Alice", age) => "Alice is ${age} years old"
            case (name, 100) => "${name} is 100 years old"
            case (_, _) => "someone"
        }
    )
    let me = (parseExpr(input) as MatchExpr).getOrThrow()
    let flag = compareTokens(input, me.toTokens())
    if (!flag) {
        return 1
    }
    me.traverse(myVisitor)
    if (myVisitor.num != 4) {
        return 2
    }
    me.dump()
    return 0
}
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
