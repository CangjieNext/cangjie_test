// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %enableFuncInlining %cmp_opt %f -o %output
// (CJNATIVE) RUN-EXEC: %run %run_opt %output %run_args | compare %f
// EXEC: %compiler %cmp_opt %f -o %output
// (CJNATIVE) RUN-EXEC: %run %run_opt %output %run_args | compare %f

open class A {
    public static func f() {
        return 11
    }

    func bar() {
        f()
    }

    static func baz() {
        f()
    }
}

class C2 <: A {
    public static redef func f() {
        return 12
    }
}

main() {
    let a: A = C2()
    println(a.bar())

    println(A.f())
    println(C2.baz())
}

/* SCAN
12
11
12
*/
