// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Regression: mut interface default methods with multiple method-level generic
// parameters whose types appear in function parameters, local values, and return
// types must compile after the mut wrapper is generated.

// EXEC: %compiler %cmp_opt %compile_lib_opt %f -Woff unused -o multi_param_default.%middle
// EXEC: %compiler %cmp_opt -O0 %compile_lib_opt %f -Woff unused -o multi_param_O0.%middle
// EXEC: %compiler %cmp_opt -O1 %compile_lib_opt %f -Woff unused -o multi_param_O1.%middle
// EXEC: %compiler %cmp_opt -O2 %compile_lib_opt %f -Woff unused -o multi_param_O2.%middle

interface I {
    mut func f<T, U, V>(a: T, b: U, c: V): (T, U, V) {
        let x: T = a
        let y: U = b
        let z: V = c
        (x, y, z)
    }
}

struct C <: I {}
