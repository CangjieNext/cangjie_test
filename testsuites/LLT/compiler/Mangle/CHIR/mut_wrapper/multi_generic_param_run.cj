// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Regression: mut interface default methods with several method-level generic
// parameters must pass tuple values through the generated wrapper and still
// produce the expected runtime result.

// EXEC: %compiler %cmp_opt %compile_exe_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
// ASSERT: scan tuple: ok

interface I {
    mut func f<T, U, V>(a: T, b: U, c: V): (T, U, V) {
        let x: T = a
        let y: U = b
        let z: V = c
        (x, y, z)
    }
}

struct C <: I {}

main(): Int64 {
    var x = C()
    let (a, b, c) = x.f<Int64, String, Bool>(7, "unused", true)
    if (a == 7 && b == "unused" && c) {
        println("tuple: ok")
    }
    return 0
}
