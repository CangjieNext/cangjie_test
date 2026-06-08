// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Regression: mut interface default method with method-level generic that
// shadows the interface-level generic of the same name, where T is used in
// function parameter and return type. Must compile and produce correct result
// with and without O2.

// EXEC: %compiler %cmp_opt %compile_exe_opt %f -o shadowing_default.%suffix
// EXEC: %run %run_opt shadowing_default.%suffix %run_args
// EXEC: %compiler %cmp_opt %enableO2 %compile_exe_opt %f -o shadowing_O2.%suffix
// EXEC: %run %run_opt shadowing_O2.%suffix %run_args
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
