// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Regression: O2 inlining must not break mut wrappers when method-level
// generic T shadows interface-level generic T, and the shadowing T is used as
// a parameter type.

// EXEC: %compiler %cmp_opt %enableO2 %compile_exe_opt %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args | compare %f

interface I<T> {
    mut func f<T, U, V>(x: T, y: U, z: V): Int64 {
        let a: T = x
        let b: U = y
        let c: V = z
        consume(a)
        consume(b)
        consume(c)
        1
    }
}

func consume<T>(_: T): Unit {}

struct C <: I<String> {}

main(): Int64 {
    var c = C()
    if (c.f<Int64, String, Bool>(7, "inner", true) == 1) {
        println("shadowing: ok")
    }
    return 0
}

/* SCAN
shadowing: ok
*/
