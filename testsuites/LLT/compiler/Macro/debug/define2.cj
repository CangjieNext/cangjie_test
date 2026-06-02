// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

macro package test

internal import std.ast.*

// ok
public macro M(input: Tokens): Tokens {
    let decl = (parseDecl(input) as ClassDecl).getOrThrow()
    return quote(
        class $(decl.identifier) {
            func mySum(a: Int32, b: Int32): Int32 {
                return a + b
            }
            $(decl.body.decls)
            func bar(): String { 
                return "bar" 
            }
        }
    )
}

public macro M1(input: Tokens): Tokens {
    let decl = (parseDecl(input) as StructDecl).getOrThrow()
    return quote($decl)
}
