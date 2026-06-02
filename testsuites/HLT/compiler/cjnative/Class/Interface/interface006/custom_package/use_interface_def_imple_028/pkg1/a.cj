/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package pkg1

public open class A {}

public class B <: A {}

public interface fatherInterface1<T> {
    func foo1(): Int64
    func foo2(a!: Array<A>): A {
        a[foo1()]
    }
}

public interface MyInterface1<T> <: fatherInterface1<T> {
    func foo3(): A {
        A()
    }
}

public interface fatherInterface2<T> {
    func foo4(): Int64
    func foo5(a!: Array<A>): A {
        a[foo4()]
    }
}

public interface MyInterface2<T> <: fatherInterface2<T> {
    func foo6(): A {
        B()
    }
}

public interface fatherInterface3<T> {
    func foo7(): Int64
    func foo8(a!: Array<A>): A {
        a[foo7()]
    }
}

public interface MyInterface3<T> <: fatherInterface3<T> {
    func foo9(): A {
        A()
    }
}
