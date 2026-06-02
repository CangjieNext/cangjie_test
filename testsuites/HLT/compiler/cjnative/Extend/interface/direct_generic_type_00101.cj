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

open class C<T> where T <: A {}

class B <: C<A> {
    B(var b: A) {
    }
}

interface I<T> {
    static func foos<T>(a: T) {
        return a
    }

    static prop pas: B {
        get() {
            B(A())
        }
    }

    prop pa: B {
        get() {
            B(A())
        }
    }
}

extend B <: I<Int32> {
    func foo<T>(a: T) {
        return a
    }

    public static prop pas: B {
        get() {
            B(A())
        }
    }

    public prop pa: B {
        get() {
            B(A())
        }
    }
}

main() {
    return B.foos(1) + B.pas.foo(-1) + B(A()).pa.foo(0)
}
