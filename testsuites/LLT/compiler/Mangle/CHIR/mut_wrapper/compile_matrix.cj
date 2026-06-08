// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Regression: mut interface default methods with explicit method-level generic
// instantiation must compile after wrapper generation under the optimization
// levels that expose different lowering/codegen paths.

// EXEC: %compiler %cmp_opt %compile_lib_opt %f -Woff unused -o compile_matrix_default.%middle
// EXEC: %compiler %cmp_opt -O0 %compile_lib_opt %f -Woff unused -o compile_matrix_O0.%middle
// EXEC: %compiler %cmp_opt -O1 %compile_lib_opt %f -Woff unused -o compile_matrix_O1.%middle
// EXEC: %compiler %cmp_opt %enableO2 %compile_lib_opt %f -Woff unused -o compile_matrix_O2.%middle
// EXEC: %compiler %cmp_opt %compile_shared_lib_opt %f -Woff unused -o libcompile_matrix_default.%dylib_suffix
// EXEC: %compiler %cmp_opt -O0 %compile_shared_lib_opt %f -Woff unused -o libcompile_matrix_O0.%dylib_suffix
// EXEC: %compiler %cmp_opt -O1 %compile_shared_lib_opt %f -Woff unused -o libcompile_matrix_O1.%dylib_suffix

interface I {
    mut func f<T>(): Int64 {
        17
    }
}

struct C <: I {}

main(): Int64 {
    var x = C()
    x.f<Int64>()
}
