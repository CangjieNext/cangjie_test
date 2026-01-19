// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
// DEPENDENCE: foo.c
// EXEC: %clang %clang_shared_opt foo.c -o %cffi_output
// EXEC: %compiler %cmp_opt_chir2hlir %cffi-link %verbose_opt %f -o %output
// EXEC-PIPE: %pwd_to_ld_path %run %run_opt %output %run_args | compare %f
// ASSERT: scan PassInt8ToDataI8I16: -10
// ASSERT: scan PassInt16ToDataI8I16: -200
// ASSERT: scan PassInt32ToDataI8I16: -3000
// ASSERT: scan PassInt64ToDataI8I16: -40000
// ASSERT: scan PassUInt8ToDataI8I16: 10
// ASSERT: scan PassUInt16ToDataI8I16: 200
// ASSERT: scan PassUInt32ToDataI8I16: 3000
// ASSERT: scan PassUInt64ToDataI8I16: 40000
// ASSERT: scan PassFloat32ToDataI8I16: 12.340000
// ASSERT: scan PassFloat64ToDataI8I16: 56.780000
// ASSERT: scan PassBoolToDataI8I16: 1
// ASSERT: scan PassInt8ToDataI8I32: -10
// ASSERT: scan PassInt16ToDataI8I32: -200
// ASSERT: scan PassInt32ToDataI8I32: -3000
// ASSERT: scan PassInt64ToDataI8I32: -40000
// ASSERT: scan PassUInt8ToDataI8I32: 10
// ASSERT: scan PassUInt16ToDataI8I32: 200
// ASSERT: scan PassUInt32ToDataI8I32: 3000
// ASSERT: scan PassUInt64ToDataI8I32: 40000
// ASSERT: scan PassFloat32ToDataI8I32: 12.340000
// ASSERT: scan PassFloat64ToDataI8I32: 56.780000
// ASSERT: scan PassBoolToDataI8I32: 1
// ASSERT: scan PassInt8ToDataI8I64: -10
// ASSERT: scan PassInt16ToDataI8I64: -200
// ASSERT: scan PassInt32ToDataI8I64: -3000
// ASSERT: scan PassInt64ToDataI8I64: -40000
// ASSERT: scan PassUInt8ToDataI8I64: 10
// ASSERT: scan PassUInt16ToDataI8I64: 200
// ASSERT: scan PassUInt32ToDataI8I64: 3000
// ASSERT: scan PassUInt64ToDataI8I64: 40000
// ASSERT: scan PassFloat32ToDataI8I64: 12.340000
// ASSERT: scan PassFloat64ToDataI8I64: 56.780000
// ASSERT: scan PassBoolToDataI8I64: 1

foreign func PassInt8ToDataI8I16(v: Int8): DataI8I16
foreign func PassInt16ToDataI8I16(v: Int16): DataI8I16
foreign func PassInt32ToDataI8I16(v: Int32): DataI8I16
foreign func PassInt64ToDataI8I16(v: Int64): DataI8I16
foreign func PassUInt8ToDataI8I16(v: UInt8): DataI8I16
foreign func PassUInt16ToDataI8I16(v: UInt16): DataI8I16
foreign func PassUInt32ToDataI8I16(v: UInt32): DataI8I16
foreign func PassUInt64ToDataI8I16(v: UInt64): DataI8I16
foreign func PassFloat32ToDataI8I16(v: Float32): DataI8I16
foreign func PassFloat64ToDataI8I16(v: Float64): DataI8I16
foreign func PassBoolToDataI8I16(v: Bool): DataI8I16
foreign func PassInt8ToDataI8I32(v: Int8): DataI8I32
foreign func PassInt16ToDataI8I32(v: Int16): DataI8I32
foreign func PassInt32ToDataI8I32(v: Int32): DataI8I32
foreign func PassInt64ToDataI8I32(v: Int64): DataI8I32
foreign func PassUInt8ToDataI8I32(v: UInt8): DataI8I32
foreign func PassUInt16ToDataI8I32(v: UInt16): DataI8I32
foreign func PassUInt32ToDataI8I32(v: UInt32): DataI8I32
foreign func PassUInt64ToDataI8I32(v: UInt64): DataI8I32
foreign func PassFloat32ToDataI8I32(v: Float32): DataI8I32
foreign func PassFloat64ToDataI8I32(v: Float64): DataI8I32
foreign func PassBoolToDataI8I32(v: Bool): DataI8I32
foreign func PassInt8ToDataI8I64(v: Int8): DataI8I64
foreign func PassInt16ToDataI8I64(v: Int16): DataI8I64
foreign func PassInt32ToDataI8I64(v: Int32): DataI8I64
foreign func PassInt64ToDataI8I64(v: Int64): DataI8I64
foreign func PassUInt8ToDataI8I64(v: UInt8): DataI8I64
foreign func PassUInt16ToDataI8I64(v: UInt16): DataI8I64
foreign func PassUInt32ToDataI8I64(v: UInt32): DataI8I64
foreign func PassUInt64ToDataI8I64(v: UInt64): DataI8I64
foreign func PassFloat32ToDataI8I64(v: Float32): DataI8I64
foreign func PassFloat64ToDataI8I64(v: Float64): DataI8I64
foreign func PassBoolToDataI8I64(v: Bool): DataI8I64

@C
struct DataI8I16 {
    var a: Int8 = Int8(0)
    var b: Int16 = Int16(0)
}

@C
struct DataI8I32 {
    var a: Int8 = Int8(0)
    var b: Int32 = Int32(0)
}

@C
struct DataI8I64 {
    var a: Int8 = Int8(0)
    var b: Int64 = Int64(0)
}

unsafe main() {
    PassInt8ToDataI8I16(-10)
    PassInt16ToDataI8I16(-200)
    PassInt32ToDataI8I16(-3000)
    PassInt64ToDataI8I16(-40000)
    PassUInt8ToDataI8I16(10)
    PassUInt16ToDataI8I16(200)
    PassUInt32ToDataI8I16(3000)
    PassUInt64ToDataI8I16(40000)
    PassFloat32ToDataI8I16(12.34)
    PassFloat64ToDataI8I16(56.78)
    PassBoolToDataI8I16(true)
    PassInt8ToDataI8I32(-10)
    PassInt16ToDataI8I32(-200)
    PassInt32ToDataI8I32(-3000)
    PassInt64ToDataI8I32(-40000)
    PassUInt8ToDataI8I32(10)
    PassUInt16ToDataI8I32(200)
    PassUInt32ToDataI8I32(3000)
    PassUInt64ToDataI8I32(40000)
    PassFloat32ToDataI8I32(12.34)
    PassFloat64ToDataI8I32(56.78)
    PassBoolToDataI8I32(true)
    PassInt8ToDataI8I64(-10)
    PassInt16ToDataI8I64(-200)
    PassInt32ToDataI8I64(-3000)
    PassInt64ToDataI8I64(-40000)
    PassUInt8ToDataI8I64(10)
    PassUInt16ToDataI8I64(200)
    PassUInt32ToDataI8I64(3000)
    PassUInt64ToDataI8I64(40000)
    PassFloat32ToDataI8I64(12.34)
    PassFloat64ToDataI8I64(56.78)
    PassBoolToDataI8I64(true)
    return 0
}
