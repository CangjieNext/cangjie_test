/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

interface I1 {
    prop p1: Int64 {
        get() {
            1
        }
    }
    static prop p2: Int64 {
        get() {
            1
        }
    }
    func f1() {
        1
    }
    static func f3() {
        1
    }
    static func f4<T>(v: T) {
        v
    }
}

open class C1 {
    var v11 = 1
    public static var v12: Int64 = 1
    public open prop p1: Int64 {
        get() {
            v11
        }
    }
    public static prop p2: Int64 {
        get() {
            v12
        }
    }
    public open func f1() {
        1
    }
    public func f2<T>(v: T) {
        v
    }
    public static func f3() {
        1
    }
    public static func f4<T>(v: T) {
        v
    }
}

open class C2 <: C1 {
    var v21 = 0
    public static var v22: Int64 = 1
    public override prop p1: Int64 {
        get() {
            v21
        }
    }
    public static redef prop p2: Int64 {
        get() {
            v22
        }
    }
    public override func f1() {
        0
    }
    public static redef func f3() {
        0
    }
    public static redef func f4<T>(v: T) {
        v
    }
}

class C3<M> <: C2 {}

class C<M> {
    var a: M
    init(x: M) {
        a = x
    }
}

enum E<M, K> <: I1 where M <: C1 {
    E01(M, K)

    public prop p1: Int64 {
        get() {
            0
        }
    }
    public static prop p2: Int64 {
        get() {
            0
        }
    }
    public func test(x1: M, x2: (M) -> M, x3: C<M>): M {
        generic_test<Int64>(x1, x2, x3, 1)
    }
    public func generic_test<K>(x1: M, x2: (M) -> M, x3: C<M>, x4: K): M {
        static_generic_test<K>(x1, x2, x3, x4).a
    }
    public static func static_test(x1: M, x2: (M) -> M, x3: C<M>): (M) -> M {
        var v1: M = x1
        var v2 = x2
        var v3 = x3
        var v4 = v1 is Option<M>
        var v5 = v2 as Option<(M) -> M>
        var v6 = match (v3) {
            case _: Option<C<M>> => false
            case _: C<M> => true
        }
        if (v4 || !v6) {
            throw Exception()
        }
        v2
    }
    public static func static_generic_test<K>(x1: M, x2: (M) -> M, x3: C<M>, x4: K): C<M> {
        C<M>(static_test(x1, x2, x3)(x1))
    }
}

interface I2<M> {}

extend<M> E<M, Int64> <: I2<M> {}

main() {
    var a = E01(C2(), 1)
    var v1 = a.test(C2(), {x: C2 => x}, C<C2>(C2()))
    var v3 = a.p1 + C2.p2
    print(v3)

    var b = E01(C3<Int64>(), 1)
    var v2 = b.test(C3<Int64>(), {x: C3<Int64> => x}, C<C3<Int64>>(C3<Int64>()))
    var v4 = b.p1 + C3<Int64>.p2

    if (v1 is C2 && v2 is C3<Int64> && v3 == 1 && v4 == 1) {
        return 0
    }
    return 1
}
