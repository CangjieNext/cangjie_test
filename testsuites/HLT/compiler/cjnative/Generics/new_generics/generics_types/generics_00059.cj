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
}

class A2 <: A1<S1> {
    init(x: S1) {
        super(x)
    }
}

interface I<M> {}

extend<M> A1<M> <: I<M> {
    public mut prop p3: M {
        get() {
            v1
        }
        set(v) {
            v1 = v
        }
    }
    public func test(x1: M, x2: (M) -> M, x3: C<M>): M {
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
        if (v4 || !v6) {
            throw Exception()
        }
        v2
    }
    public static func static_generic_test<K>(x1: M, x2: (M) -> M, x3: C<M>, x4: K): C<M> {
        C<M>(static_test(x1, x2, x3)(x1))
    }
}

struct S1 {}

struct S2<M> {}

main() {
    var a = A1<S1>(S1())
    var v1 = a.test(S1(), {x: S1 => x}, C<S1>(S1()))
    a.p3 = S1()
    var v2 = a.p3
    a.p1 = 2
    A1<S1>.p2 = 2
    var v3 = a.p1 + A1<S1>.p2
    var b = A1<S2<Int64>>(S2<Int64>())
    var v4 = b.test(S2<Int64>(), {x: S2<Int64> => x}, C<S2<Int64>>(S2<Int64>()))
    b.p3 = S2<Int64>()
    var v5 = a.p3
    b.p1 = 2
    A1<S2<Int64>>.p2 = 2
    var v6 = b.p1 + A1<S2<Int64>>.p2
    if (v1 is S1 && v2 is S1 && v3 == 4 && v4 is S2<Int64> && v4 is S2<Int64> && v6 == 4) {
        return 0
    }
    return 1
}
