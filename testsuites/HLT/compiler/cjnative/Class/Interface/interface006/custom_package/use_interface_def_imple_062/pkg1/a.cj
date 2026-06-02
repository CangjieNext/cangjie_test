/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package pkg1

public struct A {}

public interface fatherInterface<T> {
    mut func foo1(): Int64
    mut func foo3(): Int64
    mut func foo2(a!: A): A {
        foo1();
        a
    }
}

public interface MyInterface <: fatherInterface<A> {}

public struct myStruct<T> {
    public var x: Int64 = 10
    mut func f() {
        x = 20
        return x
    }
}

extend<T> myStruct<T> <: MyInterface {
    public mut func foo1(): Int64 {
        f()
    }
    public mut func foo3(): Int64 {
        x
    }
}
