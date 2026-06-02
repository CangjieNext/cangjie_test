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
    init(x: M) {}
}

class A {
    func test1<M>(x: M): M {
        var v1: M = x
        var v2: (M) -> M = {x: M => x}
        var v3 = x is Option<M>
        var v4 = x as Option<M>
        var v5 = match (x) {
            case _: Option<M> => false
            case _: M => true
            case _ => false
        }
        if (v3 || !v5) {
            throw Exception()
        }
        func inner_test1(y: M): M {
            y
        }
        func inner_test2<N>(y: M): M {
            y
        }
        inner_test2<M>(inner_test1(v2(v1)))
    }

    func test2<M>(x: C<M>): C<M> {
        var v1: C<M> = x
        var v2: (C<M>) -> C<M> = {x: C<M> => x}
        var v3 = x is Option<C<M>>
        var v4 = x as Option<C<M>>
        var v5 = match (x) {
            case _: Option<C<M>> => false
            case _: C<M> => true
            case _ => false
        }
        if (v3 || !v5) {
            throw Exception()
        }
        func inner_test1(y: C<M>): C<M> {
            y
        }
        func inner_test2<N>(y: C<M>): C<M> {
            y
        }
        inner_test2<M>(inner_test1(v2(v1)))
    }
}

enum E1 {
    E11
}

enum E2<M> {
    E22(M)
}

func test1() {
    A().test1<E1>
}

func test2() {
    A().test2<E2<Int64>>
}

main() {
    var f1 = A().test1<E1>
    var f2 = A().test2<E2<Int64>>
    var a = f1(E11)
    var b = f2(C(E22(1)))
    var c = test1()(E11)
    var d = test2()(C(E22(1)))
    if (a is E1 && c is E1 && b is C<E2<Int64>> && d is C<E2<Int64>>) {
        return 0
    }
    return 1
}
