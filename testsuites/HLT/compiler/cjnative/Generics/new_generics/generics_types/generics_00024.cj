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

class A2<M> <: A1 where M <: I1 {
    public var v1: M
    public var v21: Int64 = 1
    public static var v22: Int64 = 1
    init(x: M) {
        v1 = x
    }
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
        if (v4 || !v6 || v7 != 4) {
            throw Exception()
        }
        v2
    }
    public static func static_generic_test<K>(x1: M, x2: (M) -> M, x3: C<M>, x4: K): C<M> {
        C<M>(static_test(x1, x2, x3)(x1))
    }
}

interface I<M> {}

extend<M> A2<M> <: I<M> {}

extend<M> CPointer<M> <: I1 {}

type T2<M> = A2<CPointer<M>>

main() {
    var b = T2<Int64>(CPointer<Int64>())
    var v4 = b.test(CPointer<Int64>(), {x: CPointer<Int64> => x}, C<CPointer<Int64>>(CPointer<Int64>()))
    b.p3 = CPointer<Int64>()
    var v5 = b.p3
    b.p1 = 3
    T2<Int64>.p2 = 3
    var v6 = b.p1 + T2<Int64>.p2
    if (v4 is CPointer<Int64> && v5 is CPointer<Int64> && v6 == 6) {
        return 0
    }
    return 1
}
