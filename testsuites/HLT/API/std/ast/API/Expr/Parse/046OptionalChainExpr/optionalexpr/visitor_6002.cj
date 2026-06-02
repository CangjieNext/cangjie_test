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
    public var fieldNames: ArrayList<String> = ArrayList<String>(0)
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

    public override func visit(m: MemberAccess): Unit {
        let name = m.field.value
        fieldNames.add(name)
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
        a?.b.c?[d]
    )
    let decl = parseExpr(input)

    let myVisitor = MyVisitor()
    decl.traverse(myVisitor)

    // check info.
    if (myVisitor.subNames.size != 1 || myVisitor.fieldNames.size != 2 || myVisitor.identifier.size != 2) {
        return 1
    }

    if (myVisitor.subNames[0] != "d") {
        return 2
    }

    if (myVisitor.fieldNames[0] != "c" || myVisitor.fieldNames[1] != "b") {
        return 3
    }

    if (myVisitor.identifier[0] != "a") {
        return 4
    }
    return 0
}
