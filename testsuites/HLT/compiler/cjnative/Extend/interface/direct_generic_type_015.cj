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

class B<T> where T <: A {
    B(var b: T) {
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

extend UInt16 <: I<A> {
    public static func foos<T>(a: T) {
        return a
    }

    func foo<T>(a: T) {
        return a
    }

    public static prop pas: B<A> {
        get() {
            B<A>(A(1))
        }
    }

    prop pa: B<A> {
        get() {
            B<A>(A(-1))
        }
    }
}

main() {
    return UInt16.foos(1) + 1.foo(-1) + UInt16.pas.b.a + 1.pa.b.a
}
