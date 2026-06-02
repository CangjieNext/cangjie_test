/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package pkg1

public interface faterInterface<T> {
    mut func foo1(): T
    mut func foo2(): ?T {
        return Some(foo1())
    }
    mut func foo4(): T
}

public interface MyInterface<T> <: faterInterface<T> {
    mut func foo3(): T {
        foo1()
    }
}

public struct myStruct<T> {
    public var x: Int64 = 1
    mut func f(): Int64 {
        x = 10
        return x
    }
}

extend<T> myStruct<T> <: MyInterface<Int64> {
    public mut func foo1(): Int64 {
        f()
    }
    public mut func foo4(): Int64 {
        x
    }
}
