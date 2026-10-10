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

// Tests arithmetic inside `try` in const functions, which uses the exception-capable opcodes.

const func tr_Int8(a: Int8, b: Int8): Int8 {
    try {
        let s = a + b
        let d = s - b
        let m = d * b
        let q = m / b
        let r = q % b
        let ng = -r
        let sh = (ng << b) >> b
        let bw = (sh & b) | (sh ^ b)
        if (a < b) { bw } else { !bw }
    } catch (e: Exception) { 0 }
}
const func tr_Int16(a: Int16, b: Int16): Int16 {
    try {
        let s = a + b
        let d = s - b
        let m = d * b
        let q = m / b
        let r = q % b
        let ng = -r
        let sh = (ng << b) >> b
        let bw = (sh & b) | (sh ^ b)
        if (a < b) { bw } else { !bw }
    } catch (e: Exception) { 0 }
}
const func tr_Int32(a: Int32, b: Int32): Int32 {
    try {
        let s = a + b
        let d = s - b
        let m = d * b
        let q = m / b
        let r = q % b
        let ng = -r
        let sh = (ng << b) >> b
        let bw = (sh & b) | (sh ^ b)
        if (a < b) { bw } else { !bw }
    } catch (e: Exception) { 0 }
}
const func tr_Int64(a: Int64, b: Int64): Int64 {
    try {
        let s = a + b
        let d = s - b
        let m = d * b
        let q = m / b
        let r = q % b
        let ng = -r
        let sh = (ng << b) >> b
        let bw = (sh & b) | (sh ^ b)
        if (a < b) { bw } else { !bw }
    } catch (e: Exception) { 0 }
}
const func tr_IntNative(a: IntNative, b: IntNative): IntNative {
    try {
        let s = a + b
        let d = s - b
        let m = d * b
        let q = m / b
        let r = q % b
        let ng = -r
        let sh = (ng << b) >> b
        let bw = (sh & b) | (sh ^ b)
        if (a < b) { bw } else { !bw }
    } catch (e: Exception) { 0 }
}
const func tr_UInt8(a: UInt8, b: UInt8): UInt8 {
    try {
        let s = a + b
        let d = s - b
        let m = d * b
        let q = m / b
        let r = q % b
        let ng = r
        let sh = (ng << b) >> b
        let bw = (sh & b) | (sh ^ b)
        if (a < b) { bw } else { !bw }
    } catch (e: Exception) { 0 }
}
const func tr_UInt16(a: UInt16, b: UInt16): UInt16 {
    try {
        let s = a + b
        let d = s - b
        let m = d * b
        let q = m / b
        let r = q % b
        let ng = r
        let sh = (ng << b) >> b
        let bw = (sh & b) | (sh ^ b)
        if (a < b) { bw } else { !bw }
    } catch (e: Exception) { 0 }
}
const func tr_UInt32(a: UInt32, b: UInt32): UInt32 {
    try {
        let s = a + b
        let d = s - b
        let m = d * b
        let q = m / b
        let r = q % b
        let ng = r
        let sh = (ng << b) >> b
        let bw = (sh & b) | (sh ^ b)
        if (a < b) { bw } else { !bw }
    } catch (e: Exception) { 0 }
}
const func tr_UInt64(a: UInt64, b: UInt64): UInt64 {
    try {
        let s = a + b
        let d = s - b
        let m = d * b
        let q = m / b
        let r = q % b
        let ng = r
        let sh = (ng << b) >> b
        let bw = (sh & b) | (sh ^ b)
        if (a < b) { bw } else { !bw }
    } catch (e: Exception) { 0 }
}
const func tr_UIntNative(a: UIntNative, b: UIntNative): UIntNative {
    try {
        let s = a + b
        let d = s - b
        let m = d * b
        let q = m / b
        let r = q % b
        let ng = r
        let sh = (ng << b) >> b
        let bw = (sh & b) | (sh ^ b)
        if (a < b) { bw } else { !bw }
    } catch (e: Exception) { 0 }
}
const func tr_pow(a: Int64, b: UInt64): Int64 { try { a ** b } catch (e: Exception) { 0 } }
const func tr_Float16(a: Float16, b: Float16): Float16 {
    try { let s = a + b; let d = s - b; let m = d * b; let q = m / b; let p = q * q; if (a < b) { -p } else { p } } catch (e: Exception) { 0.0 }
}
const func tr_Float32(a: Float32, b: Float32): Float32 {
    try { let s = a + b; let d = s - b; let m = d * b; let q = m / b; let p = q * q; if (a < b) { -p } else { p } } catch (e: Exception) { 0.0 }
}
const func tr_Float64(a: Float64, b: Float64): Float64 {
    try { let s = a + b; let d = s - b; let m = d * b; let q = m / b; let p = q ** 2; if (a < b) { -p } else { p } } catch (e: Exception) { 0.0 }
}
const TR = (tr_Int8(5, 2), tr_Int16(5, 2), tr_Int32(5, 2), tr_Int64(5, 2), tr_IntNative(5, 2), tr_UInt8(5, 2), tr_UInt16(5, 2), tr_UInt32(5, 2), tr_UInt64(5, 2), tr_UIntNative(5, 2), tr_pow(2, 10), tr_Float16(1.5, 2.5), tr_Float32(1.5, 2.5), tr_Float64(1.5, 2.5))
main() { println(TR[0]); println(TR[10]); println(TR[13]) }
