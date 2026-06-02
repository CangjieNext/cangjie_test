/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package pkg1

public interface MyInterface1<T> {
    func foo1(a: T): T {
        a
    }
}

public interface MyInterface2<T> {
    func foo2(a: T): T {
        a
    }
}

public interface MyInterface3<T> {
    func foo3(a: T): T {
        a
    }
}

extend UInt64 <: MyInterface1<UIntNative> & MyInterface2<UIntNative> & MyInterface3<UIntNative> {}
