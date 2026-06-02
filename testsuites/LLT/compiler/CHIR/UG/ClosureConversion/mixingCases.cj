// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %f -o %n.%suffix
// EXEC-45: %run %run_opt %n.%suffix

func f1(x: Int64): Int64 {
    1
}

func f2<T>(x: T): T {
    return x
}

func f3(x: Int64): (Int64) -> Int64 {
    let i = {
        ix: Int64 => x
    }
    return i
}

func f4<T>(x: T): (T) -> T {
    let i = {
        ix: T => x
    }
    return i
}

func f5<T>(x: T): (T) -> T {
    func inner<S>(ix: T): T {
        x
    }
    return inner<Int64>
}

class C<T> {
    func f6(x: Int64): Int64 {
        6
    }
}

class D<T> {
    func f7(x: T): T {
        x
    }
}

class E<T> {
    func f8<S>(x: S): S {
        x
    }
}

class F<T> {
    func f9<S>(x: S): (S) -> S {
        func inner<M>(ix: S): S {
            x
        }
        return inner<Int32>
    }
}

main(): Int64 {
    var res = 0
    var a: (Int64) -> Int64

    a = f1
    res += a(1)

    a = f2<Int64>
    res += a(2)

    a = f3(3)
    res += a(3)

    a = f4<Int64>(4)
    res += a(4)

    a = f5<Int64>(5)
    res += a(5)

    a = C<Int64>().f6
    res += a(6)

    a = D<Int64>().f7
    res += a(7)

    a = E<Int32>().f8<Int64>
    res += a(8)

    a = F<Int32>().f9<Int64>(9)
    res += a(9)

    res
}
