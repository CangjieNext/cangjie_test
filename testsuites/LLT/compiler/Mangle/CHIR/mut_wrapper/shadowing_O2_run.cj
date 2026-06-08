// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Regression: O2 inlining must not break mut wrapper for method-level generic
// that shadows interface-level generic. Must compile and produce correct result.

// EXEC: %compiler %cmp_opt %enableO2 %compile_exe_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
// ASSERT: scan result: 7

interface I<T> {
    mut func f<T>(x: T): T {
        let y: T = x
        y
    }
}

struct C <: I<Int64> {}

main() {
    var c = C()
    let r = c.f(7)
    println("result: ${r}")
}
