// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// EXEC: %run %run_opt %output %run_args

internal import std.ast.*

var res: Int32 = 0

class MyVisitor <: Visitor {}

main(): Int64 {
    let input = quote(
        enum X<T> where T <: A {
            | a
            | b(T)
            | c(T, T)
            | d(Int32, T)

            func foo() {
                return 42
            }

            func bar() {
                return "42"
            }
        }
    )
    let decl = parseDecl(input)

    let myVisitor = MyVisitor()
    decl.traverse(MyVisitor())
    return 0
}
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
