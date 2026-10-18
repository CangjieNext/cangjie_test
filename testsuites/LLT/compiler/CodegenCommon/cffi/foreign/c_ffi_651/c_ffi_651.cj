// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: ./%n.c
// EXEC: %clang %clang_opt -O2 %n.c -o %cffi_output
// EXEC: %compiler %cmp_opt -L . -l %n %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan-begin func_i8: -2
// ASSERT: scan-next func_i8 i8_ret=-2
// ASSERT: scan-next func_u8: 254
// ASSERT: scan-next func_u8 u8_ret=254
// ASSERT: scan-next func_i16: -2
// ASSERT: scan-next func_i16 i16_ret=-2
// ASSERT: scan-next func_u16: 65534
// ASSERT: scan-next func_u16 u16_ret=65534
// ASSERT: scan-next func_i8: -2
// ASSERT: scan-next func_i8 i8_ret_var=-2
// ASSERT: scan-next func_u8: 254
// ASSERT: scan-next func_u8 u8_ret_var=254
// ASSERT: scan-next func_i16: -2
// ASSERT: scan-next func_i16 i16_ret_var=-2
// ASSERT: scan-next func_u16: 65534
// ASSERT: scan-next func_u16 u16_ret_var=65534

foreign func func_i8(a:Int8): Int8
foreign func func_u8(a:UInt8): UInt8
foreign func func_i16(a:Int16): Int16
foreign func func_u16(a:UInt16): UInt16

var var_i8: CFunc <(Int8) -> Int8 >= func_i8
var var_u8: CFunc <(UInt8) -> UInt8 >= func_u8
var var_i16: CFunc <(Int16) -> Int16 >= func_i16
var var_u16: CFunc <(UInt16) -> UInt16 >= func_u16

unsafe main(): Int64 {
    let i8_ret:Int8 = func_i8(-2)
    println("func_i8 i8_ret=${i8_ret}") // expected: -2

    let u8_ret:UInt8 = func_u8(254)
    println("func_u8 u8_ret=${u8_ret}") // expected: 254

    let i16_ret:Int16 = func_i16(-2)
    println("func_i16 i16_ret=${i16_ret}") // expected: -2

    let u16_ret = func_u16(65534)
    println("func_u16 u16_ret=${u16_ret}") // expected: 65534

    let i8_ret_var:Int8 = var_i8(-2)
    println("func_i8 i8_ret_var=${i8_ret}") // expected: -2

    let u8_ret_var:UInt8 = var_u8(254)
    println("func_u8 u8_ret_var=${u8_ret}") // expected: 254

    let i16_ret_var:Int16 = var_i16(-2)
    println("func_i16 i16_ret_var=${i16_ret}") // expected: -2

    let u16_ret_var = var_u16(65534)
    println("func_u16 u16_ret_var=${u16_ret}") // expected: 65534

    return 0
}
