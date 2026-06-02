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
    public var identifier: ArrayList<String> = ArrayList<String>(0)
    public var argNames: ArrayList<String> = ArrayList<String>(0)

    public override func visit(s: CallExpr): Unit {
        let name = s.arguments[0]
        let nameExpr = match (name as Argument) {
            case Some(v) => v.expr
            case None => throw Exception("Not Argument")
        }
        let nameExprValue = match (nameExpr as RefExpr) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not RefExpr")
        }
        argNames.add(nameExprValue)
        return
    }

    public override func visit(r: RefExpr) : Unit{
        let name = r.identifier.value
        identifier.add(name)
        return
    }
}

main(): Int64 {
    let input = quote(
        a?(b)?(c)
    )
    let decl = parseExpr(input)

    let myVisitor = MyVisitor()
    decl.traverse(myVisitor)
    // check info.
    if (myVisitor.argNames.size != 2 || myVisitor.identifier.size != 3) {
        return 1
    }
    if (myVisitor.argNames[0] != "c" || myVisitor.argNames[1] != "b") {
        return 2
    }

    if (myVisitor.identifier[0] != "a") {
        return 3
    }
    return 0
}
