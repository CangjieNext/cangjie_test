// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

internal import std.ast.*
internal import std.collection.*

class MyVisitor <: Visitor {
    public var subNames: ArrayList<String> = ArrayList<String>(0)
    public var identifier: ArrayList<String> = ArrayList<String>(0)

    public override func visit(s: SubscriptExpr) {
        let name = (s.indexList[0] as RefExpr).getOrThrow().identifier.value
        subNames.add(name)
        return
    }

    public override func visit(s: RefExpr) {
        let name = s.identifier.value
        identifier.add(name)
        return
    }
}

main(): Int64 {
    let input = quote(
        a?[b]?[c]
    )
    let decl = parseExpr(input)

    let myVisitor = MyVisitor()
    decl.traverse(myVisitor)
    if (myVisitor.subNames[0] != "c" || myVisitor.subNames[1] != "b") {
        return 1
    }
    if (myVisitor.identifier[0] != "a") {
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
