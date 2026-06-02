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

struct S1 {}

struct S2<M> {}

interface I<M> {
    public prop p1: Int64 {
        get() {
            0
        }
    }
    public static prop p2: Int64 {
        get() {
            0
        }
    }
}

extend<M> Option<M> <: I<M> {
    public func test(x1: M, x2: (M) -> M, x3: C<M>): M {
        if (p1 != 0) {
            throw Exception()
        }
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
        if (v4 || !v6 || p2 != 0) {
            throw Exception()
        }
        v2
    }
    public static func static_generic_test<K>(x1: M, x2: (M) -> M, x3: C<M>, x4: K): C<M> {
        C<M>(static_test(x1, x2, x3)(x1))
    }
}

main() {
    var a = Some(S1()).test(S1(), {x: S1 => x}, C<S1>(S1()))
    var b = Some(S2<Int64>()).test(S2<Int64>(), {x: S2<Int64> => x}, C<S2<Int64>>(S2<Int64>()))
    if (a is S1 && b is S2<Int64>) {
        return 0
    }
    return 1
}
