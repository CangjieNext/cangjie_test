// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package mod2.p22

import mod1.p3.*

@M1
class B1 {
    let x1 = "hello"
    let x2 = "hello"
    let x3 = "hello"
    let x4 = "hello"
    let x5 = "hello"
}

@M1
class B2 {
    let x1 = "hello"
    let x2 = "hello"
    let x3 = "hello"
    let x4 = "hello"
    let x5 = "hello"
}

@M1
class B3 {
    let x1 = "hello"
    let x2 = "hello"
    let x3 = "hello"
    let x4 = "hello"
    let x5 = "hello"
}

public func wee() {
    let b1 = B1()
    b1.sayHi()
    let b2 = B2()
    b2.sayHi()
    let b3 = B3()
    b3.sayHi()
}
