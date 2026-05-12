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

    // func foo<T>(a: T){
    //   return a
    // }

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

extend Int32 <: I<Int64> {
    func foo<T>(a: T) {
        return a
    }

    public prop pa: B<A> {
        get() {
            B<A>(A(-1))
        }
    }
}

main() {
    // var ra1 = Int32(-1).pa.b.a
    // // var ra2 = (-1).pa.b.a
    // var ra3 = 1.pa.b.a
    // println(ra1)
    // // println(ra2)
    // println(ra3)
    return Int32.foos(1) + 1.foo(-1) + Int32.pas.b.a + 1.pa.b.a
}
