// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

features { user.cmp.arch.big }
package cmp

import std.random.*

public platform func foo(): Unit {
    let random = Random()
    let x = Array<Int64>(1, repeat: random.nextInt64() )
    println("Platform 'foo'" + x[0].toString())
}

public func goo() {
    print("call from goo:")
    foo()
}
