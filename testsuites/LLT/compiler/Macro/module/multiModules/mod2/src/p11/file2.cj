// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package mod2.p11

import mod1.p3.*

@M1
class B1 {
    let x1 = "hello"
    let x2 = "hello"
    let x3 = "hello"
    let x4 = "hello"
    let x5 = "hello"

    operator func ()() {
        return x1 + x2 + x3
    }
}

@M1
class B2 <: ToString {
    let x1 = "hello"
    let x2 = "hello"
    let x3 = "hello"
    let x4 = "hello"
    let x5 = "hello"
    func toString(): String {
        return x1 + x2
    }
}

@M1
class B3 {
    let x1 = "hello"
    let x2 = "hello"
    let x3 = "hello"
    let x4 = "hello"
    let x5 = "hello"
}

@M2
struct AA {
    var a: Int64 = 0
    var b: Int64 = 0
    @M2
    init() {
        a = 42
        b = 42
    }
}

@M2
public func wee() {
    let b1 = B1()
    b1.sayHi()
    let b2 = B2()
    b2.sayHi()
    let b3 = B3()
    b3.sayHi()
}
