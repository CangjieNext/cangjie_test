/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package test

internal import std.ast.*

class MyVisitor <: Visitor {}

main(): Unit {
    let tokens = quote(
        public enum Foo {
            Bar(Int64) |
            Baz(Int64)
            func dump() { }
        }
    )

    let enumDecl = parseDecl(tokens)
    let visitor = MyVisitor()
    enumDecl.traverse(visitor)
}
