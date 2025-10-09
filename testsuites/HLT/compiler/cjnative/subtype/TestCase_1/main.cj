/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package packageA

interface I0<T> <: I1<BBB> {
    func I0foo(f: Float64): T
}

interface I1<T> {
    func I1foo(f: Float64): T
}

interface I2<T> <: I1<BBB> {
    func I2foo(f: Float64): T
}

interface I3<T> <: I4<BBB> & I0<BBB> & I1<BBB> {
    func I3foo(f: Float64): T
}

interface I4<T> {
    func I4foo(f: Float64): T
}

class BBB {
    public func goo(): Int64 {
        0i64
    }
}

abstract class A0 <: A3 & I3<BBB> & I1<BBB> & I4<BBB> & I0<BBB> {
    public open func I3foo(f: Float64): BBB

    public open func I4foo(f: Float64): BBB

    public open func I0foo(f: Float64): BBB

    public open func I1foo(f: Float64): BBB
}

abstract class A1 <: A3 & I2<BBB> & I1<BBB> {
    public open func I2foo(f: Float64): BBB

    public open func I1foo(f: Float64): BBB

    public open func I3foo(f: Float64): BBB

    public open func I4foo(f: Float64): BBB

    public open func I0foo(f: Float64): BBB
}

abstract class A2 <: A1 & I3<BBB> {
    public open func I3foo(f: Float64): BBB

    public open func I4foo(f: Float64): BBB

    public open func I0foo(f: Float64): BBB

    public open func I1foo(f: Float64): BBB

    public open func I2foo(f: Float64): BBB
}

abstract class A3 <: I3<BBB> & I1<BBB> {
    public open func I3foo(f: Float64): BBB

    public open func I4foo(f: Float64): BBB

    public open func I0foo(f: Float64): BBB

    public open func I1foo(f: Float64): BBB
}

abstract class A4 <: A3 & I3<BBB> {
    public open func I3foo(f: Float64): BBB

    public open func I4foo(f: Float64): BBB

    public open func I0foo(f: Float64): BBB

    public open func I1foo(f: Float64): BBB
}

open class O0 <: A0 {
    var O0a = 114514i64

    public open func I3foo(f: Float64): BBB {
        println(this.O0a)
        BBB()
    }

    public open func I4foo(f: Float64): BBB {
        println(this.O0a)
        BBB()
    }

    public open func I0foo(f: Float64): BBB {
        println(this.O0a)
        BBB()
    }

    public open func I1foo(f: Float64): BBB {
        println(this.O0a)
        BBB()
    }
}

open class O1 <: A0 & I2<BBB> & I1<BBB> & I0<BBB> & I4<BBB> {
    var O1a = 114514i64

    public open func I2foo(f: Float64): BBB {
        println(this.O1a)
        BBB()
    }

    public open func I1foo(f: Float64): BBB {
        println(this.O1a)
        BBB()
    }

    public open func I0foo(f: Float64): BBB {
        println(this.O1a)
        BBB()
    }

    public open func I4foo(f: Float64): BBB {
        println(this.O1a)
        BBB()
    }

    public open func I3foo(f: Float64): BBB {
        println(this.O1a)
        BBB()
    }
}

open class O2 <: I0<BBB> & I4<BBB> & I1<BBB> & I3<BBB> {
    var O2a = 114514i64

    public open func I0foo(f: Float64): BBB {
        println(this.O2a)
        BBB()
    }

    public open func I1foo(f: Float64): BBB {
        println(this.O2a)
        BBB()
    }

    public open func I4foo(f: Float64): BBB {
        println(this.O2a)
        BBB()
    }

    public open func I3foo(f: Float64): BBB {
        println(this.O2a)
        BBB()
    }
}

open class O3 <: A0 {
    var O3a = 114514i64

    public open func I3foo(f: Float64): BBB {
        println(this.O3a)
        BBB()
    }

    public open func I4foo(f: Float64): BBB {
        println(this.O3a)
        BBB()
    }

    public open func I0foo(f: Float64): BBB {
        println(this.O3a)
        BBB()
    }

    public open func I1foo(f: Float64): BBB {
        println(this.O3a)
        BBB()
    }
}

open class O4 <: A1 & I0<BBB> & I1<BBB> {
    var O4a = 114514i64

    public open func I0foo(f: Float64): BBB {
        println(this.O4a)
        BBB()
    }

    public open func I1foo(f: Float64): BBB {
        println(this.O4a)
        BBB()
    }

    public open func I2foo(f: Float64): BBB {
        println(this.O4a)
        BBB()
    }

    public open func I3foo(f: Float64): BBB {
        println(this.O4a)
        BBB()
    }

    public open func I4foo(f: Float64): BBB {
        println(this.O4a)
        BBB()
    }
}

class C0 {
    var C0a = 114514i64
}

class C1 {
    var C1a = 114514i64
}

class C2 {
    var C2a = 114514i64
}

class C3 {
    var C3a = 114514i64
}

class C4 {
    var C4a = 114514i64
}

main(): Unit {
    let x0: A0 = O0()
    x0.I3foo(114.514000f64)
    x0.I4foo(114.514000f64)
    x0.I0foo(114.514000f64)
    x0.I1foo(114.514000f64)
    let x1: A0 = O1()
    x1.I3foo(114.514000f64)
    x1.I4foo(114.514000f64)
    x1.I0foo(114.514000f64)
    x1.I1foo(114.514000f64)
    let x2: A0 = O3()
    x2.I3foo(114.514000f64)
    x2.I4foo(114.514000f64)
    x2.I0foo(114.514000f64)
    x2.I1foo(114.514000f64)
    let x3: A1 = O4()
    x3.I2foo(114.514000f64)
    x3.I1foo(114.514000f64)
    x3.I3foo(114.514000f64)
    x3.I4foo(114.514000f64)
    x3.I0foo(114.514000f64)
}
