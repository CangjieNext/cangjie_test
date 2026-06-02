// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: foo.c
// EXEC: %clang %clang_shared_opt foo.c -o %cffi_output
// EXEC: %compiler %cmp_opt %n.cj %disableReflection -o %n.%suffix -L . -l %n
// EXEC-0: %run %run_opt %n.%suffix 2>&1 | compare %f
// ASSERT: scan foo1: n = 0
// ASSERT: scan foo2: A.a = 0
// ASSERT: scan foo3: A.a = 0
// ASSERT: scan f: A.a = 0
foreign func foo3(n: A): A

@C
func foo1(n: Int8): Int8 {
    println("foo1: n = ${n}")
    n
}

@C
func foo2(n: A): A {
    println("foo2: A.a = ${n.a}")
    n
}

var f: CFunc<(A) -> A> = {
    a =>
    println("f: A.a = ${a.a}")
    a
}

@C
struct A {
    var a: Int8 = 0
}

main() {
    var a = A()
    unsafe {
        foo1(0)
        foo2(a)
        foo3(a)
        f(a)
    }
    0
}
