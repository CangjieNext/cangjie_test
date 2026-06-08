// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Regression: mut interface default methods with several method-level generic
// parameters must pass those parameter types through the generated wrapper and
// still produce the expected runtime result.

// EXEC: %compiler %cmp_opt %compile_exe_opt %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan result: 42

interface I {
    mut func f<T, U, V>(a: T, b: U, c: V): Int64 {
        let x: T = a
        let y: U = b
        let z: V = c
        consume(x, y, z)
        42
    }
}

func consume<T, U, V>(_: T, _: U, _: V) {}

struct C <: I {}

main(): Int64 {
    var x = C()
    println("result: ${x.f<Int64, String, Bool>(7, "unused", true)}")
    return 0
}
