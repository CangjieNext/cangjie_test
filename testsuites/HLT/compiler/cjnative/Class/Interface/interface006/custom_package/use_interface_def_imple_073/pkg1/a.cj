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
    static func foo3(): T {
        foo1()
    }
}

public interface faterInterface2<T> {
    static func foo4(): T
    static func foo5<K>(a!: K): T {
        foo4()
    }
}

public interface MyInterface2<T> <: faterInterface2<T> {
    static func foo6(): T {
        foo4()
    }
}

public interface faterInterface3<T> {
    static func foo7(): T
    static func foo8<K>(a!: K): T {
        foo7()
    }
}

public interface MyInterface3<T> <: faterInterface3<T> {
    static func foo9(): T {
        foo7()
    }
}

extend IntNative <: MyInterface1<UInt8> & MyInterface2<UInt16> & MyInterface3<UInt32> {
    public static func foo1(): UInt8 {
        1
    }
    public static func foo4(): UInt16 {
        2
    }
    public static func foo7(): UInt32 {
        3
    }
}

public func call(): Int64 {
    if (IntNative.foo2<UInt8>(a: 10) == 1 && IntNative.foo3() == 1 && IntNative.foo5<UInt16>(a: 10) == 2 &&
        IntNative.foo6() == 2 && IntNative.foo8<UInt32>(a: 10) == 3 && IntNative.foo9() == 3) {
        return 0
    } else {
        return 1
    }
}
