// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// EXEC: %run %run_opt %output %run_args

internal import std.ast.*
internal import std.collection.*

class MyVisitor <: Visitor {
    public var fieldNames: ArrayList<String> = ArrayList<String>(0)
    public var identifier: ArrayList<String> = ArrayList<String>(0)

    public override func visit(m: MemberAccess) {
        let name = m.field.value
        println(name)
        fieldNames.add(name)
    }

    public override func visit(r: RefExpr) {
        let name = r.identifier.value
        identifier.add(name)
        return
    }
}

main(): Int64 {
    let input = quote(
        a?.b.c?.d
    )
    let decl = parseExpr(input)
    let myVisitor = MyVisitor()
    decl.traverse(myVisitor)

    // check info.
    if (myVisitor.fieldNames.size != 3) {
        return 1
    }

    if (myVisitor.fieldNames[0] != "d" || myVisitor.fieldNames[1] != "c" || myVisitor.fieldNames[2] != "b") {
        return 2
    }

    if (myVisitor.identifier[0] != "a") {
        return 3
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
