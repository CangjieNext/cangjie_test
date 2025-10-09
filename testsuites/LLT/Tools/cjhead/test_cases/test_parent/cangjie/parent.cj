// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package test.parent

public open class U1 {}

public class U2 <: U1 {}

public func f(a: U1): S2 {
    S2()
}

public func g(a: U2): S1 {
    S1()
}

public func call1() {
    g(U2())
    f(U2())
}

public func h(lam: (U2) -> S1): S1 {
    lam(U2())
}

public func call2() {
    h(g)
    h(f)
}
