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

// Tests `match` on constants of every integer type, Rune and Bool with hit, miss-between, miss-above and miss-below values.

const func sw_Int8(x: Int8): Int64 { match (x) { case 1 => 1 case 4 => 4 case 9 => 9 case 20 => 20 case _ => -1 } }
const func sw_Int16(x: Int16): Int64 { match (x) { case 1 => 1 case 4 => 4 case 9 => 9 case 20 => 20 case _ => -1 } }
const func sw_Int32(x: Int32): Int64 { match (x) { case 1 => 1 case 4 => 4 case 9 => 9 case 20 => 20 case _ => -1 } }
const func sw_Int64(x: Int64): Int64 { match (x) { case 1 => 1 case 4 => 4 case 9 => 9 case 20 => 20 case _ => -1 } }
const func sw_IntNative(x: IntNative): Int64 { match (x) { case 1 => 1 case 4 => 4 case 9 => 9 case 20 => 20 case _ => -1 } }
const func sw_UInt8(x: UInt8): Int64 { match (x) { case 1 => 1 case 4 => 4 case 9 => 9 case 20 => 20 case _ => -1 } }
const func sw_UInt16(x: UInt16): Int64 { match (x) { case 1 => 1 case 4 => 4 case 9 => 9 case 20 => 20 case _ => -1 } }
const func sw_UInt32(x: UInt32): Int64 { match (x) { case 1 => 1 case 4 => 4 case 9 => 9 case 20 => 20 case _ => -1 } }
const func sw_UInt64(x: UInt64): Int64 { match (x) { case 1 => 1 case 4 => 4 case 9 => 9 case 20 => 20 case _ => -1 } }
const func sw_UIntNative(x: UIntNative): Int64 { match (x) { case 1 => 1 case 4 => 4 case 9 => 9 case 20 => 20 case _ => -1 } }
const func sw_rune(x: Rune): Int64 { match (x) { case ra => 1 case rc => 3 case rz => 26 case _ => -1 } }
const func sw_bool(x: Bool): Int64 { match (x) { case true => 1 case false => 0 } }
const SW_Int8 = sw_Int8(1) + sw_Int8(20) + sw_Int8(2) + sw_Int8(99) + sw_Int8(-3)
const SW_Int16 = sw_Int16(1) + sw_Int16(20) + sw_Int16(2) + sw_Int16(99) + sw_Int16(-3)
const SW_Int32 = sw_Int32(1) + sw_Int32(20) + sw_Int32(2) + sw_Int32(99) + sw_Int32(-3)
const SW_Int64 = sw_Int64(1) + sw_Int64(20) + sw_Int64(2) + sw_Int64(99) + sw_Int64(-3)
const SW_IntNative = sw_IntNative(1) + sw_IntNative(20) + sw_IntNative(2) + sw_IntNative(99) + sw_IntNative(-3)
const SW_UInt8 = sw_UInt8(1) + sw_UInt8(20) + sw_UInt8(2) + sw_UInt8(99) + sw_UInt8(0)
const SW_UInt16 = sw_UInt16(1) + sw_UInt16(20) + sw_UInt16(2) + sw_UInt16(99) + sw_UInt16(0)
const SW_UInt32 = sw_UInt32(1) + sw_UInt32(20) + sw_UInt32(2) + sw_UInt32(99) + sw_UInt32(0)
const SW_UInt64 = sw_UInt64(1) + sw_UInt64(20) + sw_UInt64(2) + sw_UInt64(99) + sw_UInt64(0)
const SW_UIntNative = sw_UIntNative(1) + sw_UIntNative(20) + sw_UIntNative(2) + sw_UIntNative(99) + sw_UIntNative(0)
const SW_R = sw_rune(r'a') + sw_rune(r'z') + sw_rune(r'b') + sw_rune(r'~') + sw_rune(r'A')
const SW_B = sw_bool(true) + sw_bool(false)
main() { println(SW_Int8); println(SW_Int16); println(SW_Int32); println(SW_Int64); println(SW_IntNative); println(SW_UInt8); println(SW_UInt16); println(SW_UInt32); println(SW_UInt64); println(SW_UIntNative); println(SW_R); println(SW_B) }
