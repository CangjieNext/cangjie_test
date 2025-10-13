// LEVEL: 0
// EXEC: %compiler --disable-inst %f -o %output || true
// ASSERT: scan disable instantiation, CHIR2 translation done.

interface Base1<T> {
    func base1(a: T): T
}

interface Base2<U> {
    func base2(a: U): Rune
}

struct A<T> <: Base1<T> & Base2<T> where T <: Int32 {
    var x: T = 1
    public func base1(a: T): T {
        return a
    }
    public func base2(a: T): Rune {
        var b = a
        return 'z'
    }
}

struct C<T> where T <: A<Int32> {
    func foo(c: T) {
        c.base1(c.x)
        c.base2(c.x)
    }
}

main() {
    var m = A<Int32>()
    var x = C<A<Int32>>()
    x.foo(m)
    return 0
}



// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
