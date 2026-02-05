// LEVEL: 0
// EXEC-PIPE-1: %compiler %f -o %output 2>&1 | compare %f
// ASSERT: scan the upper bound 'Int64' of generic parameter 'Generics-U' must be class or interface
// ASSERT: scan the upper bound 'Int64' of generic parameter 'Generics-N' must be class or interface
// ASSERT: scan cannot convert an integer literal to type 'Generics-N'

var x: Int64 = 1
interface I {
    func goo(): Int64
}

class B <: I {
    public func goo() {
        return 1
    }
}

func foo<T, U>(a: U, b: T) where T <: I, U <: Int64 {
    var c = b
    x = c.goo() + a
}

class A<T, N> <: I where N <: Int64 {
    var b = 1
    public func goo() {
        var c: N = 2
        return c
    }
}

main() {
    var m = B()
    foo<B, Int64>(10, m) // x = 11
    x += A<Int8, Int64>().goo() + A<B, Int64>().b // x = 13
    return x - 13
}

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
