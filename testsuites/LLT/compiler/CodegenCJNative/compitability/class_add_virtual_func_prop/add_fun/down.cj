// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package down

import up.*

class C3 <: C0 {
    public func hoo() { a + 3 }
}

class C4 <: C1 {}

main() {
    let v0 = C0()
    let v1 = C1()
    let v2 = C2()
    let v3 = C3()
    let v4 = C4()
    println(v0.foo())
    println(v1.foo())
    println(v2.foo())
    println(v3.foo())
    println(v4.foo())
}