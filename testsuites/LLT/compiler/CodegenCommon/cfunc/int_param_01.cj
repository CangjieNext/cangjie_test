// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan-begin inc_i8 param a=-2
// ASSERT: scan-next inc_i8 ret i8=-2
// ASSERT: scan-next inc_u8 param a=254
// ASSERT: scan-next inc_u8 ret u8=254
// ASSERT: scan-next inc_i16 param a=-2
// ASSERT: scan-next inc_i16 ret i16=-2
// ASSERT: scan-next inc_u16 param a=65534
// ASSERT: scan-next inc_u16 ret u16=65534

var inc_i8: CFunc <(Int8) -> Int8> = { a: Int8 =>
    println("inc_i8 param a=${a}") // expected: -2
    return a
}

var inc_u8: CFunc <(UInt8) -> UInt8> = { a: UInt8 =>
    println("inc_u8 param a=${a}") // expected: 254
    return a
}

var inc_i16: CFunc <(Int16) -> Int16> = { a: Int16 =>
    println("inc_i16 param a=${a}") // expected: -2
    return a
}

var inc_u16: CFunc <(UInt16) -> UInt16> = { a: UInt16 =>
    println("inc_u16 param a=${a}") // expected: 65534
    return a
}

unsafe main(): Int64 {
    let i8: Int8 = inc_i8(-2)
    println("inc_i8 ret i8=${i8}") // expected: -2

    let u8: UInt8 = inc_u8(254)
    println("inc_u8 ret u8=${u8}") // expected: 254

    let i16: Int16 = inc_i16(-2)
    println("inc_i16 ret i16=${i16}") // expected: -2

    let u16: UInt16 = inc_u16(65534)
    println("inc_u16 ret u16=${u16}") // expected: 65534
    return 0
}