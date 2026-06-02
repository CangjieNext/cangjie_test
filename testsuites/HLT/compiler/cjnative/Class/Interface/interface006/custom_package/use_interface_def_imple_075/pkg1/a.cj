/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package pkg1

public class A {}

public interface faterInterface1<T> {
    func foo(a: Array<A>): Array<A> {
        a
    }
}

public interface MyInterface1 <: faterInterface1<Rune> {}

public interface faterInterface2<T> {
    func foo(a: Array<A>): A {
        a[0]
    }
}

public interface MyInterface2<T> <: faterInterface2<T> {}

public interface faterInterface3<T> {
    func foo(a: Array<A>): Array<A> {
        a
    }
}

public interface MyInterface3 <: faterInterface3<Rune> {}

extend UInt16 <: MyInterface1 & MyInterface2<Bool> & MyInterface3 {}
