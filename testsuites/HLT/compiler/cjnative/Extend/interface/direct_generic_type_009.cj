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
class A {}

enum B<T> where T <: A {
    EB(T)
}

interface I<T> {
    static prop pas: B<A> {
        get() {
            B<A>.EB(A())
        }
    }

    static func foos<T>(a: T) {
        return a
    }
}

extend<T> B<T> <: I<T> where T <: A {
    func foo<T>(a: T) {
        return a
    }
    prop pa: B<A> {
        get() {
            B<A>.EB(A())
        }
    }
}

main() {
    B<A>.pas
    B<A>.EB(A()).pa
    return B<A>.foos(1) + B<A>.EB(A()).foo(-1)
}
