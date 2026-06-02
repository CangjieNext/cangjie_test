// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// EXEC: %run %run_opt %output %run_args

internal import std.ast.*
internal import std.collection.*

class MyVisitor <: Visitor {
    public var types: ArrayList<TypeNode> = ArrayList<TypeNode>(0)

    public override func visit(t: TypeNode) {
        println("visit Type")
        types.add(t)
        return
    }

    public override func visit(t: ThisType) {
        println("visit ThisType")
        return
    }

    public override func visit(t: Decl) {
        println("visit Decl")
        return
    }
}

main(): Int64 {
    let input = quote(
        func x() {
            let ret = match {
                case _ => a
            }
        }
    )
    let decl = parseDecl(input)

    let myVisitor = MyVisitor()
    decl.traverse(myVisitor)

    return 0
}
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
