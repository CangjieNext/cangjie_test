// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Regression: O2 inlining must not break mut wrappers when a method-level
// generic shadows the interface-level generic with the same name, and the
// shadowing type is used in parameters, locals, and return values.

// EXEC: %compiler %cmp_opt %enableO2 %compile_exe_opt %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args | compare %f

interface I<T> {
    mut func outer(value: T): T {
        value
    }

    mut func f<T, U, V>(x: T, y: U, z: V): (T, U, V) {
        let a: T = x
        let b: U = y
        let c: V = z
        (a, b, c)
    }
}

struct C <: I<String> {}

main(): Int64 {
    var c = C()
    let outer = c.outer("outer")
    let (a, b, d) = c.f<Int64, String, Bool>(7, "inner", true)
    if (outer == "outer" && a == 7 && b == "inner" && d) {
        println("shadowing: ok")
    }
    return 0
}

/* SCAN
shadowing: ok
*/
