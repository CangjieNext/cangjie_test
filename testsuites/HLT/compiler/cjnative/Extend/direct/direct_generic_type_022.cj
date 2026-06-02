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

extend String {
    static func foos<T>(a: T) {
        return a
    }

    func foo<T>(a: T) {
        return a
    }

    static prop pas: B<A> {
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
    return String.foos(1) + "1".foo(-1) + String.pas.b.a + """
    abc
""".pa.b.a
}
