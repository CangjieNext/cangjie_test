/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package test2

open class Father<M> {}

class Child<M> <: Father<Int64> {}

open class C1<T> {
    public open func f(): Unit {}
    public open func f1(): Father<Int64> {
        Father()
    }
    public open func f2<T>(a: T): T {
        return a
    }
    public open func f3<T>(a: T): T where T <: I<Int64> {
        return a
    }
}

interface I<T> {}

class C3<T> <: I<Int64> {}

class C2<T> <: C1<T> & I<Int64> {
    public override func f(): Unit {}
    public override func f1(): Child<Int64> {
        Child<Int64>()
    }
    public override func f2<U>(b: U): U {
        return b
    }
    public override func f3<U>(x: U): U where U <: I<Int64> {
        return x
    }
}

main() {
    var r1 = C2<Int64>().f() //expr C2<Int64>()
    var r2 = C2<Float64>().f1()
    var r3 = C2<Bool>().f2<Int64>(2)
    var r4 = C2<UInt32>()
    var r5 = r4.f3<C3<Int64>>(C3()) //expr r4.f3<C3<Int64>>(C3())
    0
}
