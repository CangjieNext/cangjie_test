// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args | compare %f

interface I<T> {
    func foo<S>() {
        println("I<T>::foo<S>")
    }
    func bar<S>(a: S): S
}

open class A<T> <: I<T> {
    public open func foo<S>() {
        println("A<T>::foo<S>")
    }

    public open func bar<S>(a: S): S {
        println("A<T>::bar<S>")
        a
    }
}

struct SC<T> <: I<T> {
    public func foo<S>() {
        println("SC<T>::foo<S>")
    }

    public func bar<S>(a: S): S {
        println("SC<T>::bar<S>")
        a
    }
}

main() {
    let a: I<Bool> = A<Bool>()
    a.foo<Int64>()
    a.bar<Int32>(7)

    let b: I<Bool> = SC<Bool>()
    b.foo<Int64>()
    b.bar<Int32>(7)

    0
}

/* SCAN
A<T>::foo<S>
A<T>::bar<S>
SC<T>::foo<S>
SC<T>::bar<S>
*/
