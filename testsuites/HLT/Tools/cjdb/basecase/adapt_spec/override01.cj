/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

open class Father {}

class Child <: Father {}

open class C1 {
    public open func f(): Unit {}
    public open func f1(): Father {
        Father()
    }
    public open func f2<T>(a: T): T {
        return a
    }
    public open func f3<T>(a: T): T where T <: I1 & I2 {
        return a
    }
}

interface I {}

interface I1 {}

interface I2 {}

class C3 <: I1 & I2 {}

class C2 <: C1 & I {
    public override func f(): Unit {}
    public override func f1(): Child {
        Child()
    }
    public override func f2<U>(b: U): U {
        return b
    }
    public override func f3<U>(x: U): U where U <: I1 & I2 {
        return x
    }
}

main() {
    var r1 = C2().f()
    var r2 = C2().f1()
    var r3 = C2().f2<Int64>(2)
    var r4 = C2()
    var r5 = r4.f3<C3>(C3())
    0
}
