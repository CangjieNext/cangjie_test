/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// ERRCHECK: %compiler %cmp_opt %f -o %output

class A {}

interface faterInterface1<T> {
    func foo(a: Array<A>): Array<A> {
        a
    }
}

interface MyInterface1 <: faterInterface1<Rune> {}

interface faterInterface2<T> {
    func foo(a: Array<A>): A {
        a[0]
    }
}

interface MyInterface2<T> <: faterInterface2<T> {}

interface faterInterface3<T> {
    func foo(a: Array<A>): Array<A> {
        a
    }
}

interface MyInterface3 <: faterInterface3<Rune> {}

extend UInt16 <: MyInterface1 & MyInterface2<Bool> & MyInterface3 {
    public func foo(a: Array<A>): Array<A> {
        a
    }
}

main() {
    var u1: faterInterface1<Rune> = UInt16(1)
    var u2: MyInterface2<Bool> = UInt16(1)
    var u3: MyInterface3 = UInt16(1)
    var u4: UInt16 = 1

    if (u1.foo([A()])[0] is A && u2.foo([A()]) is A && u3.foo([A()])[0] is A /* && u4.foo([A()]) is A */ ) {
        return 0
    } else {
        return 1
    }
}
// ASSERT: scan sema_return_type_incompatible
