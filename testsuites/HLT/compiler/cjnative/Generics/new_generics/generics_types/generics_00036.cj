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

class C<M> {
    var a: M
    init(x: M) {
        a = x
    }
}

interface I<M> {
    mut prop p1: Int64 {
        get() {
            0
        }
        set(p) {
            p
        }
    }
    mut static prop p2: Int64 {
        get() {
            0
        }
        set(p) {
            p
        }
    }
    public func f1() {
        0
    }
    public static func f3() {
        0
    }
    public static func f4<T>(v: T) {
        v
    }
}

struct S2<M, K> <: I<M> where M <: I1 {
    public func test(x1: M, x2: (M) -> M, x3: C<M>): M {
        if (p1 != 0) {
            throw Exception()
        }
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
        var v7 = v1.p1 + M.p2 + v1.f1() + M.f3() + M.f4<Int64>(0)
        if (v4 || !v6 || v7 != 4 || p2 != 0) {
            throw Exception()
        }
        v2
    }
    public static func static_generic_test<K>(x1: M, x2: (M) -> M, x3: C<M>, x4: K): C<M> {
        C<M>(static_test(x1, x2, x3)(x1))
    }
}

interface I3 {}

extend<M, K> S2<M, K> <: I3 {}

class C2 <: I1 {}

class C3<M> <: I1 {}

type T1 = S2<C2, Int64>

type T2<M, K> = S2<M, K>

main() {
    var a = T1()
    var v1 = a.test(C2(), {x: C2 => x}, C<C2>(C2()))
    a.p1 = 2
    T1.p2 = 2
    var v3 = a.p1 + T1.p2

    var b = T2<C3<Int64>, Int64>()
    var v4 = b.test(C3<Int64>(), {x: C3<Int64> => x}, C<C3<Int64>>(C3<Int64>()))
    b.p1 = 3
    T2<C3<Int64>, Int64>.p2 = 3
    var v6 = b.p1 + T2<C3<Int64>, Int64>.p2
    if (v1 is C2 && v3 == 0 && v4 is C3<Int64> && v6 == 0) {
        return 0
    }
    return 1
}
