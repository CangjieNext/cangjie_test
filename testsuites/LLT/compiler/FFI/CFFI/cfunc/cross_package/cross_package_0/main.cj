// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
// DEPENDENCE: a b
// EXEC: %compiler %cmp_opt %compile_lib_opt a/a.cj -o a.%middle
// EXEC: %compiler %cmp_opt %compile_lib_opt b/b.cj -o b.%middle
// EXEC: %compiler %cmp_opt %n.cj a.%middle b.%middle -o %output
// EXEC-PIPE: %pwd_to_ld_path %run %run_opt %output | compare %f

internal import a.*
internal import b.*

main() {
    let a: A = A()
    let b: A = B()
    let c: A = C()
    println("test A")
    a.test()
    println()

    println("test B")
    b.test()
    println()

    println("test C")
    c.test()
}

/* SCAN-IN
test A
I am A f()
I am A f1()

test B
I am B f()
I am B f1()

test C
I am C f()
I am C f1()
*/
