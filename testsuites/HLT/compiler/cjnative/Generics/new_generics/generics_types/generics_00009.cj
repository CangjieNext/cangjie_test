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

interface I1 {}

open class C1 <: I1 {
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

open class C2 <: C1 & I1 {
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

class C3<M> <: C2 {}

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

open class A2<M> <: A1 where M <: C1 & I1 {
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

class A3<M, K> <: A2<M> where M <: C1 & I1 {
    init(x: M) {
        super(x)
    }
}

interface I<M> {}

extend<M> A3<M, Int64> <: I<M> {}

type T1 = A3<C2, Int64>

type T2<M, K> = A3<M, K>

main() {
    var a = T1(C2())
    var b = T2<C3<Int64>, Int64>(C3<Int64>())
    var v1 = a.test(C2(), {x: C2 => x}, C<C2>(C2()))
    a.p3 = C2()
    var v2 = a.p3
    a.p1 = 2
    T1.p2 = 2
    var v3 = a.p1 + T1.p2
    var v4 = b.test(C3<Int64>(), {x: C3<Int64> => x}, C<C3<Int64>>(C3<Int64>()))
    b.p3 = C3<Int64>()
    var v5 = b.p3
    b.p1 = 3
    T2<C3<Int64>, Int64>.p2 = 3
    var v6 = b.p1 + T2<C3<Int64>, Int64>.p2
    if (v1 is C2 && v2 is C2 && v3 == 4 && v4 is C3<Int64> && v5 is C3<Int64> && v6 == 6) {
        return 0
    }
    return 1
}
