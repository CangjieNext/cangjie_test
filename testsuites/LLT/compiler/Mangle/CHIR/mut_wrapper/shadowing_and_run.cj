// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Regression: mut interface default method with method-level generic that
// shadows the interface-level generic of the same name, where T is used in
// function parameter and return type. Must compile and produce correct result.

// EXEC: %compiler %cmp_opt %compile_exe_opt %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan result: 42

interface I<T> {
    mut func f<T>(x: T): T {
        let y: T = x
        y
    }
}

struct C <: I<Int64> {}

main() {
    var c = C()
    let r = c.f(42)
    println("result: ${r}")
}
