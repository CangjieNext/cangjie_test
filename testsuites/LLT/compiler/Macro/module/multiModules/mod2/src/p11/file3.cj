// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package mod2.p11

import mod1.p3.*
internal import std.ast.*

@M1
class C1 <: ToTokens {
    let x1 = "hello"
    let x2 = "hello"
    let x3 = "hello"
    let x4 = "hello"
    let x5 = "hello"
}

@M1
class C2 {
    let x1 = "hello"
    @M2
    let x2 = "hello"
    let x3 = "hello"
    let x4 = "hello"
    let x5 = "hello"
}

@M1
class C3 {
    let x1 = "hello"
    let x2 = "hello"
    let x3 = "hello"
    let x4 = "hello"
    let x5 = "hello"
}

public func mew() {
    let c1 = C1()
    c1.sayHi()
    let c2 = C2()
    c2.sayHi()
    let c3 = C3()
    c3.sayHi()
}
