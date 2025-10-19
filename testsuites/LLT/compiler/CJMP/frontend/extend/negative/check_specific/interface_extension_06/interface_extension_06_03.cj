// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// SEPARATE-FILE: c/c.cj
// EXEC-0: %compiler %noColor --experimental c/c.cj --output-type=chir --output-dir ./c
package cmp

interface Ioo<O, P> {}

class Foo<M, N> {}

common extend<T, G> Foo<T, G> <: Ioo<T, T> where T <: Ioo<G, G> {
    common func goo<Z>(z:Z, t:T):Unit {
        println("common::goo<Z>")
    }

    common public mut prop p: T {
        get() { p }
        set(t) { }
    }
}


// SEPARATE-FILE: p/p.cj
// EXEC-0: %compiler %noColor --experimental p/p.cj c/cmp.chir --common-part-cjo=./c/cmp.cjo --output-type=dylib --output-dir ./p
package cmp

platform extend<X, Y> Foo<X, Y> <: Ioo<X, X> where X <: Ioo<Y, Y> {
    platform func goo<Z>(z:Z, x:X):Unit {
        println("platform::goo<Z>")
    }

    platform public mut prop p: X {
        get() { p }
        set(t) { }
    }
}