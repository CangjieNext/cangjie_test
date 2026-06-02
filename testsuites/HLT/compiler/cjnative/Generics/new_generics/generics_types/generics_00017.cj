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
            2
        }
    }
    static prop p2: Int64 {
        get() {
            2
        }
    }
    func f1() {
        2
    }
    static func f3() {
        2
    }
    static func f4<T>(v: T) {
        v
    }
}

extend Rune <: I1 {}

class C<M> {
    var a: M
    init(x: M) {
        a = x
    }
}

open class A1<M> where M <: I1 {
    public var v1: M
    public var v11: Int64 = 1
    public static var v12: Int64 = 1
    init(x: M) {
        v1 = x
    }
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
    public mut open prop p3: M {
        get() {
            v1
        }
        set(v) {
            v1 = v
        }
    }
    public open func test(x1: M, x2: (M) -> M, x3: C<M>): M {
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
        var v7 = v1.p1 + M.p2 + v1.f1() + M.f3() + M.f4<Int64>(0)
        if (v4 || !v6 || v7 != 1) {
            throw Exception()
        }
        v2
    }
    public static func static_generic_test<K>(x1: M, x2: (M) -> M, x3: C<M>, x4: K): C<M> {
        C<M>(static_test(x1, x2, x3)(x1))
    }
}

class A2 <: A1<I1> {
    public var v2: I1
    public var v21: Int64 = 0
    public static var v22: Int64 = 0
    init(x: I1) {
        super(x)
        v2 = x
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
    public mut prop p3: I1 {
        get() {
            v2
        }
        set(v) {
            v2 = v
        }
    }
    public override func test(x1: I1, x2: (I1) -> I1, x3: C<I1>): I1 {
        generic_test<Int64>(x1, x2, x3, 1)
    }
    public func generic_test<K>(x1: I1, x2: (I1) -> I1, x3: C<I1>, x4: K): I1 {
        static_generic_test<K>(x1, x2, x3, x4).a
    }
    public static redef func static_test(x1: I1, x2: (I1) -> I1, x3: C<I1>): (I1) -> I1 {
        var v1: I1 = x1
        var v2 = x2
        var v3 = x3
        var v4 = v1 is Option<I1>
        var v5 = v2 as Option<(I1) -> I1>
        var v6 = match (v3) {
            case _: Option<C<I1>> => false
            case _: C<I1> => true
        }
        var v7 = v1.p1 + I1.p2 + v1.f1() + I1.f3() + I1.f4<Int64>(0)
        if (v4 || !v6 || v7 != 8) {
            throw Exception()
        }
        v2
    }
    public static redef func static_generic_test<K>(x1: I1, x2: (I1) -> I1, x3: C<I1>, x4: K): C<I1> {
        C<I1>(static_test(x1, x2, x3)(x1))
    }
}

interface I3<T> {}

extend<M> A1<M> <: I3<M> {}

main() {
    var a = A2(r"a")
    var v1 = a.test(r"a", {x: I1 => x}, C<I1>(r"a"))
    a.p3 = r"a"
    var v2 = a.p3
    a.p1 = 2
    A2.p2 = 2
    var v3 = a.p1 + A2.p2
    if (v1 is I1 && v2 is I1 && v3 == 4) {
        return 0
    }
    return 1
}
