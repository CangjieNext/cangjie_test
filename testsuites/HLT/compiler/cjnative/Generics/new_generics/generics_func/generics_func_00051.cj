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
    static func f2() {
        1
    }
    static func f3<T>(v: T) {
        v
    }
}

struct C1 <: I1 {
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
    public func f1() {
        0
    }
    public static func f2() {
        0
    }
    public static func f3<T>(v: T) {
        v
    }
}

struct C2<M> <: I1 {
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
    public func f1() {
        0
    }
    public static func f2() {
        0
    }
    public static func f3<T>(v: T) {
        v
    }
}

class C<M> {
    var a: M
    init(x: M) {
        a = x
    }
}

class A {
    static func test1<M>(x: M): M where M <: I1 {
        var v1: M = x
        var v2: (M) -> M = {x: M => x}
        var v3 = x is Option<M>
        var v4 = x as Option<M>
        var v5 = match (x) {
            case _: Option<M> => false
            case _: M => true
            case _ => false
        }
        var v6 = v1.p1 + M.p2 + v1.f1() + M.f2() + M.f3<Int64>(0)
        if (v3 || !v5 || v6 != 0) {
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

    static func test2<M>(x: C<M>): C<M> where M <: I1 {
        var v1: C<M> = x
        var v2: (C<M>) -> C<M> = {x: C<M> => x}
        var v3 = x is Option<C<M>>
        var v4 = x as Option<C<M>>
        var v5 = match (x) {
            case _: Option<C<M>> => false
            case _: C<M> => true
            case _ => false
        }
        var v6 = v1.a.p1 + M.p2 + v1.a.f1() + M.f2() + M.f3<Int64>(0)
        if (v3 || !v5 || v6 != 0) {
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
}

func f1() {
    A.test1<C1>
}

func f2() {
    A.test2<C2<Int64>>
}

main() {
    var a = f1()(C1())
    var b = f2()(C(C2<Int64>()))
    if (a is C1 && b is C<C2<Int64>>) {
        return 0
    }
    return 1
}
