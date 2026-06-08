// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Regression: mut interface default methods with method-level generics must
// compile after the mut wrapper is generated.

// EXEC: %compiler %cmp_opt %compile_lib_opt %f -Woff unused -o generic_default_method_compile_default_static.%middle
// EXEC: %compiler %cmp_opt -O0 %compile_lib_opt %f -Woff unused -o generic_default_method_compile_O0_static.%middle
// EXEC: %compiler %cmp_opt -O1 %compile_lib_opt %f -Woff unused -o generic_default_method_compile_O1_static.%middle
// EXEC: %compiler %cmp_opt -O2 %compile_lib_opt %f -Woff unused -o generic_default_method_compile_O2_static.%middle
// EXEC: %compiler %cmp_opt %compile_shared_lib_opt %f -Woff unused -o libgeneric_default_method_compile_default.%dylib_suffix
// EXEC: %compiler %cmp_opt -O0 %compile_shared_lib_opt %f -Woff unused -o libgeneric_default_method_compile_O0.%dylib_suffix
// EXEC: %compiler %cmp_opt -O1 %compile_shared_lib_opt %f -Woff unused -o libgeneric_default_method_compile_O1.%dylib_suffix

interface I { mut func f<T>() {} }
struct C <: I {}
