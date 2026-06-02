// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package mod2.p33

import mod1.p3.*

@M1
class D1 {
    let x1 = "hello"
    let x2 = "hello"
    let x3 = "hello"
    let x4 = "hello"
    let x5 = "hello"
}

@M1
class D2 {
    let x1 = "hello"
    let x2 = "hello"
    let x3 = "hello"
    let x4 = "hello"
    let x5 = "hello"
}

@M1
class D3 {
    let x1 = "hello"
    let x2 = "hello"
    let x3 = "hello"
    let x4 = "hello"
    let x5 = "hello"
}

@M2
@M2
struct BB {
    @M2
    @M2
    let a = 42
    @M2
    func getA() {
        return a
    }
}

public func wow() {
    let d1 = D1()
    d1.sayHi()
    let d2 = D2()
    d2.sayHi()
    let d3 = D3()
    d3.sayHi()
    let bb = BB()
    println(bb.getA())
}
