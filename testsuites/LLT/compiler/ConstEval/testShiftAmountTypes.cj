// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: %n.expect.out
// EXEC: %compiler %compile_exe_opt %debugCHIROpt %n.cj %cmp_opt -o %output 2>&1 | compare %f
// EXEC: %run %run_opt %output %run_args 2>&1 > %n.real.out
// EXEC: %diff %n.expect.out %n.real.out
// ASSERT: scan-not error
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

// Tests shifts whose shift amount is each integer type, for each integer operand type.

const func sh_Int8_Int8(a: Int8, n: Int8): Int8 { (a << n) >> n }
const func sh_Int8_Int16(a: Int8, n: Int16): Int8 { (a << n) >> n }
const func sh_Int8_Int32(a: Int8, n: Int32): Int8 { (a << n) >> n }
const func sh_Int8_Int64(a: Int8, n: Int64): Int8 { (a << n) >> n }
const func sh_Int8_IntNative(a: Int8, n: IntNative): Int8 { (a << n) >> n }
const func sh_Int8_UInt8(a: Int8, n: UInt8): Int8 { (a << n) >> n }
const func sh_Int8_UInt16(a: Int8, n: UInt16): Int8 { (a << n) >> n }
const func sh_Int8_UInt32(a: Int8, n: UInt32): Int8 { (a << n) >> n }
const func sh_Int8_UInt64(a: Int8, n: UInt64): Int8 { (a << n) >> n }
const func sh_Int8_UIntNative(a: Int8, n: UIntNative): Int8 { (a << n) >> n }
const func sh_Int16_Int8(a: Int16, n: Int8): Int16 { (a << n) >> n }
const func sh_Int16_Int16(a: Int16, n: Int16): Int16 { (a << n) >> n }
const func sh_Int16_Int32(a: Int16, n: Int32): Int16 { (a << n) >> n }
const func sh_Int16_Int64(a: Int16, n: Int64): Int16 { (a << n) >> n }
const func sh_Int16_IntNative(a: Int16, n: IntNative): Int16 { (a << n) >> n }
const func sh_Int16_UInt8(a: Int16, n: UInt8): Int16 { (a << n) >> n }
const func sh_Int16_UInt16(a: Int16, n: UInt16): Int16 { (a << n) >> n }
const func sh_Int16_UInt32(a: Int16, n: UInt32): Int16 { (a << n) >> n }
const func sh_Int16_UInt64(a: Int16, n: UInt64): Int16 { (a << n) >> n }
const func sh_Int16_UIntNative(a: Int16, n: UIntNative): Int16 { (a << n) >> n }
const func sh_Int32_Int8(a: Int32, n: Int8): Int32 { (a << n) >> n }
const func sh_Int32_Int16(a: Int32, n: Int16): Int32 { (a << n) >> n }
const func sh_Int32_Int32(a: Int32, n: Int32): Int32 { (a << n) >> n }
const func sh_Int32_Int64(a: Int32, n: Int64): Int32 { (a << n) >> n }
const func sh_Int32_IntNative(a: Int32, n: IntNative): Int32 { (a << n) >> n }
const func sh_Int32_UInt8(a: Int32, n: UInt8): Int32 { (a << n) >> n }
const func sh_Int32_UInt16(a: Int32, n: UInt16): Int32 { (a << n) >> n }
const func sh_Int32_UInt32(a: Int32, n: UInt32): Int32 { (a << n) >> n }
const func sh_Int32_UInt64(a: Int32, n: UInt64): Int32 { (a << n) >> n }
const func sh_Int32_UIntNative(a: Int32, n: UIntNative): Int32 { (a << n) >> n }
const func sh_Int64_Int8(a: Int64, n: Int8): Int64 { (a << n) >> n }
const func sh_Int64_Int16(a: Int64, n: Int16): Int64 { (a << n) >> n }
const func sh_Int64_Int32(a: Int64, n: Int32): Int64 { (a << n) >> n }
const func sh_Int64_Int64(a: Int64, n: Int64): Int64 { (a << n) >> n }
const func sh_Int64_IntNative(a: Int64, n: IntNative): Int64 { (a << n) >> n }
const func sh_Int64_UInt8(a: Int64, n: UInt8): Int64 { (a << n) >> n }
const func sh_Int64_UInt16(a: Int64, n: UInt16): Int64 { (a << n) >> n }
const func sh_Int64_UInt32(a: Int64, n: UInt32): Int64 { (a << n) >> n }
const func sh_Int64_UInt64(a: Int64, n: UInt64): Int64 { (a << n) >> n }
const func sh_Int64_UIntNative(a: Int64, n: UIntNative): Int64 { (a << n) >> n }
const func sh_IntNative_Int8(a: IntNative, n: Int8): IntNative { (a << n) >> n }
const func sh_IntNative_Int16(a: IntNative, n: Int16): IntNative { (a << n) >> n }
const func sh_IntNative_Int32(a: IntNative, n: Int32): IntNative { (a << n) >> n }
const func sh_IntNative_Int64(a: IntNative, n: Int64): IntNative { (a << n) >> n }
const func sh_IntNative_IntNative(a: IntNative, n: IntNative): IntNative { (a << n) >> n }
const func sh_IntNative_UInt8(a: IntNative, n: UInt8): IntNative { (a << n) >> n }
const func sh_IntNative_UInt16(a: IntNative, n: UInt16): IntNative { (a << n) >> n }
const func sh_IntNative_UInt32(a: IntNative, n: UInt32): IntNative { (a << n) >> n }
const func sh_IntNative_UInt64(a: IntNative, n: UInt64): IntNative { (a << n) >> n }
const func sh_IntNative_UIntNative(a: IntNative, n: UIntNative): IntNative { (a << n) >> n }
const func sh_UInt8_Int8(a: UInt8, n: Int8): UInt8 { (a << n) >> n }
const func sh_UInt8_Int16(a: UInt8, n: Int16): UInt8 { (a << n) >> n }
const func sh_UInt8_Int32(a: UInt8, n: Int32): UInt8 { (a << n) >> n }
const func sh_UInt8_Int64(a: UInt8, n: Int64): UInt8 { (a << n) >> n }
const func sh_UInt8_IntNative(a: UInt8, n: IntNative): UInt8 { (a << n) >> n }
const func sh_UInt8_UInt8(a: UInt8, n: UInt8): UInt8 { (a << n) >> n }
const func sh_UInt8_UInt16(a: UInt8, n: UInt16): UInt8 { (a << n) >> n }
const func sh_UInt8_UInt32(a: UInt8, n: UInt32): UInt8 { (a << n) >> n }
const func sh_UInt8_UInt64(a: UInt8, n: UInt64): UInt8 { (a << n) >> n }
const func sh_UInt8_UIntNative(a: UInt8, n: UIntNative): UInt8 { (a << n) >> n }
const func sh_UInt16_Int8(a: UInt16, n: Int8): UInt16 { (a << n) >> n }
const func sh_UInt16_Int16(a: UInt16, n: Int16): UInt16 { (a << n) >> n }
const func sh_UInt16_Int32(a: UInt16, n: Int32): UInt16 { (a << n) >> n }
const func sh_UInt16_Int64(a: UInt16, n: Int64): UInt16 { (a << n) >> n }
const func sh_UInt16_IntNative(a: UInt16, n: IntNative): UInt16 { (a << n) >> n }
const func sh_UInt16_UInt8(a: UInt16, n: UInt8): UInt16 { (a << n) >> n }
const func sh_UInt16_UInt16(a: UInt16, n: UInt16): UInt16 { (a << n) >> n }
const func sh_UInt16_UInt32(a: UInt16, n: UInt32): UInt16 { (a << n) >> n }
const func sh_UInt16_UInt64(a: UInt16, n: UInt64): UInt16 { (a << n) >> n }
const func sh_UInt16_UIntNative(a: UInt16, n: UIntNative): UInt16 { (a << n) >> n }
const func sh_UInt32_Int8(a: UInt32, n: Int8): UInt32 { (a << n) >> n }
const func sh_UInt32_Int16(a: UInt32, n: Int16): UInt32 { (a << n) >> n }
const func sh_UInt32_Int32(a: UInt32, n: Int32): UInt32 { (a << n) >> n }
const func sh_UInt32_Int64(a: UInt32, n: Int64): UInt32 { (a << n) >> n }
const func sh_UInt32_IntNative(a: UInt32, n: IntNative): UInt32 { (a << n) >> n }
const func sh_UInt32_UInt8(a: UInt32, n: UInt8): UInt32 { (a << n) >> n }
const func sh_UInt32_UInt16(a: UInt32, n: UInt16): UInt32 { (a << n) >> n }
const func sh_UInt32_UInt32(a: UInt32, n: UInt32): UInt32 { (a << n) >> n }
const func sh_UInt32_UInt64(a: UInt32, n: UInt64): UInt32 { (a << n) >> n }
const func sh_UInt32_UIntNative(a: UInt32, n: UIntNative): UInt32 { (a << n) >> n }
const func sh_UInt64_Int8(a: UInt64, n: Int8): UInt64 { (a << n) >> n }
const func sh_UInt64_Int16(a: UInt64, n: Int16): UInt64 { (a << n) >> n }
const func sh_UInt64_Int32(a: UInt64, n: Int32): UInt64 { (a << n) >> n }
const func sh_UInt64_Int64(a: UInt64, n: Int64): UInt64 { (a << n) >> n }
const func sh_UInt64_IntNative(a: UInt64, n: IntNative): UInt64 { (a << n) >> n }
const func sh_UInt64_UInt8(a: UInt64, n: UInt8): UInt64 { (a << n) >> n }
const func sh_UInt64_UInt16(a: UInt64, n: UInt16): UInt64 { (a << n) >> n }
const func sh_UInt64_UInt32(a: UInt64, n: UInt32): UInt64 { (a << n) >> n }
const func sh_UInt64_UInt64(a: UInt64, n: UInt64): UInt64 { (a << n) >> n }
const func sh_UInt64_UIntNative(a: UInt64, n: UIntNative): UInt64 { (a << n) >> n }
const func sh_UIntNative_Int8(a: UIntNative, n: Int8): UIntNative { (a << n) >> n }
const func sh_UIntNative_Int16(a: UIntNative, n: Int16): UIntNative { (a << n) >> n }
const func sh_UIntNative_Int32(a: UIntNative, n: Int32): UIntNative { (a << n) >> n }
const func sh_UIntNative_Int64(a: UIntNative, n: Int64): UIntNative { (a << n) >> n }
const func sh_UIntNative_IntNative(a: UIntNative, n: IntNative): UIntNative { (a << n) >> n }
const func sh_UIntNative_UInt8(a: UIntNative, n: UInt8): UIntNative { (a << n) >> n }
const func sh_UIntNative_UInt16(a: UIntNative, n: UInt16): UIntNative { (a << n) >> n }
const func sh_UIntNative_UInt32(a: UIntNative, n: UInt32): UIntNative { (a << n) >> n }
const func sh_UIntNative_UInt64(a: UIntNative, n: UInt64): UIntNative { (a << n) >> n }
const func sh_UIntNative_UIntNative(a: UIntNative, n: UIntNative): UIntNative { (a << n) >> n }
const SH = (sh_Int8_Int8(5, 1), sh_Int8_Int16(5, 1), sh_Int8_Int32(5, 1), sh_Int8_Int64(5, 1), sh_Int8_IntNative(5, 1), sh_Int8_UInt8(5, 1), sh_Int8_UInt16(5, 1), sh_Int8_UInt32(5, 1), sh_Int8_UInt64(5, 1), sh_Int8_UIntNative(5, 1), sh_Int16_Int8(5, 1), sh_Int16_Int16(5, 1), sh_Int16_Int32(5, 1), sh_Int16_Int64(5, 1), sh_Int16_IntNative(5, 1), sh_Int16_UInt8(5, 1), sh_Int16_UInt16(5, 1), sh_Int16_UInt32(5, 1), sh_Int16_UInt64(5, 1), sh_Int16_UIntNative(5, 1), sh_Int32_Int8(5, 1), sh_Int32_Int16(5, 1), sh_Int32_Int32(5, 1), sh_Int32_Int64(5, 1), sh_Int32_IntNative(5, 1), sh_Int32_UInt8(5, 1), sh_Int32_UInt16(5, 1), sh_Int32_UInt32(5, 1), sh_Int32_UInt64(5, 1), sh_Int32_UIntNative(5, 1), sh_Int64_Int8(5, 1), sh_Int64_Int16(5, 1), sh_Int64_Int32(5, 1), sh_Int64_Int64(5, 1), sh_Int64_IntNative(5, 1), sh_Int64_UInt8(5, 1), sh_Int64_UInt16(5, 1), sh_Int64_UInt32(5, 1), sh_Int64_UInt64(5, 1), sh_Int64_UIntNative(5, 1), sh_IntNative_Int8(5, 1), sh_IntNative_Int16(5, 1), sh_IntNative_Int32(5, 1), sh_IntNative_Int64(5, 1), sh_IntNative_IntNative(5, 1), sh_IntNative_UInt8(5, 1), sh_IntNative_UInt16(5, 1), sh_IntNative_UInt32(5, 1), sh_IntNative_UInt64(5, 1), sh_IntNative_UIntNative(5, 1), sh_UInt8_Int8(5, 1), sh_UInt8_Int16(5, 1), sh_UInt8_Int32(5, 1), sh_UInt8_Int64(5, 1), sh_UInt8_IntNative(5, 1), sh_UInt8_UInt8(5, 1), sh_UInt8_UInt16(5, 1), sh_UInt8_UInt32(5, 1), sh_UInt8_UInt64(5, 1), sh_UInt8_UIntNative(5, 1), sh_UInt16_Int8(5, 1), sh_UInt16_Int16(5, 1), sh_UInt16_Int32(5, 1), sh_UInt16_Int64(5, 1), sh_UInt16_IntNative(5, 1), sh_UInt16_UInt8(5, 1), sh_UInt16_UInt16(5, 1), sh_UInt16_UInt32(5, 1), sh_UInt16_UInt64(5, 1), sh_UInt16_UIntNative(5, 1), sh_UInt32_Int8(5, 1), sh_UInt32_Int16(5, 1), sh_UInt32_Int32(5, 1), sh_UInt32_Int64(5, 1), sh_UInt32_IntNative(5, 1), sh_UInt32_UInt8(5, 1), sh_UInt32_UInt16(5, 1), sh_UInt32_UInt32(5, 1), sh_UInt32_UInt64(5, 1), sh_UInt32_UIntNative(5, 1), sh_UInt64_Int8(5, 1), sh_UInt64_Int16(5, 1), sh_UInt64_Int32(5, 1), sh_UInt64_Int64(5, 1), sh_UInt64_IntNative(5, 1), sh_UInt64_UInt8(5, 1), sh_UInt64_UInt16(5, 1), sh_UInt64_UInt32(5, 1), sh_UInt64_UInt64(5, 1), sh_UInt64_UIntNative(5, 1), sh_UIntNative_Int8(5, 1), sh_UIntNative_Int16(5, 1), sh_UIntNative_Int32(5, 1), sh_UIntNative_Int64(5, 1), sh_UIntNative_IntNative(5, 1), sh_UIntNative_UInt8(5, 1), sh_UIntNative_UInt16(5, 1), sh_UIntNative_UInt32(5, 1), sh_UIntNative_UInt64(5, 1), sh_UIntNative_UIntNative(5, 1))
main() { println(SH[0]); println(SH[99]) }
