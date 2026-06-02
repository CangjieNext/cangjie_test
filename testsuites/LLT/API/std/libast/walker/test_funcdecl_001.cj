// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// EXEC: %run %run_opt %output %run_args

internal import std.ast.*
internal import std.collection.*

class MyVisitor <: Visitor {
    public var funcNames: ArrayList<String> = ArrayList<String>(0)
    public var types: ArrayList<TypeNode> = ArrayList<TypeNode>(0)

    public override func visit(d: FuncDecl) {
        let name = d.identifier.value
        funcNames.add(name)
        types.add(d.declType)
        return
    }
}

main(): Int64 {
    let input = quote(
    interface I1 {
        static func f1(a: Int64, b: Int64): Int64 {
            return a + b
        }
        func f2(): Int32 {
            return 42
        }
    })
    let decl = parseDecl(input)

    let myVisitor = MyVisitor()
    decl.traverse(myVisitor)

    // check info.
    if (myVisitor.funcNames.size != 2) {
        return 1
    }
    if (myVisitor.funcNames[0] != "f1" || myVisitor.funcNames[1] != "f2") {
        return 2
    }
    let types = myVisitor.types
    if (types.size != 2) {
        return 3
    }
    if ((types[0] as PrimitiveType).getOrThrow().keyword.value != "Int64") {
        return 4
    }
    if ((types[1] as PrimitiveType).getOrThrow().keyword.value != "Int32") {
        return 5
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
