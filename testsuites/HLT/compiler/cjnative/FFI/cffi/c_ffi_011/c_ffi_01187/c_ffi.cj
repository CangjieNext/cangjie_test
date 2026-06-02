/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL:2
// DEPENDENCE: %n.c
// EXEC: %clang %clang_opt %n.c -o %cffi_output
// EXEC-PIPE-1: %compiler %cmp_opt %ffic_opt -o %output 2>&1 | compare %f

foreign func testfunc(): CFunc<(Float64, Float64) -> Float64>

var add_b1: (Float32, Float64) -> Float64 = {a: Float32, b: Float64 => return Float64(a) + b}
var add_b2: CFunc<(Float32, Float64) -> Float64> = {a: Float32, b: Float64 => return Float64(a) + b}

unsafe main(): Int64 {
    var add_c1: CFunc<(Float32, Float64) -> Float64> = add_b1
    var add_c2: CFunc<(Float64, Float64) -> Float64> = add_b2
    return 0
}
// ASSERT: scan sema_mismatched_types
