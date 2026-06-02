// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args | compare %f

interface I<T> {
    mut func foo<S>() {
        println("I<T>::foo<S>")
    }
    mut func bar<S>(a: S): S
}

struct FOO<T> {}

extend<R> FOO<R> <: I<R> {
    public mut func foo<S>() {
        println("FOO<T>::foo<S>")
    }

    public mut func bar<S>(a: S): S {
        println("FOO<T>::bar<S>")
        a
    }
}

main() {
    let b: I<Bool> = FOO<Bool>()
    b.foo<Int64>()
    b.bar<Int32>(7)

    0
}

/* SCAN
FOO<T>::foo<S>
FOO<T>::bar<S>
*/
