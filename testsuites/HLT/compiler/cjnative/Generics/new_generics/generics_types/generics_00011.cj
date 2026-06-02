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
            0
        }
    }
    static prop p2: Int64 {
        get() {
            0
        }
    }
    func f1() {
        0
    }
    static func f3() {
        0
    }
    static func f4<T>(v: T) {
        v
    }
}

class C1 <: I1 {}

class C<M> {
    var a: M
    init(x: M) {
        a = x
    }
}

open class A1<M> where M <: I1 {
    public var v1: M
    init(x: M) {
        v1 = x
    }
}

class A2 <: A1<C1> {
    init(x: C1) {
        super(x)
    }
}

extend<M> A1<M> where M <: I1 {
    public prop p1: Int64 {
        get() {
            1
        }
    }
    public static prop p2: Int64 {
        get() {
            1
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
        if (v4 || !v6 || v7 != 0) {
            throw Exception()
        }
        v2
    }
    public static func static_generic_test<K>(x1: M, x2: (M) -> M, x3: C<M>, x4: K): C<M> {
        C<M>(static_test(x1, x2, x3)(x1))
    }
}

type T2 = A2

main() {
    var a = T2(C1())
    var v1 = a.test(C1(), {x: C1 => x}, C<C1>(C1()))
    var v3 = a.p1 + T2.p2
    if (v1 is C1 && v3 == 2) {
        return 0
    }
    return 1
}
