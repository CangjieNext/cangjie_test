/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC-PIPE-1: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: regex error.*expected expression after \'\?\', found \'<EOF>\'
import std.ast.*
import std.collection.*

class MyVisitor <: Visitor {
    public var fieldNames: ArrayList<String> = ArrayList<String>(0)
    public var identifier: ArrayList<String> = ArrayList<String>(0)

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
        a?.b.c?.d?
    )
    let decl = parseExpr(input)

    let myVisitor = MyVisitor()
    decl.traverse(myVisitor)
    return 0
}
