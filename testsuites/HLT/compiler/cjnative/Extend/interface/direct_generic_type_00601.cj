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

interface B <: A {}

class D <: A {
    D(var b: Int64) {
    }
}

class C<T> where T <: D {
    func foo<T>(a: T) {
        return a
    }

    static func foos<T>(a: T) {
        return a
    }
}

extend<T> C<T> where T <: B {
    func foo(a: T) {
        return 5
    }

    static func foos(a: T) {
        return 5
    }
}

main() {
    var a = C<D>.foos(D(1)).b
    let aa = C<D>().foo(D(-1)).b
    if (a == 1 && aa == -1) {
        return 0
    }
    1
}
