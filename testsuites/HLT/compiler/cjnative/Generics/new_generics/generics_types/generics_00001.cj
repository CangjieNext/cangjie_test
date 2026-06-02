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
    mut prop p1: Int64 {
        get() {
            1
        }
        set(v) {
            v
        }
    }
    mut static prop p2: Int64 {
        get() {
            1
        }
        set(v) {
            v
        }
    }
    mut func f1() {
        1
    }
    static func f3() {
        1
    }
    static func f4<T>(v: T) {
        v
    }
}

struct S1 <: I1 {
    var v11 = 0
    static var v12 = 0
    public mut prop p1: Int64 {
        get() {
            v11
        }
        set(v) {
            v11 = v
        }
    }
    public mut static prop p2: Int64 {
        get() {
            v12
        }
        set(v) {
            v12 = v
        }
    }
    public mut func f1() {
        v11 = 0
        v11
    }
    public static func f3() {
        0
    }
    public static func f4<T>(v: T) {
        v
    }
}

struct S2<M> <: I1 {
    var v21 = 0
    static var v22 = 0
    public mut prop p1: Int64 {
        get() {
            v21
        }
        set(v) {
            v21 = v
        }
    }
    public mut static prop p2: Int64 {
        get() {
            v22
        }
        set(v) {
            v22 = v
        }
    }
    public mut func f1() {
        v21 = 0
        v21
    }
    public static func f3() {
        0
    }
    public static func f4<T>(v: T) {
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
    func test(x1: M, x2: (M) -> M, x3: C<M>): M {
        x1
    }
    static func static_test(x1: M, x2: (M) -> M, x3: C<M>): (M) -> M {
        x2
    }
    static func static_generic_test<K>(x1: M, x2: (M) -> M, x3: C<M>): C<M> {
        x3
    }
}

enum E<M> <: I<M> where M <: I1 {
    E01(M)

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
        v1.p1 = 1
        M.p2 = 1
        var v8 = v1.p1 + M.p2 + v1.f1() + M.f3() + M.f4<Int64>(0)
        if (v4 || !v6 || v7 != 0 || v8 != 2 || p2 != 0) {
            throw Exception()
        }
        v2
    }
    public static func static_generic_test<K>(x1: M, x2: (M) -> M, x3: C<M>, x4: K): C<M> {
        C<M>(static_test(x1, x2, x3)(x1))
    }
}

extend<M> E<M> {}

main() {
    var a = E01(S1())
    var b = E01(S2<Int64>())
    var v1 = a.test(S1(), {x: S1 => x}, C<S1>(S1()))
    var v2 = b.test(S2<Int64>(), {x: S2<Int64> => x}, C<S2<Int64>>(S2<Int64>()))
    if (v1 is S1 && v2 is S2<Int64>) {
        return 0
    }
    return 1
}
