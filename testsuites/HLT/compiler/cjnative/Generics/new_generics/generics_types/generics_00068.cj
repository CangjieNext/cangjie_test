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

class C1 <: I1 {
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
    public func f1() {
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

class C2<M> <: I1 {
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
    public func f1() {
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

open class A1 {
    public var v11: Int64 = 1
    public static var v12: Int64 = 1
    public mut open prop p1: Int64 {
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
}

class A2<M> <: A1 where M <: I1 {
    public var v1: M
    public var v21: Int64 = 0
    public static var v22: Int64 = 0
    init(x: M) {
        v1 = x
    }
    public mut override prop p1: Int64 {
        get() {
            v21
        }
        set(v) {
            v21 = v
        }
    }
    public mut static redef prop p2: Int64 {
        get() {
            v22
        }
        set(v) {
            v22 = v
        }
    }
    public mut prop p3: M {
        get() {
            v1
        }
        set(v) {
            v1 = v
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
        var v7 = v1.p1 + M.p2 + v1.f1() + M.f3() + M.f4<Int64>(0)
        v1.p1 = 1
        M.p2 = 1
        var v8 = v1.p1 + M.p2 + v1.f1() + M.f3() + M.f4<Int64>(0)
        if (v4 || !v6 || v7 != 0 || v8 != 2) {
            throw Exception()
        }
        v2
    }
    public static func static_generic_test<K>(x1: M, x2: (M) -> M, x3: C<M>, x4: K): C<M> {
        C<M>(static_test(x1, x2, x3)(x1))
    }
}

type T1 = A2<C1>

type T2<M> = A2<C2<M>>

main() {
    var a = T1(C1())
    var b = T2<Int64>(C2<Int64>())
    var v1 = a.test(C1(), {x: C1 => x}, C<C1>(C1()))
    a.p3 = C1()
    var v2 = a.p3
    a.p1 = 2
    T1.p2 = 2
    var v3 = a.p1 + T1.p2
    var v4 = b.test(C2<Int64>(), {x: C2<Int64> => x}, C<C2<Int64>>(C2<Int64>()))
    b.p3 = C2<Int64>()
    var v5 = b.p3
    b.p1 = 3
    T2<Int64>.p2 = 3
    var v6 = b.p1 + T2<Int64>.p2
    if (v1 is C1 && v2 is C1 && v3 == 4 && v4 is C2<Int64> && v5 is C2<Int64> && v6 == 6) {
        return 0
    }
    return 1
}
