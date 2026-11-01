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

// Tests every binary, comparison, bitwise and unary operator on every numeric type, Rune and Bool under the throwing, wrapping and saturating overflow strategies.

const func ar_Int8_thr(a: Int8, b: Int8): Int8 {
    let s = a + b
    let d = s - b
    let m = d * b
    let q = m / b
    let r = q % b
    let sh = (r << 1) >> 1
    let bw = (sh & b) | (sh ^ b)
    let ng = -bw
    let nt = !ng
    if (a == b || a != b && a < b || a <= b && a > b || a >= b) { nt } else { ng }
}
@OverflowWrapping
const func ar_Int8_wrap(a: Int8, b: Int8): Int8 {
    let s = a + b
    let d = s - b
    let m = d * b
    let q = m / b
    let r = q % b
    let sh = (r << 1) >> 1
    let bw = (sh & b) | (sh ^ b)
    let ng = -bw
    let nt = !ng
    if (a == b || a != b && a < b || a <= b && a > b || a >= b) { nt } else { ng }
}
@OverflowSaturating
const func ar_Int8_sat(a: Int8, b: Int8): Int8 {
    let s = a + b
    let d = s - b
    let m = d * b
    let q = m / b
    let r = q % b
    let sh = (r << 1) >> 1
    let bw = (sh & b) | (sh ^ b)
    let ng = -bw
    let nt = !ng
    if (a == b || a != b && a < b || a <= b && a > b || a >= b) { nt } else { ng }
}
const R_Int8 = (ar_Int8_thr(3, 2), ar_Int8_wrap(127, 3), ar_Int8_sat(127, 3))
const func ar_Int16_thr(a: Int16, b: Int16): Int16 {
    let s = a + b
    let d = s - b
    let m = d * b
    let q = m / b
    let r = q % b
    let sh = (r << 1) >> 1
    let bw = (sh & b) | (sh ^ b)
    let ng = -bw
    let nt = !ng
    if (a == b || a != b && a < b || a <= b && a > b || a >= b) { nt } else { ng }
}
@OverflowWrapping
const func ar_Int16_wrap(a: Int16, b: Int16): Int16 {
    let s = a + b
    let d = s - b
    let m = d * b
    let q = m / b
    let r = q % b
    let sh = (r << 1) >> 1
    let bw = (sh & b) | (sh ^ b)
    let ng = -bw
    let nt = !ng
    if (a == b || a != b && a < b || a <= b && a > b || a >= b) { nt } else { ng }
}
@OverflowSaturating
const func ar_Int16_sat(a: Int16, b: Int16): Int16 {
    let s = a + b
    let d = s - b
    let m = d * b
    let q = m / b
    let r = q % b
    let sh = (r << 1) >> 1
    let bw = (sh & b) | (sh ^ b)
    let ng = -bw
    let nt = !ng
    if (a == b || a != b && a < b || a <= b && a > b || a >= b) { nt } else { ng }
}
const R_Int16 = (ar_Int16_thr(3, 2), ar_Int16_wrap(32767, 3), ar_Int16_sat(32767, 3))
const func ar_Int32_thr(a: Int32, b: Int32): Int32 {
    let s = a + b
    let d = s - b
    let m = d * b
    let q = m / b
    let r = q % b
    let sh = (r << 1) >> 1
    let bw = (sh & b) | (sh ^ b)
    let ng = -bw
    let nt = !ng
    if (a == b || a != b && a < b || a <= b && a > b || a >= b) { nt } else { ng }
}
@OverflowWrapping
const func ar_Int32_wrap(a: Int32, b: Int32): Int32 {
    let s = a + b
    let d = s - b
    let m = d * b
    let q = m / b
    let r = q % b
    let sh = (r << 1) >> 1
    let bw = (sh & b) | (sh ^ b)
    let ng = -bw
    let nt = !ng
    if (a == b || a != b && a < b || a <= b && a > b || a >= b) { nt } else { ng }
}
@OverflowSaturating
const func ar_Int32_sat(a: Int32, b: Int32): Int32 {
    let s = a + b
    let d = s - b
    let m = d * b
    let q = m / b
    let r = q % b
    let sh = (r << 1) >> 1
    let bw = (sh & b) | (sh ^ b)
    let ng = -bw
    let nt = !ng
    if (a == b || a != b && a < b || a <= b && a > b || a >= b) { nt } else { ng }
}
const R_Int32 = (ar_Int32_thr(3, 2), ar_Int32_wrap(2147483647, 3), ar_Int32_sat(2147483647, 3))
const func ar_Int64_thr(a: Int64, b: Int64): Int64 {
    let s = a + b
    let d = s - b
    let m = d * b
    let q = m / b
    let r = q % b
    let sh = (r << 1) >> 1
    let bw = (sh & b) | (sh ^ b)
    let ng = -bw
    let nt = !ng
    if (a == b || a != b && a < b || a <= b && a > b || a >= b) { nt } else { ng }
}
@OverflowWrapping
const func ar_Int64_wrap(a: Int64, b: Int64): Int64 {
    let s = a + b
    let d = s - b
    let m = d * b
    let q = m / b
    let r = q % b
    let sh = (r << 1) >> 1
    let bw = (sh & b) | (sh ^ b)
    let ng = -bw
    let nt = !ng
    if (a == b || a != b && a < b || a <= b && a > b || a >= b) { nt } else { ng }
}
@OverflowSaturating
const func ar_Int64_sat(a: Int64, b: Int64): Int64 {
    let s = a + b
    let d = s - b
    let m = d * b
    let q = m / b
    let r = q % b
    let sh = (r << 1) >> 1
    let bw = (sh & b) | (sh ^ b)
    let ng = -bw
    let nt = !ng
    if (a == b || a != b && a < b || a <= b && a > b || a >= b) { nt } else { ng }
}
const R_Int64 = (ar_Int64_thr(3, 2), ar_Int64_wrap(9223372036854775807, 3), ar_Int64_sat(9223372036854775807, 3))
const func ar_IntNative_thr(a: IntNative, b: IntNative): IntNative {
    let s = a + b
    let d = s - b
    let m = d * b
    let q = m / b
    let r = q % b
    let sh = (r << 1) >> 1
    let bw = (sh & b) | (sh ^ b)
    let ng = -bw
    let nt = !ng
    if (a == b || a != b && a < b || a <= b && a > b || a >= b) { nt } else { ng }
}
@OverflowWrapping
const func ar_IntNative_wrap(a: IntNative, b: IntNative): IntNative {
    let s = a + b
    let d = s - b
    let m = d * b
    let q = m / b
    let r = q % b
    let sh = (r << 1) >> 1
    let bw = (sh & b) | (sh ^ b)
    let ng = -bw
    let nt = !ng
    if (a == b || a != b && a < b || a <= b && a > b || a >= b) { nt } else { ng }
}
@OverflowSaturating
const func ar_IntNative_sat(a: IntNative, b: IntNative): IntNative {
    let s = a + b
    let d = s - b
    let m = d * b
    let q = m / b
    let r = q % b
    let sh = (r << 1) >> 1
    let bw = (sh & b) | (sh ^ b)
    let ng = -bw
    let nt = !ng
    if (a == b || a != b && a < b || a <= b && a > b || a >= b) { nt } else { ng }
}
const R_IntNative = (ar_IntNative_thr(3, 2), ar_IntNative_wrap(9223372036854775807, 3), ar_IntNative_sat(9223372036854775807, 3))
const func ar_UInt8_thr(a: UInt8, b: UInt8): UInt8 {
    let s = a + b
    let d = s - b
    let m = d * b
    let q = m / b
    let r = q % b
    let sh = (r << 1) >> 1
    let bw = (sh & b) | (sh ^ b)
    let ng = bw
    let nt = !ng
    if (a == b || a != b && a < b || a <= b && a > b || a >= b) { nt } else { ng }
}
@OverflowWrapping
const func ar_UInt8_wrap(a: UInt8, b: UInt8): UInt8 {
    let s = a + b
    let d = s - b
    let m = d * b
    let q = m / b
    let r = q % b
    let sh = (r << 1) >> 1
    let bw = (sh & b) | (sh ^ b)
    let ng = bw
    let nt = !ng
    if (a == b || a != b && a < b || a <= b && a > b || a >= b) { nt } else { ng }
}
@OverflowSaturating
const func ar_UInt8_sat(a: UInt8, b: UInt8): UInt8 {
    let s = a + b
    let d = s - b
    let m = d * b
    let q = m / b
    let r = q % b
    let sh = (r << 1) >> 1
    let bw = (sh & b) | (sh ^ b)
    let ng = bw
    let nt = !ng
    if (a == b || a != b && a < b || a <= b && a > b || a >= b) { nt } else { ng }
}
const R_UInt8 = (ar_UInt8_thr(3, 2), ar_UInt8_wrap(255, 3), ar_UInt8_sat(255, 3))
const func ar_UInt16_thr(a: UInt16, b: UInt16): UInt16 {
    let s = a + b
    let d = s - b
    let m = d * b
    let q = m / b
    let r = q % b
    let sh = (r << 1) >> 1
    let bw = (sh & b) | (sh ^ b)
    let ng = bw
    let nt = !ng
    if (a == b || a != b && a < b || a <= b && a > b || a >= b) { nt } else { ng }
}
@OverflowWrapping
const func ar_UInt16_wrap(a: UInt16, b: UInt16): UInt16 {
    let s = a + b
    let d = s - b
    let m = d * b
    let q = m / b
    let r = q % b
    let sh = (r << 1) >> 1
    let bw = (sh & b) | (sh ^ b)
    let ng = bw
    let nt = !ng
    if (a == b || a != b && a < b || a <= b && a > b || a >= b) { nt } else { ng }
}
@OverflowSaturating
const func ar_UInt16_sat(a: UInt16, b: UInt16): UInt16 {
    let s = a + b
    let d = s - b
    let m = d * b
    let q = m / b
    let r = q % b
    let sh = (r << 1) >> 1
    let bw = (sh & b) | (sh ^ b)
    let ng = bw
    let nt = !ng
    if (a == b || a != b && a < b || a <= b && a > b || a >= b) { nt } else { ng }
}
const R_UInt16 = (ar_UInt16_thr(3, 2), ar_UInt16_wrap(65535, 3), ar_UInt16_sat(65535, 3))
const func ar_UInt32_thr(a: UInt32, b: UInt32): UInt32 {
    let s = a + b
    let d = s - b
    let m = d * b
    let q = m / b
    let r = q % b
    let sh = (r << 1) >> 1
    let bw = (sh & b) | (sh ^ b)
    let ng = bw
    let nt = !ng
    if (a == b || a != b && a < b || a <= b && a > b || a >= b) { nt } else { ng }
}
@OverflowWrapping
const func ar_UInt32_wrap(a: UInt32, b: UInt32): UInt32 {
    let s = a + b
    let d = s - b
    let m = d * b
    let q = m / b
    let r = q % b
    let sh = (r << 1) >> 1
    let bw = (sh & b) | (sh ^ b)
    let ng = bw
    let nt = !ng
    if (a == b || a != b && a < b || a <= b && a > b || a >= b) { nt } else { ng }
}
@OverflowSaturating
const func ar_UInt32_sat(a: UInt32, b: UInt32): UInt32 {
    let s = a + b
    let d = s - b
    let m = d * b
    let q = m / b
    let r = q % b
    let sh = (r << 1) >> 1
    let bw = (sh & b) | (sh ^ b)
    let ng = bw
    let nt = !ng
    if (a == b || a != b && a < b || a <= b && a > b || a >= b) { nt } else { ng }
}
const R_UInt32 = (ar_UInt32_thr(3, 2), ar_UInt32_wrap(4294967295, 3), ar_UInt32_sat(4294967295, 3))
const func ar_UInt64_thr(a: UInt64, b: UInt64): UInt64 {
    let s = a + b
    let d = s - b
    let m = d * b
    let q = m / b
    let r = q % b
    let sh = (r << 1) >> 1
    let bw = (sh & b) | (sh ^ b)
    let ng = bw
    let nt = !ng
    if (a == b || a != b && a < b || a <= b && a > b || a >= b) { nt } else { ng }
}
@OverflowWrapping
const func ar_UInt64_wrap(a: UInt64, b: UInt64): UInt64 {
    let s = a + b
    let d = s - b
    let m = d * b
    let q = m / b
    let r = q % b
    let sh = (r << 1) >> 1
    let bw = (sh & b) | (sh ^ b)
    let ng = bw
    let nt = !ng
    if (a == b || a != b && a < b || a <= b && a > b || a >= b) { nt } else { ng }
}
@OverflowSaturating
const func ar_UInt64_sat(a: UInt64, b: UInt64): UInt64 {
    let s = a + b
    let d = s - b
    let m = d * b
    let q = m / b
    let r = q % b
    let sh = (r << 1) >> 1
    let bw = (sh & b) | (sh ^ b)
    let ng = bw
    let nt = !ng
    if (a == b || a != b && a < b || a <= b && a > b || a >= b) { nt } else { ng }
}
const R_UInt64 = (ar_UInt64_thr(3, 2), ar_UInt64_wrap(18446744073709551615, 3), ar_UInt64_sat(18446744073709551615, 3))
const func ar_UIntNative_thr(a: UIntNative, b: UIntNative): UIntNative {
    let s = a + b
    let d = s - b
    let m = d * b
    let q = m / b
    let r = q % b
    let sh = (r << 1) >> 1
    let bw = (sh & b) | (sh ^ b)
    let ng = bw
    let nt = !ng
    if (a == b || a != b && a < b || a <= b && a > b || a >= b) { nt } else { ng }
}
@OverflowWrapping
const func ar_UIntNative_wrap(a: UIntNative, b: UIntNative): UIntNative {
    let s = a + b
    let d = s - b
    let m = d * b
    let q = m / b
    let r = q % b
    let sh = (r << 1) >> 1
    let bw = (sh & b) | (sh ^ b)
    let ng = bw
    let nt = !ng
    if (a == b || a != b && a < b || a <= b && a > b || a >= b) { nt } else { ng }
}
@OverflowSaturating
const func ar_UIntNative_sat(a: UIntNative, b: UIntNative): UIntNative {
    let s = a + b
    let d = s - b
    let m = d * b
    let q = m / b
    let r = q % b
    let sh = (r << 1) >> 1
    let bw = (sh & b) | (sh ^ b)
    let ng = bw
    let nt = !ng
    if (a == b || a != b && a < b || a <= b && a > b || a >= b) { nt } else { ng }
}
const R_UIntNative = (ar_UIntNative_thr(3, 2), ar_UIntNative_wrap(18446744073709551615, 3), ar_UIntNative_sat(18446744073709551615, 3))
const P1 = 3 ** 4u64
@OverflowWrapping
const func pw(a: Int64, b: UInt64): Int64 { a ** b }
@OverflowSaturating
const func ps(a: Int64, b: UInt64): Int64 { a ** b }
const P2 = (pw(3, 60), ps(3, 60))
const func fl_Float16(a: Float16, b: Float16): Float16 {
    let s = a + b
    let d = s - b
    let m = d * b
    let q = m / b
    let p = q * q
    let ng = -p
    if (a == b || a != b && a < b || a <= b && a > b || a >= b) { ng } else { p }
}
const RF_Float16 = (fl_Float16(1.5, 2.5), fl_Float16(2.5, 1.5))
const func fl_Float32(a: Float32, b: Float32): Float32 {
    let s = a + b
    let d = s - b
    let m = d * b
    let q = m / b
    let p = q * q
    let ng = -p
    if (a == b || a != b && a < b || a <= b && a > b || a >= b) { ng } else { p }
}
const RF_Float32 = (fl_Float32(1.5, 2.5), fl_Float32(2.5, 1.5))
const func fl_Float64(a: Float64, b: Float64): Float64 {
    let s = a + b
    let d = s - b
    let m = d * b
    let q = m / b
    let p = q ** 2
    let ng = -p
    if (a == b || a != b && a < b || a <= b && a > b || a >= b) { ng } else { p }
}
const RF_Float64 = (fl_Float64(1.5, 2.5), fl_Float64(2.5, 1.5))
const func rn(a: Rune, b: Rune): Bool { a == b || a != b && a < b || a <= b && a > b || a >= b }
const func bl(a: Bool, b: Bool): Bool { (a == b) != (a != b) && !a || b }
const RR = (rn(r'a', r'b'), rn(r'b', r'a'), bl(true, false), bl(false, false))
main() { println(R_Int8[0]); println(R_Int8[1]); println(R_Int8[2]); println(R_Int16[0]); println(R_Int16[1]); println(R_Int16[2]); println(R_Int32[0]); println(R_Int32[1]); println(R_Int32[2]); println(R_Int64[0]); println(R_Int64[1]); println(R_Int64[2]); println(R_IntNative[0]); println(R_IntNative[1]); println(R_IntNative[2]); println(R_UInt8[0]); println(R_UInt8[1]); println(R_UInt8[2]); println(R_UInt16[0]); println(R_UInt16[1]); println(R_UInt16[2]); println(R_UInt32[0]); println(R_UInt32[1]); println(R_UInt32[2]); println(R_UInt64[0]); println(R_UInt64[1]); println(R_UInt64[2]); println(R_UIntNative[0]); println(R_UIntNative[1]); println(R_UIntNative[2]);println(RF_Float16[0]); println(RF_Float16[1]); println(RF_Float32[0]); println(RF_Float32[1]); println(RF_Float64[0]); println(RF_Float64[1]); println(P1); println(P2[0]); println(P2[1]); println(RR[0]); println(RR[1]); println(RR[2]); println(RR[3]) }
