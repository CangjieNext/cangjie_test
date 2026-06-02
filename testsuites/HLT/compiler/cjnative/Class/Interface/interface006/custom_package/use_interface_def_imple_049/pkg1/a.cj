/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package pkg1

public interface fatherInterface1<T> {
    static func foo1(): Int8
    static func b1(): Int8 {
        foo1()
    }
}

public interface MyInterface1<T> <: fatherInterface1<T> {
    static func b1(): Int8 {
        foo1() + foo1()
    }
}

public interface fatherInterface2<T> {
    static func foo2(): Int8
    static func b2(): Int8 {
        foo2()
    }
}

public interface MyInterface2<T> <: fatherInterface2<T> {
    static func b2(): Int8 {
        foo2() + foo2()
    }
}

public interface fatherInterface3<T> {
    static func foo3(): Int8
    static func b3(): Int8 {
        foo3()
    }
}

public interface MyInterface3<T> <: fatherInterface3<T> {
    static func b3(): Int8 {
        foo3() + foo3()
    }
}

public struct myStruct<T> <: MyInterface1<Float16> & MyInterface2<Float16> & MyInterface3<Float16> {
    public static func foo1(): Int8 {
        1
    }
    public static func foo2(): Int8 {
        2
    }
    public static func foo3(): Int8 {
        3
    }
}

public func call() {
    if (myStruct<MyInterface3<Float16>>.b1() == 2 && myStruct<MyInterface3<Float16>>.b2() == 4 &&
        myStruct<MyInterface3<Float16>>.b3() == 6) {
        return 0
    } else {
        return 1
    }
}
