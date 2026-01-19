// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
// DEPENDENCE: foo.c
// EXEC: %clang %clang_shared_opt foo.c -o %cffi_output
// EXEC: %compiler %cmp_opt_chir2hlir %cffi-link %verbose_opt %f -o %output
// EXEC-PIPE: %pwd_to_ld_path %run %run_opt %output %run_args | compare %f
// ASSERT: scan PassInt8ToDataI8: -10
// ASSERT: scan PassInt16ToDataI8: -200
// ASSERT: scan PassInt32ToDataI8: -3000
// ASSERT: scan PassInt64ToDataI8: -40000
// ASSERT: scan PassUInt8ToDataI8: 10
// ASSERT: scan PassUInt16ToDataI8: 200
// ASSERT: scan PassUInt32ToDataI8: 3000
// ASSERT: scan PassUInt64ToDataI8: 40000
// ASSERT: scan PassFloat32ToDataI8: 12.340000
// ASSERT: scan PassFloat64ToDataI8: 56.780000
// ASSERT: scan PassBoolToDataI8: 1
// ASSERT: scan PassInt8ToDataI16: -10
// ASSERT: scan PassInt16ToDataI16: -200
// ASSERT: scan PassInt32ToDataI16: -3000
// ASSERT: scan PassInt64ToDataI16: -40000
// ASSERT: scan PassUInt8ToDataI16: 10
// ASSERT: scan PassUInt16ToDataI16: 200
// ASSERT: scan PassUInt32ToDataI16: 3000
// ASSERT: scan PassUInt64ToDataI16: 40000
// ASSERT: scan PassFloat32ToDataI16: 12.340000
// ASSERT: scan PassFloat64ToDataI16: 56.780000
// ASSERT: scan PassBoolToDataI16: 1
// ASSERT: scan PassInt8ToDataI32: -10
// ASSERT: scan PassInt16ToDataI32: -200
// ASSERT: scan PassInt32ToDataI32: -3000
// ASSERT: scan PassInt64ToDataI32: -40000
// ASSERT: scan PassUInt8ToDataI32: 10
// ASSERT: scan PassUInt16ToDataI32: 200
// ASSERT: scan PassUInt32ToDataI32: 3000
// ASSERT: scan PassUInt64ToDataI32: 40000
// ASSERT: scan PassFloat32ToDataI32: 12.340000
// ASSERT: scan PassFloat64ToDataI32: 56.780000
// ASSERT: scan PassBoolToDataI32: 1
// ASSERT: scan PassInt8ToDataI64: -10
// ASSERT: scan PassInt16ToDataI64: -200
// ASSERT: scan PassInt32ToDataI64: -3000
// ASSERT: scan PassInt64ToDataI64: -40000
// ASSERT: scan PassUInt8ToDataI64: 10
// ASSERT: scan PassUInt16ToDataI64: 200
// ASSERT: scan PassUInt32ToDataI64: 3000
// ASSERT: scan PassUInt64ToDataI64: 40000
// ASSERT: scan PassFloat32ToDataI64: 12.340000
// ASSERT: scan PassFloat64ToDataI64: 56.780000
// ASSERT: scan PassBoolToDataI64: 1

foreign func PassInt8ToDataI8(v: Int8): DataI8
foreign func PassInt16ToDataI8(v: Int16): DataI8
foreign func PassInt32ToDataI8(v: Int32): DataI8
foreign func PassInt64ToDataI8(v: Int64): DataI8
foreign func PassUInt8ToDataI8(v: UInt8): DataI8
foreign func PassUInt16ToDataI8(v: UInt16): DataI8
foreign func PassUInt32ToDataI8(v: UInt32): DataI8
foreign func PassUInt64ToDataI8(v: UInt64): DataI8
foreign func PassFloat32ToDataI8(v: Float32): DataI8
foreign func PassFloat64ToDataI8(v: Float64): DataI8
foreign func PassBoolToDataI8(v: Bool): DataI8
foreign func PassInt8ToDataI16(v: Int8): DataI16
foreign func PassInt16ToDataI16(v: Int16): DataI16
foreign func PassInt32ToDataI16(v: Int32): DataI16
foreign func PassInt64ToDataI16(v: Int64): DataI16
foreign func PassUInt8ToDataI16(v: UInt8): DataI16
foreign func PassUInt16ToDataI16(v: UInt16): DataI16
foreign func PassUInt32ToDataI16(v: UInt32): DataI16
foreign func PassUInt64ToDataI16(v: UInt64): DataI16
foreign func PassFloat32ToDataI16(v: Float32): DataI16
foreign func PassFloat64ToDataI16(v: Float64): DataI16
foreign func PassBoolToDataI16(v: Bool): DataI16
foreign func PassInt8ToDataI32(v: Int8): DataI32
foreign func PassInt16ToDataI32(v: Int16): DataI32
foreign func PassInt32ToDataI32(v: Int32): DataI32
foreign func PassInt64ToDataI32(v: Int64): DataI32
foreign func PassUInt8ToDataI32(v: UInt8): DataI32
foreign func PassUInt16ToDataI32(v: UInt16): DataI32
foreign func PassUInt32ToDataI32(v: UInt32): DataI32
foreign func PassUInt64ToDataI32(v: UInt64): DataI32
foreign func PassFloat32ToDataI32(v: Float32): DataI32
foreign func PassFloat64ToDataI32(v: Float64): DataI32
foreign func PassBoolToDataI32(v: Bool): DataI32
foreign func PassInt8ToDataI64(v: Int8): DataI64
foreign func PassInt16ToDataI64(v: Int16): DataI64
foreign func PassInt32ToDataI64(v: Int32): DataI64
foreign func PassInt64ToDataI64(v: Int64): DataI64
foreign func PassUInt8ToDataI64(v: UInt8): DataI64
foreign func PassUInt16ToDataI64(v: UInt16): DataI64
foreign func PassUInt32ToDataI64(v: UInt32): DataI64
foreign func PassUInt64ToDataI64(v: UInt64): DataI64
foreign func PassFloat32ToDataI64(v: Float32): DataI64
foreign func PassFloat64ToDataI64(v: Float64): DataI64
foreign func PassBoolToDataI64(v: Bool): DataI64

@C
struct DataI8 {
    var a: Int8 = Int8(0)
}

@C
struct DataI16 {
    var a: Int16 = Int16(0)
}

@C
struct DataI32 {
    var a: Int32 = Int32(0)
}

@C
struct DataI64 {
    var a: Int64 = Int64(0)
}

unsafe main() {
    PassInt8ToDataI8(-10)
    PassInt16ToDataI8(-200)
    PassInt32ToDataI8(-3000)
    PassInt64ToDataI8(-40000)
    PassUInt8ToDataI8(10)
    PassUInt16ToDataI8(200)
    PassUInt32ToDataI8(3000)
    PassUInt64ToDataI8(40000)
    PassFloat32ToDataI8(12.34)
    PassFloat64ToDataI8(56.78)
    PassBoolToDataI8(true)
    PassInt8ToDataI16(-10)
    PassInt16ToDataI16(-200)
    PassInt32ToDataI16(-3000)
    PassInt64ToDataI16(-40000)
    PassUInt8ToDataI16(10)
    PassUInt16ToDataI16(200)
    PassUInt32ToDataI16(3000)
    PassUInt64ToDataI16(40000)
    PassFloat32ToDataI16(12.34)
    PassFloat64ToDataI16(56.78)
    PassBoolToDataI16(true)
    PassInt8ToDataI32(-10)
    PassInt16ToDataI32(-200)
    PassInt32ToDataI32(-3000)
    PassInt64ToDataI32(-40000)
    PassUInt8ToDataI32(10)
    PassUInt16ToDataI32(200)
    PassUInt32ToDataI32(3000)
    PassUInt64ToDataI32(40000)
    PassFloat32ToDataI32(12.34)
    PassFloat64ToDataI32(56.78)
    PassBoolToDataI32(true)
    PassInt8ToDataI64(-10)
    PassInt16ToDataI64(-200)
    PassInt32ToDataI64(-3000)
    PassInt64ToDataI64(-40000)
    PassUInt8ToDataI64(10)
    PassUInt16ToDataI64(200)
    PassUInt32ToDataI64(3000)
    PassUInt64ToDataI64(40000)
    PassFloat32ToDataI64(12.34)
    PassFloat64ToDataI64(56.78)
    PassBoolToDataI64(true)
    return 0
}
