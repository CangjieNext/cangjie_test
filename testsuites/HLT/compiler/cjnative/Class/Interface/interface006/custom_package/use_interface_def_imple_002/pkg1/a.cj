/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package pkg1

public interface faterInterface<T> {
    static func foo1(): T
    static func foo2<T>(a: T): T {
        a
    }
}

public interface MyInterface <: faterInterface<Int16> {}

public enum enum1 <: MyInterface {
    A(Int16)

    public static func foo1(): Int16 {
        1
    }
}

public enum enum2 <: MyInterface {
    A(Int16)

    public static func foo1(): Int16 {
        2
    }
}

public enum enum3 <: MyInterface {
    A(Int16)

    public static func foo1(): Int16 {
        3
    }
}
