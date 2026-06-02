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

interface I1 {
    func f1(): Int64
}

interface I2<M> {
    func f2(x: M): Int64
}

class C1 <: I1 {
    public func f1(): Int64 {
        return 0
    }
}

class C2<M> <: I2<M> {
    public func f2(x: M): Int64 {
        return 1
    }
}

func f1() {
    test1<I1>
}

func f2() {
    test2<I2<Int64>>
}

main() {
    var a = f1()(C1())
    var b = f2()(C(C2<Int64>()))
    if (a is I1 && b is C<I2<Int64>>) {
        return 0
    }
    return 1
}
