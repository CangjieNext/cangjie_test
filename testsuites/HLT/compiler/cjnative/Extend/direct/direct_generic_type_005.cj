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
interface I {}

class C <: I {}

class B<T> where T <: I {
    B(var b: T) {
    }
}

extend<T> B<T> where T <: I {
    static func foos<T>(a: T) {
        return a
    }

    func foo<T>(a: T) {
        return a
    }

    static prop pas: B<I> {
        get() {
            B<I>(C())
        }
    }

    prop pa: B<I> {
        get() {
            B<I>(C())
        }
    }
}

main() {
    B<C>.pas
    B<I>.pas
    B<C>(C()).pa
    B<I>(C()).pa
    return B<C>.foos(1) + B<I>(C()).foo(-1)
}
