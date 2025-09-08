// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// EXEC: %run %run_opt %output %run_args

internal import std.ast.*
internal import std.collection.*

class MyVisitor <: Visitor {
    public var types: ArrayList<TypeNode> = ArrayList<TypeNode>([])

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
        func foo(a: Int32, b!: Array<Int32> = Array<Int32>()): Int32 {
            var sum: Int32 = 0
            for (bb in b) {
                sum = sum + bb
            }
            return a * sum
        }
    )
    let decl = parseDecl(input)

    let myVisitor = MyVisitor()
    decl.traverse(myVisitor)

    let types = myVisitor.types

    let fdl = (decl as FuncDecl).getOrThrow()
    let params = fdl.funcParams
    let ty1 = params[1].paramType
    let e1 = params[1].expr

    let input2 = quote(
        class A{
            var a = AA()
            func bar(): This {
                return a.foo()
            }
        }
        
    )
    let decl2 = parseDecl(input2)
    decl2.traverse(myVisitor)

    return 0
}
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
