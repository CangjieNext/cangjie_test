/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package pkg1

public interface fatherInterface1<T> {
    func foo1(): Float32
    func foo2(a!: Float32): Float32 {
        foo1() + a
    }
}

public interface MyInterface1<T> <: fatherInterface1<T> {
    func foo2(a!: Float32): Float32 {
        foo1() + foo1()
    }
}

public interface fatherInterface2<T> {
    func foo3(): Float32
    func foo4(): Float32 {
        foo3()
    }
}

public interface MyInterface2<T> <: fatherInterface2<T> {
    func foo4(): Float32 {
        foo3() + foo3()
    }
}

public interface fatherInterface3<T> {
    func foo5(): Float32
    func foo6(): Float32 {
        foo5()
    }
}

public interface MyInterface3<T> <: fatherInterface3<T> {
    func foo6(): Float32 {
        foo5() + foo5()
    }
}

extend Float16 <: MyInterface1<Int32> & MyInterface2<Int32> & MyInterface3<Int32> {
    public func foo1(): Float32 {
        foo3()
    }
    public func foo3(): Float32 {
        foo5()
    }
    public func foo5(): Float32 {
        1.0
    }
}

public func call(): Int64 {
    var f1: fatherInterface1<Int32> = Float16(1.0)
    var f2: MyInterface2<Int32> = Float16(1.0)
    var f3: MyInterface3<Int32> = Float16(1.0)
    var f4: Float16 = Float16(1.0)
    if (f1.foo2(a: 10.0) == 2.0 && f2.foo4() == 2.0 && f3.foo6() == 2.0 && f4.foo2(a: 10.0) == 2.0 && f4.foo4() == 2.0 &&
        f4.foo6() == 2.0) {
        return 0
    }
    print(f1.foo2(a: 10.0).toString())
    print(f2.foo4().toString())
    print(f3.foo6().toString())
    print(f4.foo2(a: 10.0).toString())
    print(f4.foo4().toString())
    print(f4.foo6().toString())
    return 1
}
