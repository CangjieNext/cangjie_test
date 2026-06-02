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

interface I {}

extend<M> Option<M> <: I {
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
    func test(x1: M, x2: (M) -> M, x3: C<M>): M {
        if (p1 != 1) {
            throw Exception()
        }
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
        if (v4 || !v6 || p2 != 1) {
            throw Exception()
        }
        v2
    }
    static func static_generic_test<K>(x1: M, x2: (M) -> M, x3: C<M>, x4: K): C<M> {
        C<M>(static_test(x1, x2, x3)(x1))
    }
}

class C1<M> {}

type T1 = C1<Int64>

type T2<M> = C1<M>

main() {
    var a = Some(C1<Int64>()).test(C1<Int64>(), {x: T1 => x}, C<T1>(C1<Int64>()))
    var b = Some(C1<Int64>()).test(C1<Int64>(), {x: T2<Int64> => x}, C<T2<Int64>>(C1<Int64>()))
    if (a is T1 && b is T2<Int64>) {
        return 0
    }
    return 1
}
