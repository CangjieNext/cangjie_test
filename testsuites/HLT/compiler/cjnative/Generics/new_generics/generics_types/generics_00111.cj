/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0 EXCLUDE
// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan sema_cannot_instantiated_by_incomplete_type

open class C1 {
    var v11 = 1
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

class C2 <: C1 {
    var v21 = 0
    public static var v22: Int64 = 0
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

class C<M> {
    var a: M
    init(x: M) {
        a = x
    }
}

open class A1<M> where M <: C1 {
    public var v21: Int64 = 1
    public static var v22: Int64 = 1
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
        v1.p1 = 2
        M.p2 = 2
        var v7 = v1.p1 + M.p2 + v1.f1() + v1.f2<Int64>(0) + M.f3() + M.f4<Int64>(0)
        if (v4 || !v6 || v7 != 4) {
            throw Exception()
        }
        v2
    }
    public static func static_generic_test<K>(x1: M, x2: (M) -> M, x3: C<M>, x4: K): C<M> {
        C<M>(static_test(x1, x2, x3)(x1))
    }
}

interface I {}

extend<M> A1<M> <: I {}

class A2 <: A1<C2> {}

main() {
    var a = A1<Nothing>()
    a.p1 = 2
    A1<Nothing>.p2 = 2
    if (a.p1 != 2 || A1<Nothing>.p2 != 2) {
        return 1
    }
    a.test(return 0, {x: Nothing => x}, C<Nothing>(return 2))
    return 3
}
