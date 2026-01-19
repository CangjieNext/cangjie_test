// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
// DEPENDENCE: foo.c
// EXEC: %clang %clang_shared_opt foo.c -o %cffi_output
// EXEC: %compiler %cmp_opt_chir2hlir %cffi-link %verbose_opt %f -o %output
// EXEC-PIPE: %pwd_to_ld_path %run %run_opt %output %run_args | compare %f
// ASSERT: scan PassInt8ToDataI8F32: -10
// ASSERT: scan PassInt16ToDataI8F32: -200
// ASSERT: scan PassInt32ToDataI8F32: -3000
// ASSERT: scan PassInt64ToDataI8F32: -40000
// ASSERT: scan PassUInt8ToDataI8F32: 10
// ASSERT: scan PassUInt16ToDataI8F32: 200
// ASSERT: scan PassUInt32ToDataI8F32: 3000
// ASSERT: scan PassUInt64ToDataI8F32: 40000
// ASSERT: scan PassFloat32ToDataI8F32: 12.340000
// ASSERT: scan PassFloat64ToDataI8F32: 56.780000
// ASSERT: scan PassBoolToDataI8F32: 1
// ASSERT: scan PassInt8ToDataI32F32: -10
// ASSERT: scan PassInt16ToDataI32F32: -200
// ASSERT: scan PassInt32ToDataI32F32: -3000
// ASSERT: scan PassInt64ToDataI32F32: -40000
// ASSERT: scan PassUInt8ToDataI32F32: 10
// ASSERT: scan PassUInt16ToDataI32F32: 200
// ASSERT: scan PassUInt32ToDataI32F32: 3000
// ASSERT: scan PassUInt64ToDataI32F32: 40000
// ASSERT: scan PassFloat32ToDataI32F32: 12.340000
// ASSERT: scan PassFloat64ToDataI32F32: 56.780000
// ASSERT: scan PassBoolToDataI32F32: 1
// ASSERT: scan PassInt8ToDataI8F64: -10
// ASSERT: scan PassInt16ToDataI8F64: -200
// ASSERT: scan PassInt32ToDataI8F64: -3000
// ASSERT: scan PassInt64ToDataI8F64: -40000
// ASSERT: scan PassUInt8ToDataI8F64: 10
// ASSERT: scan PassUInt16ToDataI8F64: 200
// ASSERT: scan PassUInt32ToDataI8F64: 3000
// ASSERT: scan PassUInt64ToDataI8F64: 40000
// ASSERT: scan PassFloat32ToDataI8F64: 12.340000
// ASSERT: scan PassFloat64ToDataI8F64: 56.780000
// ASSERT: scan PassBoolToDataI8F64: 1
// ASSERT: scan PassInt8ToDataI32F64: -10
// ASSERT: scan PassInt16ToDataI32F64: -200
// ASSERT: scan PassInt32ToDataI32F64: -3000
// ASSERT: scan PassInt64ToDataI32F64: -40000
// ASSERT: scan PassUInt8ToDataI32F64: 10
// ASSERT: scan PassUInt16ToDataI32F64: 200
// ASSERT: scan PassUInt32ToDataI32F64: 3000
// ASSERT: scan PassUInt64ToDataI32F64: 40000
// ASSERT: scan PassFloat32ToDataI32F64: 12.340000
// ASSERT: scan PassFloat64ToDataI32F64: 56.780000
// ASSERT: scan PassBoolToDataI32F64: 1

foreign func PassInt8ToDataI8F32(v: Int8): DataI8F32
foreign func PassInt16ToDataI8F32(v: Int16): DataI8F32
foreign func PassInt32ToDataI8F32(v: Int32): DataI8F32
foreign func PassInt64ToDataI8F32(v: Int64): DataI8F32
foreign func PassUInt8ToDataI8F32(v: UInt8): DataI8F32
foreign func PassUInt16ToDataI8F32(v: UInt16): DataI8F32
foreign func PassUInt32ToDataI8F32(v: UInt32): DataI8F32
foreign func PassUInt64ToDataI8F32(v: UInt64): DataI8F32
foreign func PassFloat32ToDataI8F32(v: Float32): DataI8F32
foreign func PassFloat64ToDataI8F32(v: Float64): DataI8F32
foreign func PassBoolToDataI8F32(v: Bool): DataI8F32
foreign func PassInt8ToDataI32F32(v: Int8): DataI32F32
foreign func PassInt16ToDataI32F32(v: Int16): DataI32F32
foreign func PassInt32ToDataI32F32(v: Int32): DataI32F32
foreign func PassInt64ToDataI32F32(v: Int64): DataI32F32
foreign func PassUInt8ToDataI32F32(v: UInt8): DataI32F32
foreign func PassUInt16ToDataI32F32(v: UInt16): DataI32F32
foreign func PassUInt32ToDataI32F32(v: UInt32): DataI32F32
foreign func PassUInt64ToDataI32F32(v: UInt64): DataI32F32
foreign func PassFloat32ToDataI32F32(v: Float32): DataI32F32
foreign func PassFloat64ToDataI32F32(v: Float64): DataI32F32
foreign func PassBoolToDataI32F32(v: Bool): DataI32F32
foreign func PassInt8ToDataI8F64(v: Int8): DataI8F64
foreign func PassInt16ToDataI8F64(v: Int16): DataI8F64
foreign func PassInt32ToDataI8F64(v: Int32): DataI8F64
foreign func PassInt64ToDataI8F64(v: Int64): DataI8F64
foreign func PassUInt8ToDataI8F64(v: UInt8): DataI8F64
foreign func PassUInt16ToDataI8F64(v: UInt16): DataI8F64
foreign func PassUInt32ToDataI8F64(v: UInt32): DataI8F64
foreign func PassUInt64ToDataI8F64(v: UInt64): DataI8F64
foreign func PassFloat32ToDataI8F64(v: Float32): DataI8F64
foreign func PassFloat64ToDataI8F64(v: Float64): DataI8F64
foreign func PassBoolToDataI8F64(v: Bool): DataI8F64
foreign func PassInt8ToDataI32F64(v: Int8): DataI32F64
foreign func PassInt16ToDataI32F64(v: Int16): DataI32F64
foreign func PassInt32ToDataI32F64(v: Int32): DataI32F64
foreign func PassInt64ToDataI32F64(v: Int64): DataI32F64
foreign func PassUInt8ToDataI32F64(v: UInt8): DataI32F64
foreign func PassUInt16ToDataI32F64(v: UInt16): DataI32F64
foreign func PassUInt32ToDataI32F64(v: UInt32): DataI32F64
foreign func PassUInt64ToDataI32F64(v: UInt64): DataI32F64
foreign func PassFloat32ToDataI32F64(v: Float32): DataI32F64
foreign func PassFloat64ToDataI32F64(v: Float64): DataI32F64
foreign func PassBoolToDataI32F64(v: Bool): DataI32F64

@C
struct DataI8F32 {
    var a: Int8 = Int8(0)
    var b: Float32 = Float32(0)
}

@C
struct DataI32F32 {
    var a: Int32 = Int32(0)
    var b: Float32 = Float32(0)
}

@C
struct DataI8F64 {
    var a: Int8 = Int8(0)
    var b: Float64 = Float64(0)
}

@C
struct DataI32F64 {
    var a: Int32 = Int32(0)
    var b: Float64 = Float64(0)
}

unsafe main() {
    PassInt8ToDataI8F32(-10)
    PassInt16ToDataI8F32(-200)
    PassInt32ToDataI8F32(-3000)
    PassInt64ToDataI8F32(-40000)
    PassUInt8ToDataI8F32(10)
    PassUInt16ToDataI8F32(200)
    PassUInt32ToDataI8F32(3000)
    PassUInt64ToDataI8F32(40000)
    PassFloat32ToDataI8F32(12.34)
    PassFloat64ToDataI8F32(56.78)
    PassBoolToDataI8F32(true)
    PassInt8ToDataI32F32(-10)
    PassInt16ToDataI32F32(-200)
    PassInt32ToDataI32F32(-3000)
    PassInt64ToDataI32F32(-40000)
    PassUInt8ToDataI32F32(10)
    PassUInt16ToDataI32F32(200)
    PassUInt32ToDataI32F32(3000)
    PassUInt64ToDataI32F32(40000)
    PassFloat32ToDataI32F32(12.34)
    PassFloat64ToDataI32F32(56.78)
    PassBoolToDataI32F32(true)
    PassInt8ToDataI8F64(-10)
    PassInt16ToDataI8F64(-200)
    PassInt32ToDataI8F64(-3000)
    PassInt64ToDataI8F64(-40000)
    PassUInt8ToDataI8F64(10)
    PassUInt16ToDataI8F64(200)
    PassUInt32ToDataI8F64(3000)
    PassUInt64ToDataI8F64(40000)
    PassFloat32ToDataI8F64(12.34)
    PassFloat64ToDataI8F64(56.78)
    PassBoolToDataI8F64(true)
    PassInt8ToDataI32F64(-10)
    PassInt16ToDataI32F64(-200)
    PassInt32ToDataI32F64(-3000)
    PassInt64ToDataI32F64(-40000)
    PassUInt8ToDataI32F64(10)
    PassUInt16ToDataI32F64(200)
    PassUInt32ToDataI32F64(3000)
    PassUInt64ToDataI32F64(40000)
    PassFloat32ToDataI32F64(12.34)
    PassFloat64ToDataI32F64(56.78)
    PassBoolToDataI32F64(true)
    return 0
}
