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
    public var fieldNames: ArrayList<String> = ArrayList<String>(0)
    public var identifier: ArrayList<String> = ArrayList<String>(0)
    public var lambdaBodyNames: ArrayList<String> = ArrayList<String>(0)

    public override func visit(m: MemberAccess): Unit {
        let name = m.field.value
        fieldNames.add(name)
        return
    }

    public override func visit(s: TrailingClosureExpr): Unit {
        let name = s.lambdaExpr
        let nameExpr = match (name as LambdaExpr) {
            case Some(v) => v.nodes[0]
            case None => throw Exception("Not LambdaExpr")
        }
        let nameExprValue = match (nameExpr as RefExpr) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not RefExpr")
        }
        lambdaBodyNames.add(nameExprValue)
        return
    }

    public override func visit(r: RefExpr): Unit {
        let name = r.identifier.value
        identifier.add(name)
        return
    }
}

main(): Int64 {
    let input = quote(
        a?{b}?.c
    )
    let decl = parseExpr(input)

    let myVisitor = MyVisitor()
    decl.traverse(myVisitor)

    // check info.
    if (myVisitor.fieldNames.size != 1 || myVisitor.lambdaBodyNames.size != 1) {
        return 1
    }

    if (myVisitor.fieldNames[0] != "c") {
        return 2
    }

    if (myVisitor.lambdaBodyNames[0] != "b") {
        return 3
    }
    if (myVisitor.identifier[0] != "a") {
        return 4
    }
    return 0
}
