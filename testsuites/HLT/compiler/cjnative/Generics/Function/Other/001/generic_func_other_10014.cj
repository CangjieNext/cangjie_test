/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// DEPENDENCE: main.cj
// EXEC: %compiler %cmp_macro %f
// EXEC: %compiler %cmp_opt %macro_lib main.cj -o %output
// RUN-EXEC: %run %run_opt %output %run_args

macro package define

import std.sync.*
import std.collection.*
import std.ast.*

class A {
    public func test<T>(x: T): T {
        var i0 = x
        var i1 = [x]
        var i2 = (x, x)
        var i3 = {i: T => i}
        var i4 = x |> i3
        var i5 = i3 ~> i3
        let i6: ?T = x
        var i7: ?((T) -> T) = i3
        var i8 = i7?(x)
        var i9: ?Array<T> = i1
        var i10 = i9?[0]
        var i11 = i6 ?? x
        var i12 = x is T
        var i13 = x as T
        var i14 = "${x;0}"
        var i15 = ArrayList<T>()
        var i16 = quote(T)
        println(i14)
        var m = ReentrantMutex()
        synchronized(m) {
            x
        }
        func foo<Y>(y: Y) {
            test(0);
            y
        }
        func bar<Z>(z: Z) {
            z
        }
        bar<T>(x)
        x
    }
}

public macro M(a: Tokens) {
    var x = A().test(0)
    return quote(0)
}
