// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

macro package pkg1

internal import std.ast.*

public macro Same(input: Tokens) {
    return input
}

public macro Foo(input: Tokens): Tokens {
    let ret = quote(
        let a1 = 1;
        let a2 = 2;
        let a3 = 3
        var a4 = a1 + a2
        func sum(x: Int64, y: Int64): Int64 {
            return x + y
        }
        let a5 = sum(a2, a4)
    )
    return ret
}

public macro Bar(input: Tokens): Tokens {
    return quote(
        let d = 2021
    )
}

public macro Baz(input: Tokens): Tokens {
    return quote(
        let e = 2021
    )
}

public macro M1(input: Tokens) {
    return quote(
        let a1 = 1
        let a2 = 2
        func foo(a: Int32): String {
            return a // error
        }
        let a3 = 3
    )
}

public macro M2(input: Tokens) {
    return quote(
        let a1 = "Hello\n"
        let a2 = 2; let a3 = "World";
        func same(a: Int32): T1 { // error
            return a 
        }
        let a4 = 3
    )
}
