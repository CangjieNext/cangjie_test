// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
// DEPENDENCE: %n.c
// EXEC: %clang %clang_shared_opt %n.c -o %cffi_output
// EXEC: %compiler %cmp_opt_chir2hlir %cffi-link %f -o %output
// RUN-EXEC-PIPE: %pwd_to_ld_path %run %output %run_args 2>&1 | compare %f
// ASSERT: scan In C: af(), a.n = 1
// ASSERT: scan f in main(), a.n = 1
// ASSERT: scan foo(), a.n = 1

foreign func GetA(): A

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
    var a = GetA()
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
