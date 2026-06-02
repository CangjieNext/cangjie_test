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

class A2<M> {
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
    mut static prop p2: Int64 {
        get() {
            v22
        }
        set(v) {
            v22 = v
        }
    }
}

interface I<M> {
    func test(x1: M, x2: (M) -> M, x3: C<M>): M {
        static_generic_test<Int64>(x1, x2, x3, 1).a
    }
    static func static_test(x1: M, x2: (M) -> M, x3: C<M>): (M) -> M {
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
    static func static_generic_test<K>(x1: M, x2: (M) -> M, x3: C<M>, x4: K): C<M> {
        C<M>(static_test(x1, x2, x3)(x1))
    }
}

extend<M> A2<M> <: I<M> {
    public mut prop p3: M {
        get() {
            v1
        }
        set(v) {
            v1 = v
        }
    }
}

type T1 = A2<(Int64) -> Int64>

type T2<M> = A2<(M) -> Int64>

func foo1(x: Int64) {
    return x
}

func foo2<M>(y: M) {
    return y
}

main() {
    var a = T1(foo1)
    var b = T2<Int64>(foo2<Int64>)
    var v1 = a.test(foo1, {x: (Int64) -> Int64 => x}, C<(Int64) -> Int64>(foo1))
    a.p3 = foo1
    var v2 = a.p3
    a.p1 = 2
    T1.p2 = 2
    var v3 = a.p1 + T1.p2
    var v4 = b.test(foo2<Int64>, {x: (Int64) -> Int64 => x}, C<(Int64) -> Int64>(foo2<Int64>))
    b.p3 = foo2<Int64>
    var v5 = b.p3
    b.p1 = 3
    T2<Int64>.p2 = 3
    var v6 = b.p1 + T2<Int64>.p2
    if (v1 is (Int64) -> Int64 && v2 is (Int64) -> Int64 && v3 == 4 && v4 is (Int64) -> Int64 && v5 is (Int64) -> Int64 &&
        v6 == 6) {
        return 0
    }
    return 1
}
