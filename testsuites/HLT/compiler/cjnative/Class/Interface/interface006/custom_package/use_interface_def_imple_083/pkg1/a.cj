/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package pkg1

public interface faterInterface1<T> {
    static func foo1(): T
    static func foo2<K>(a!: K): T {
        foo1()
    }
}

public interface MyInterface1<T> <: faterInterface1<T> {
    static func foo2(a!: T): T {
        foo1()
    }
}

public interface faterInterface2<T> {
    static func foo3(): T
    static func foo4<K>(a!: K): T {
        foo3()
    }
}

public interface MyInterface2<T> <: faterInterface2<T> {
    static func foo4(a!: T): T {
        foo3()
    }
}

public interface faterInterface3<T> {
    static func foo5(): T
    static func foo6<K>(a!: K): T {
        foo5()
    }
}

public interface MyInterface3<T> <: faterInterface3<T> {
    static func foo6(a!: T): T {
        foo5()
    }
}

extend String <: MyInterface1<Bool> & MyInterface2<Bool> & MyInterface3<Bool> {
    public static func foo(): Bool {
        true
    }
    public static func foo1(): Bool {
        foo3()
    }
    public static func foo3(): Bool {
        foo5()
    }
    public static func foo5(): Bool {
        foo()
    }
}
