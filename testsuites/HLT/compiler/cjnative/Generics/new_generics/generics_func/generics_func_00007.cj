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

func A1() {
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
        func inner_test2<N>(y1: M, y2: N): M {
            y2
            y1
        }
        inner_test2<M>(inner_test1(v2(v1)), inner_test1(v2(v1)))
    }

    func foo1(x: Int64) {
        return x
    }

    test1<(Int64) -> Int64>(foo1)
}

func A2() {
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
        func inner_test2<N>(y1: C<M>, y2: C<N>): C<M> {
            y2
            y1
        }
        inner_test2<M>(inner_test1(v2(v1)), inner_test1(v2(v1)))
    }

    func foo2<M>(y: M) {
        return y
    }

    test2<(Int64) -> Int64>(C<(Int64) -> Int64>(foo2<Int64>))
}

main() {
    var a = A1()
    var b = A2()
    if (a is (Int64) -> Int64 && b is C<(Int64) -> Int64>) {
        return 0
    }
    return 1
}
