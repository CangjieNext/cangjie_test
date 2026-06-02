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

class A {
    A(var a: Int64) {
    }
}

class B<T> where T <: TA {
    B(var b: T) {
    }
}

type TA = A

type TB<T> = B<T>

extend Int64 <: TI {
    func foo<T>(a: T) {
        return a
    }
    prop pa: TB<TA> {
        get() {
            TB<TA>(TA(-1))
        }
    }
}

interface I<T> {
    static func foos<T>(a: T) {
        return a
    }

    static prop pas: B<A> {
        get() {
            B<A>(A(1))
        }
    }
}

type TI = I<TA>

main() {
    return Int64.foos(1) + 1.foo(-1) + Int64.pas.b.a + 1.pa.b.a
}
