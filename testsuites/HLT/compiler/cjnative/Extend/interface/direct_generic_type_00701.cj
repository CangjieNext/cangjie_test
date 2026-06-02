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

interface A {}

class B <: A {
    B(var b: Int64) {
    }
}

class C<T> where T <: A {}

interface I<T> where T <: A {
    static func foos<T>(a: T) {
        return a
    }
}

extend<T> C<T> <: I<B> where T <: B {
    func foo<T>(a: T) {
        return a
    }
}

main() {
    return C<B>.foos(B(1)).b + C<B>().foo(B(1)).b - 2
}
