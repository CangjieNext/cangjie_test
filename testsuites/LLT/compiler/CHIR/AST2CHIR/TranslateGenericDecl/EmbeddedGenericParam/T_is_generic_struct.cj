// LEVEL: 0
// EXEC-PIPE-1: %compiler %f -o %output 2>&1 | compare %f
// ASSERT: scan the upper bound 'Int32' of generic parameter 'Generics-T' must be class or interface
// ASSERT: scan the upper bound 'Struct-A<Int32>' of generic parameter 'Generics-T' must be class or interface
// ASSERT: scan cannot convert an integer literal to type 'Generics-T'
// ASSERT: scan mismatched types
// ASSERT: scan expected 'Rune', found 'Struct-String'

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
