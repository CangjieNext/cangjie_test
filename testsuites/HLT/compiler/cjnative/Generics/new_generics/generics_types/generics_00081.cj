/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan sema_cannot_instantiated_by_incomplete_type

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

extend Nothing <: I1 {}

class C<M> {
    var a: M
    init(x: M) {
        a = x
    }
}

interface A1<M> where M <: I1 {
    public mut prop p1: Int64 {
        get() {
            1
        }
        set(v) {
            v
        }
    }
    public mut static prop p2: Int64 {
        get() {
            1
        }
        set(v) {
            v
        }
    }
    public func test(x1: M, x2: (M) -> M, x3: C<M>): M {
        p1 = 0
        if (p1 != 0) {
            throw Exception()
        }
        static_generic_test<Int64>(x1, x2, x3, 1).a
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
        v1.p1 = 0
        M.p2 = 0
        var v7 = v1.p1 + M.p2 + v1.f1() + M.f3() + M.f4<Int64>(0)
        p2 = 0
        if (v4 || !v6 || v7 != 4 || p2 != 0) {
            throw Exception()
        }
        v2
    }
    public static func static_generic_test<K>(x1: M, x2: (M) -> M, x3: C<M>, x4: K): C<M> {
        C<M>(static_test(x1, x2, x3)(x1))
    }
}

class A2<M> {}

extend<M> A2<M> <: A1<M> where M <: I1 {}

main() {
    var a = A2<Nothing>()
    return 0
}
