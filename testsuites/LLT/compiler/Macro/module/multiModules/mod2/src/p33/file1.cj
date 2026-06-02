// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package mod2.p33

import mod1.p3.*

@M1
class A1 {
    let x1 = "hello"
    let x2 = "hello"
    let x3 = "hello"
    let x4 = "hello"
    let x5 = "hello"
}

@M1
class A2 {
    let x1 = "hello"
    let x2 = "hello"
    let x3 = "hello"
    let x4 = "hello"
    let x5 = "hello"
}

@M1
@M2
class A3 {
    @M2
    let x1 = "hello"
    let x2 = "hello"
    let x3 = "hello"
    let x4 = "hello"
    let x5 = "hello"
}

public func beep() {
    let a1 = A1()
    a1.sayHi()
    let a2 = A2()
    a2.sayHi()
    let a3 = A3()
    a3.sayHi()
}
