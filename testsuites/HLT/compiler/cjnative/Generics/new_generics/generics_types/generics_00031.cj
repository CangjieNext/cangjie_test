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

class C<M> {
    var a: M
    init(x: M) {
        a = x
    }
}

open class A1<M> {
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

class A2<M, K> <: A1<M> {
    public var v1: M
    public var v21: Int64 = 1
    public static var v22: Int64 = 1
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
}

interface I<M> {}

extend<M> A2<M, Int64> <: I<M> {
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
        if (v4 || !v6) {
            throw Exception()
        }
        v2
    }
    public static func static_generic_test<K>(x1: M, x2: (M) -> M, x3: C<M>, x4: K): C<M> {
        C<M>(static_test(x1, x2, x3)(x1))
    }
}

type T1 = A2<Unit, Int64>

type T2<M, K> = A2<M, Int64>

main() {
    var a = T1(())
    var b = T2<Unit, Int64>(())
    var v1 = a.test((), {x: Unit => x}, C<Unit>(()))
    a.p3 = ()
    var v2 = a.p3
    a.p1 = 2
    T1.p2 = 2
    var v3 = a.p1 + T1.p2
    var v4 = b.test((), {x: Unit => x}, C<Unit>(()))
    b.p3 = ()
    var v5 = b.p3
    b.p1 = 3
    T2<Unit, Int64>.p2 = 3
    var v6 = b.p1 + T2<Unit, Int64>.p2
    if (v1 is Unit && v2 is Unit && v3 == 4 && v4 is Unit && v5 is Unit && v6 == 6) {
        return 0
    }
    return 1
}
