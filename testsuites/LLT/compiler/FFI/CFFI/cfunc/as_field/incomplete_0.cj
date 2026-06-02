// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// RUN-EXEC-PIPE: %run %output %run_args 2>&1 | compare %f
// ASSERT: scan default impl in A, a.n = 0
// ASSERT: scan f in main(), a.n = 0
// ASSERT: scan foo(), a.n = 0

@C
struct A {
    var n = 0
    var f: CFunc<(A) -> Unit> = { a =>
        println("default impl in A, a.n = ${a.n}")
    }
}

@C
func foo(a: A): Unit {
    println("foo(), a.n = ${a.n}")
}

unsafe main() {
    var a = A()
    a.f(a)

    var f: CFunc<(A) -> Unit> = { a =>
        println("f in main(), a.n = ${a.n}")
    }
    a.f = f
    a.f(a)

    a.f = foo
    a.f(a)
    0
}
