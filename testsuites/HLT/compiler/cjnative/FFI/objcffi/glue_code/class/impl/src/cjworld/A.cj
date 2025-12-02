/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package cjworld

import objc.lang.*

@ObjCImpl
public class A <: M {
    public init() {
    }
    public open func foo(): Unit {
        var p = M()
        println("in cangjie foo")
    }

    public open func aFoo0(p0: ?M): ?M {
        if (let Some(m) <- p0) {
            println("aFoo0 Some")
            m.mFoo()
            println("class类型传参")
            global_func1(p0)
            global_func2(p0, 114514, 114.514)
            println("传参顺序正常")
            global_func3(p0: p0, p1: 114514, p2: 114.514)
            println("传参顺序颠倒")
            global_func3(p2: 114.514, p1: 114514, p0: p0)
            println("缺省拥有默认值的形参")
            global_func4(p0: p0)
            println("protocol类型传参")
            global_func5(m as P)
        } else {
            println("aFoo0 None")
        }
        println("global_func() = ${global_func()}")
        println("global_func0(114514) = ${global_func0(114514)}")
        p0
    }
    public open func aFoo1(p0: ?P): ?P {
        println("aFoo1")
        if (let Some(p) <- p0) {
            println("aFoo1 Some")
            p.pFoo()
        }
        p0
    }
}
