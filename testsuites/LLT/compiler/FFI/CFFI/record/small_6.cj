// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
// DEPENDENCE: foo.c
// EXEC: %clang %clang_shared_opt foo.c -o %cffi_output
// EXEC: %compiler %cmp_opt %n.cj %cffi-link -o %n.%suffix
// EXEC-PIPE: %pwd_to_ld_path %run %run_opt %n.%suffix 2>&1 | compare %f
// EXEC: %compiler %cmp_opt %enableO2 %n.cj %cffi-link -o %n.%suffix
// EXEC-PIPE: %pwd_to_ld_path %run %run_opt %n.%suffix 2>&1 | compare %f
// ASSERT: scan 10, 10, 10, 10, 10, 10, 10, 10
// ASSERT: scan 20.000000, 20.000000, 20.000000, 20.000000, 20.000000, 20.000000, 20.000000, 20.000000
// ASSERT: scan -, -, -, -, 30, 30, 30, 30
// ASSERT: scan -, -, -, -, 40.000000, 40.000000, 40.000000, 40.000000

foreign {
    func ProcessDataI8F32(d: DataI8F32): DataI8F32
    func ProcessDataI32F32(d: DataI32F32): DataI32F32
    func ProcessDataI8F64(d: DataI8F64): DataI8F64
    func ProcessDataI32F64(d: DataI32F64): DataI32F64
    func ProcessDataI8F32I8F32(d: DataI8F32I8F32): DataI8F32I8F32
    func ProcessDataI32F32I32F32(d: DataI32F32I32F32): DataI32F32I32F32
    func ProcessDataI8F64I8F64(d: DataI8F64I8F64): DataI8F64I8F64
    func ProcessDataI32F64I32F64(d: DataI32F64I32F64): DataI32F64I32F64
}

@C
struct DataI8F32 {
    var a: Int8 = 0
    var b: Float32 = 0.0
}

@C
struct DataI32F32 {
    var a: Int32 = 0
    var b: Float32 = 0.0
}

@C
struct DataI8F64 {
    var a: Int8 = 0
    var b: Float64 = 0.0
}

@C
struct DataI32F64 {
    var a: Int32 = 0
    var b: Float64 = 0.0
}

@C
struct DataI8F32I8F32 {
    var a: Int8 = 0
    var b: Float32 = 0.0
    var c: Int8 = 0
    var d: Float32 = 0.0
}

@C
struct DataI32F32I32F32 {
    var a: Int32 = 0
    var b: Float32 = 0.0
    var c: Int32 = 0
    var d: Float32 = 0.0
}

@C
struct DataI8F64I8F64 {
    var a: Int8 = 0
    var b: Float64 = 0.0
    var c: Int8 = 0
    var d: Float64 = 0.0
}

@C
struct DataI32F64I32F64 {
    var a: Int32 = 0
    var b: Float64 = 0.0
    var c: Int32 = 0
    var d: Float64 = 0.0
}

unsafe main() {
    var d1 = ProcessDataI8F32(DataI8F32())
    var d2 = ProcessDataI32F32(DataI32F32())
    var d3 = ProcessDataI8F64(DataI8F64())
    var d4 = ProcessDataI32F64(DataI32F64())
    var d5 = ProcessDataI8F32I8F32(DataI8F32I8F32())
    var d6 = ProcessDataI32F32I32F32(DataI32F32I32F32())
    var d7 = ProcessDataI8F64I8F64(DataI8F64I8F64())
    var d8 = ProcessDataI32F64I32F64(DataI32F64I32F64())
    println("${d1.a}, ${d2.a}, ${d3.a}, ${d4.a}, ${d5.a}, ${d6.a}, ${d7.a}, ${d8.a}")
    println("${d1.b}, ${d2.b}, ${d3.b}, ${d4.b}, ${d5.b}, ${d6.b}, ${d7.b}, ${d8.b}")
    println("-, -, -, -, ${d5.c}, ${d6.c}, ${d7.c}, ${d8.c}")
    println("-, -, -, -, ${d5.d}, ${d6.d}, ${d7.d}, ${d8.d}")
}
