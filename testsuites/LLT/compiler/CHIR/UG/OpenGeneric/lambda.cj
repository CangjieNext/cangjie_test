// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args | compare %f

abstract class A<T> {
    public func bar<S>(a: S): S where S <: ToString
}

class B<T> <: A<T> {
    public func bar<M>(a: M): M where M <: ToString {
        a
    }
}

class F <: ToString {
    var i = 0
    public func toString() {
        "F(${i})"
    }
}

main() {
    let r: (F) -> ToString = B<Int32>().bar<F>
    let f = F()
    f.i = 3
    println(r(f))
    0
}

/* SCAN
F(3)
*/
