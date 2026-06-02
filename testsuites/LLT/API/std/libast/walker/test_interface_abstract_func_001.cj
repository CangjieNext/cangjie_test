// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// EXEC: %run %run_opt %output %run_args

internal import std.ast.*

var res: Int32 = 0

class MyVisitor <: Visitor {
    public override func visit(fd: FuncDecl) {
        let ident = fd.identifier.value
        println(ident)
        return
    }
}

main(): Int64 {
    let input = quote(
         interface X<T> where T<: A{
            func x():Int64 // No funcBody
            func x(){}
            prop x:Int64{
                get(){}
            }
         }
    )
    let decl = parseDecl(input)
    println(decl.toTokens())

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
