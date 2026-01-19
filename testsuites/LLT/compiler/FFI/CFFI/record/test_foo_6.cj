// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
// DEPENDENCE: foo.c
// EXEC: %clang %clang_shared_opt foo.c -o %cffi_output
// EXEC: %compiler %cmp_opt_chir2hlir %cffi-link %verbose_opt %f -o %output
// EXEC-PIPE: %pwd_to_ld_path %run %run_opt %output %run_args | compare %f
// ASSERT: scan PassInt8ToDataF32: -10
// ASSERT: scan PassInt16ToDataF32: -200
// ASSERT: scan PassInt32ToDataF32: -3000
// ASSERT: scan PassInt64ToDataF32: -40000
// ASSERT: scan PassUInt8ToDataF32: 10
// ASSERT: scan PassUInt16ToDataF32: 200
// ASSERT: scan PassUInt32ToDataF32: 3000
// ASSERT: scan PassUInt64ToDataF32: 40000
// ASSERT: scan PassFloat32ToDataF32: 12.340000
// ASSERT: scan PassFloat64ToDataF32: 56.780000
// ASSERT: scan PassBoolToDataF32: 1
// ASSERT: scan PassInt8ToDataF64: -10
// ASSERT: scan PassInt16ToDataF64: -200
// ASSERT: scan PassInt32ToDataF64: -3000
// ASSERT: scan PassInt64ToDataF64: -40000
// ASSERT: scan PassUInt8ToDataF64: 10
// ASSERT: scan PassUInt16ToDataF64: 200
// ASSERT: scan PassUInt32ToDataF64: 3000
// ASSERT: scan PassUInt64ToDataF64: 40000
// ASSERT: scan PassFloat32ToDataF64: 12.340000
// ASSERT: scan PassFloat64ToDataF64: 56.780000
// ASSERT: scan PassBoolToDataF64: 1
// ASSERT: scan PassInt8ToDataF32F32: -10
// ASSERT: scan PassInt16ToDataF32F32: -200
// ASSERT: scan PassInt32ToDataF32F32: -3000
// ASSERT: scan PassInt64ToDataF32F32: -40000
// ASSERT: scan PassUInt8ToDataF32F32: 10
// ASSERT: scan PassUInt16ToDataF32F32: 200
// ASSERT: scan PassUInt32ToDataF32F32: 3000
// ASSERT: scan PassUInt64ToDataF32F32: 40000
// ASSERT: scan PassFloat32ToDataF32F32: 12.340000
// ASSERT: scan PassFloat64ToDataF32F32: 56.780000
// ASSERT: scan PassBoolToDataF32F32: 1
// ASSERT: scan PassInt8ToDataF64F64: -10
// ASSERT: scan PassInt16ToDataF64F64: -200
// ASSERT: scan PassInt32ToDataF64F64: -3000
// ASSERT: scan PassInt64ToDataF64F64: -40000
// ASSERT: scan PassUInt8ToDataF64F64: 10
// ASSERT: scan PassUInt16ToDataF64F64: 200
// ASSERT: scan PassUInt32ToDataF64F64: 3000
// ASSERT: scan PassUInt64ToDataF64F64: 40000
// ASSERT: scan PassFloat32ToDataF64F64: 12.340000
// ASSERT: scan PassFloat64ToDataF64F64: 56.780000
// ASSERT: scan PassBoolToDataF64F64: 1

foreign func PassInt8ToDataF32(v: Int8): DataF32
foreign func PassInt16ToDataF32(v: Int16): DataF32
foreign func PassInt32ToDataF32(v: Int32): DataF32
foreign func PassInt64ToDataF32(v: Int64): DataF32
foreign func PassUInt8ToDataF32(v: UInt8): DataF32
foreign func PassUInt16ToDataF32(v: UInt16): DataF32
foreign func PassUInt32ToDataF32(v: UInt32): DataF32
foreign func PassUInt64ToDataF32(v: UInt64): DataF32
foreign func PassFloat32ToDataF32(v: Float32): DataF32
foreign func PassFloat64ToDataF32(v: Float64): DataF32
foreign func PassBoolToDataF32(v: Bool): DataF32
foreign func PassInt8ToDataF64(v: Int8): DataF64
foreign func PassInt16ToDataF64(v: Int16): DataF64
foreign func PassInt32ToDataF64(v: Int32): DataF64
foreign func PassInt64ToDataF64(v: Int64): DataF64
foreign func PassUInt8ToDataF64(v: UInt8): DataF64
foreign func PassUInt16ToDataF64(v: UInt16): DataF64
foreign func PassUInt32ToDataF64(v: UInt32): DataF64
foreign func PassUInt64ToDataF64(v: UInt64): DataF64
foreign func PassFloat32ToDataF64(v: Float32): DataF64
foreign func PassFloat64ToDataF64(v: Float64): DataF64
foreign func PassBoolToDataF64(v: Bool): DataF64
foreign func PassInt8ToDataF32F32(v: Int8): DataF32F32
foreign func PassInt16ToDataF32F32(v: Int16): DataF32F32
foreign func PassInt32ToDataF32F32(v: Int32): DataF32F32
foreign func PassInt64ToDataF32F32(v: Int64): DataF32F32
foreign func PassUInt8ToDataF32F32(v: UInt8): DataF32F32
foreign func PassUInt16ToDataF32F32(v: UInt16): DataF32F32
foreign func PassUInt32ToDataF32F32(v: UInt32): DataF32F32
foreign func PassUInt64ToDataF32F32(v: UInt64): DataF32F32
foreign func PassFloat32ToDataF32F32(v: Float32): DataF32F32
foreign func PassFloat64ToDataF32F32(v: Float64): DataF32F32
foreign func PassBoolToDataF32F32(v: Bool): DataF32F32
foreign func PassInt8ToDataF64F64(v: Int8): DataF64F64
foreign func PassInt16ToDataF64F64(v: Int16): DataF64F64
foreign func PassInt32ToDataF64F64(v: Int32): DataF64F64
foreign func PassInt64ToDataF64F64(v: Int64): DataF64F64
foreign func PassUInt8ToDataF64F64(v: UInt8): DataF64F64
foreign func PassUInt16ToDataF64F64(v: UInt16): DataF64F64
foreign func PassUInt32ToDataF64F64(v: UInt32): DataF64F64
foreign func PassUInt64ToDataF64F64(v: UInt64): DataF64F64
foreign func PassFloat32ToDataF64F64(v: Float32): DataF64F64
foreign func PassFloat64ToDataF64F64(v: Float64): DataF64F64
foreign func PassBoolToDataF64F64(v: Bool): DataF64F64

@C
struct DataF32 {
    var a: Float32 = Float32(0)
}

@C
struct DataF64 {
    var a: Float64 = Float64(0)
}

@C
struct DataF32F32 {
    var a: Float32 = Float32(0)
    var b: Float32 = Float32(0)
}

@C
struct DataF64F64 {
    var a: Float64 = Float64(0)
    var b: Float64 = Float64(0)
}

unsafe main() {
    PassInt8ToDataF32(-10)
    PassInt16ToDataF32(-200)
    PassInt32ToDataF32(-3000)
    PassInt64ToDataF32(-40000)
    PassUInt8ToDataF32(10)
    PassUInt16ToDataF32(200)
    PassUInt32ToDataF32(3000)
    PassUInt64ToDataF32(40000)
    PassFloat32ToDataF32(12.34)
    PassFloat64ToDataF32(56.78)
    PassBoolToDataF32(true)
    PassInt8ToDataF64(-10)
    PassInt16ToDataF64(-200)
    PassInt32ToDataF64(-3000)
    PassInt64ToDataF64(-40000)
    PassUInt8ToDataF64(10)
    PassUInt16ToDataF64(200)
    PassUInt32ToDataF64(3000)
    PassUInt64ToDataF64(40000)
    PassFloat32ToDataF64(12.34)
    PassFloat64ToDataF64(56.78)
    PassBoolToDataF64(true)
    PassInt8ToDataF32F32(-10)
    PassInt16ToDataF32F32(-200)
    PassInt32ToDataF32F32(-3000)
    PassInt64ToDataF32F32(-40000)
    PassUInt8ToDataF32F32(10)
    PassUInt16ToDataF32F32(200)
    PassUInt32ToDataF32F32(3000)
    PassUInt64ToDataF32F32(40000)
    PassFloat32ToDataF32F32(12.34)
    PassFloat64ToDataF32F32(56.78)
    PassBoolToDataF32F32(true)
    PassInt8ToDataF64F64(-10)
    PassInt16ToDataF64F64(-200)
    PassInt32ToDataF64F64(-3000)
    PassInt64ToDataF64F64(-40000)
    PassUInt8ToDataF64F64(10)
    PassUInt16ToDataF64F64(200)
    PassUInt32ToDataF64F64(3000)
    PassUInt64ToDataF64F64(40000)
    PassFloat32ToDataF64F64(12.34)
    PassFloat64ToDataF64F64(56.78)
    PassBoolToDataF64F64(true)
    return 0
}
