/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package pkg1

public enum enum1 {
    A
}

public interface fatherInterface<T> {
    static func foo1(): Int8
    static func foo2<T>(a: T): T {
        foo1();
        a
    }
}

public interface MyInterface<T> <: fatherInterface<T> {
    static func foo2(a: enum1): Int8 {
        foo1() + foo1()
    }
}

public enum enum2 {
    B(enum1)
}

extend enum2 <: MyInterface<enum1> {
    public static func foo1(): Int8 {
        1
    }
}

public var en1: enum1 = enum2.foo2(enum1.A)
public var e1: Int64 = match (en1) {
    case A => 1
}

public func call(): Int64 {
    if (e1 == 1) {
        return 0
    } else {
        return 1
    }
}
