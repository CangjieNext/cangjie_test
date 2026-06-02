// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (CJNATIVE) EXEC: %compiler %enableFuncInlining %cmp_opt %f -o %output
// (CJNATIVE) RUN-EXEC: %run %run_opt %output %run_args | compare %f
// (CJNATIVE) EXEC: %compiler %cmp_opt %f -o %output
// (CJNATIVE) RUN-EXEC: %run %run_opt %output %run_args | compare %f

interface I {
    func foo<T>() {}
}

struct A {
    public static func f() {
        return 11
    }

    func bar() {
        f() // Apply
    }
    public static func foo<T>() {
        println("A::foo`1")
    }
}

main() {
    let a = A()
    println(a.bar())

    A.foo<Int32>()
}

/* SCAN
11
A::foo`1
*/