/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

import std.ast.*
import std.collection.*

class MyVisitor <: Visitor {
    public var subNames: ArrayList<String> = ArrayList<String>(0)
    public var identifier: ArrayList<String> = ArrayList<String>(0)

    public override func visit(s: SubscriptExpr): Unit {
        let name = s.indexList[0]
        let nameValue = match (name as RefExpr) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not RefExpr")
        }
        subNames.add(nameValue)
        return
    }

    public override func visit(s: RefExpr) : Unit{
        let name = s.identifier.value
        identifier.add(name)
        return
    }
}

main(): Int64 {
    let input = quote(
        a?[b]
    )
    let decl = parseExpr(input)

    let myVisitor = MyVisitor()
    decl.traverse(myVisitor)
    if (myVisitor.subNames[0] != "b") {
        return 1
    }
    if (myVisitor.identifier[0] != "a") {
        return 2
    }

    return 0
}
