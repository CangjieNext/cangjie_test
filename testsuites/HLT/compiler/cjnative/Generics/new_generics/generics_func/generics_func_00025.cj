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

func test1() {
    A().test1<CPointer<Int8>>
}

func test2() {
    A().test2<CPointer<Int8>>
}

main() {
    var f1 = A().test1<CPointer<Int8>>
    var a = f1(unsafe { CPointer<Int8>() })
    var b = test1()(unsafe { CPointer<Int8>() })
    var f2 = A().test2<CPointer<Int8>>
    var c = f2(C(unsafe { CPointer<Int8>() }))
    var d = test2()(C(unsafe { CPointer<Int8>() }))
    if (a is CPointer<Int8> && b is CPointer<Int8> && c is C<CPointer<Int8>> && d is C<CPointer<Int8>>) {
        return 0
    }
    return 1
}
