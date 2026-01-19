// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
// DEPENDENCE: foo.c
// EXEC: %clang %clang_shared_opt foo.c -o %cffi_output
// EXEC: %compiler %cmp_opt_chir2hlir %cffi-link %verbose_opt %f -o %output
// EXEC-PIPE: %pwd_to_ld_path %run %run_opt %output %run_args | compare %f
// ASSERT: scan PassInt8ToDataI16I32: -10
// ASSERT: scan PassInt16ToDataI16I32: -200
// ASSERT: scan PassInt32ToDataI16I32: -3000
// ASSERT: scan PassInt64ToDataI16I32: -40000
// ASSERT: scan PassUInt8ToDataI16I32: 10
// ASSERT: scan PassUInt16ToDataI16I32: 200
// ASSERT: scan PassUInt32ToDataI16I32: 3000
// ASSERT: scan PassUInt64ToDataI16I32: 40000
// ASSERT: scan PassFloat32ToDataI16I32: 12.340000
// ASSERT: scan PassFloat64ToDataI16I32: 56.780000
// ASSERT: scan PassBoolToDataI16I32: 1
// ASSERT: scan PassInt8ToDataI16I64: -10
// ASSERT: scan PassInt16ToDataI16I64: -200
// ASSERT: scan PassInt32ToDataI16I64: -3000
// ASSERT: scan PassInt64ToDataI16I64: -40000
// ASSERT: scan PassUInt8ToDataI16I64: 10
// ASSERT: scan PassUInt16ToDataI16I64: 200
// ASSERT: scan PassUInt32ToDataI16I64: 3000
// ASSERT: scan PassUInt64ToDataI16I64: 40000
// ASSERT: scan PassFloat32ToDataI16I64: 12.340000
// ASSERT: scan PassFloat64ToDataI16I64: 56.780000
// ASSERT: scan PassBoolToDataI16I64: 1
// ASSERT: scan PassInt8ToDataI32I64: -10
// ASSERT: scan PassInt16ToDataI32I64: -200
// ASSERT: scan PassInt32ToDataI32I64: -3000
// ASSERT: scan PassInt64ToDataI32I64: -40000
// ASSERT: scan PassUInt8ToDataI32I64: 10
// ASSERT: scan PassUInt16ToDataI32I64: 200
// ASSERT: scan PassUInt32ToDataI32I64: 3000
// ASSERT: scan PassUInt64ToDataI32I64: 40000
// ASSERT: scan PassFloat32ToDataI32I64: 12.340000
// ASSERT: scan PassFloat64ToDataI32I64: 56.780000
// ASSERT: scan PassBoolToDataI32I64: 1

foreign func PassInt8ToDataI16I32(v: Int8): DataI16I32
foreign func PassInt16ToDataI16I32(v: Int16): DataI16I32
foreign func PassInt32ToDataI16I32(v: Int32): DataI16I32
foreign func PassInt64ToDataI16I32(v: Int64): DataI16I32
foreign func PassUInt8ToDataI16I32(v: UInt8): DataI16I32
foreign func PassUInt16ToDataI16I32(v: UInt16): DataI16I32
foreign func PassUInt32ToDataI16I32(v: UInt32): DataI16I32
foreign func PassUInt64ToDataI16I32(v: UInt64): DataI16I32
foreign func PassFloat32ToDataI16I32(v: Float32): DataI16I32
foreign func PassFloat64ToDataI16I32(v: Float64): DataI16I32
foreign func PassBoolToDataI16I32(v: Bool): DataI16I32
foreign func PassInt8ToDataI16I64(v: Int8): DataI16I64
foreign func PassInt16ToDataI16I64(v: Int16): DataI16I64
foreign func PassInt32ToDataI16I64(v: Int32): DataI16I64
foreign func PassInt64ToDataI16I64(v: Int64): DataI16I64
foreign func PassUInt8ToDataI16I64(v: UInt8): DataI16I64
foreign func PassUInt16ToDataI16I64(v: UInt16): DataI16I64
foreign func PassUInt32ToDataI16I64(v: UInt32): DataI16I64
foreign func PassUInt64ToDataI16I64(v: UInt64): DataI16I64
foreign func PassFloat32ToDataI16I64(v: Float32): DataI16I64
foreign func PassFloat64ToDataI16I64(v: Float64): DataI16I64
foreign func PassBoolToDataI16I64(v: Bool): DataI16I64
foreign func PassInt8ToDataI32I64(v: Int8): DataI32I64
foreign func PassInt16ToDataI32I64(v: Int16): DataI32I64
foreign func PassInt32ToDataI32I64(v: Int32): DataI32I64
foreign func PassInt64ToDataI32I64(v: Int64): DataI32I64
foreign func PassUInt8ToDataI32I64(v: UInt8): DataI32I64
foreign func PassUInt16ToDataI32I64(v: UInt16): DataI32I64
foreign func PassUInt32ToDataI32I64(v: UInt32): DataI32I64
foreign func PassUInt64ToDataI32I64(v: UInt64): DataI32I64
foreign func PassFloat32ToDataI32I64(v: Float32): DataI32I64
foreign func PassFloat64ToDataI32I64(v: Float64): DataI32I64
foreign func PassBoolToDataI32I64(v: Bool): DataI32I64

@C
struct DataI16I32 {
    var a: Int16 = Int16(0)
    var b: Int32 = Int32(0)
}

@C
struct DataI16I64 {
    var a: Int16 = Int16(0)
    var b: Int64 = Int64(0)
}

@C
struct DataI32I64 {
    var a: Int32 = Int32(0)
    var b: Int64 = Int64(0)
}

unsafe main() {
    PassInt8ToDataI16I32(-10)
    PassInt16ToDataI16I32(-200)
    PassInt32ToDataI16I32(-3000)
    PassInt64ToDataI16I32(-40000)
    PassUInt8ToDataI16I32(10)
    PassUInt16ToDataI16I32(200)
    PassUInt32ToDataI16I32(3000)
    PassUInt64ToDataI16I32(40000)
    PassFloat32ToDataI16I32(12.34)
    PassFloat64ToDataI16I32(56.78)
    PassBoolToDataI16I32(true)
    PassInt8ToDataI16I64(-10)
    PassInt16ToDataI16I64(-200)
    PassInt32ToDataI16I64(-3000)
    PassInt64ToDataI16I64(-40000)
    PassUInt8ToDataI16I64(10)
    PassUInt16ToDataI16I64(200)
    PassUInt32ToDataI16I64(3000)
    PassUInt64ToDataI16I64(40000)
    PassFloat32ToDataI16I64(12.34)
    PassFloat64ToDataI16I64(56.78)
    PassBoolToDataI16I64(true)
    PassInt8ToDataI32I64(-10)
    PassInt16ToDataI32I64(-200)
    PassInt32ToDataI32I64(-3000)
    PassInt64ToDataI32I64(-40000)
    PassUInt8ToDataI32I64(10)
    PassUInt16ToDataI32I64(200)
    PassUInt32ToDataI32I64(3000)
    PassUInt64ToDataI32I64(40000)
    PassFloat32ToDataI32I64(12.34)
    PassFloat64ToDataI32I64(56.78)
    PassBoolToDataI32I64(true)
    return 0
}
