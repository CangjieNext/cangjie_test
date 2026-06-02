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
// ASSERT: scan 10.000000, 10.000000, 10.000000, 10.000000, 10.000000, 10.000000, 10.000000, 10.000000
// ASSERT: scan -, 20.000000, 20.000000, 20.000000, 20.000000, -, 20.000000, 20.000000
// ASSERT: scan -, -, 30.000000, 30.000000, 30.000000, -, -, 30.000000
// ASSERT: scan -, -, -, 40.000000, 40.000000, -, -, -
// ASSERT: scan -, -, -, -, 50.000000, -, -, -

foreign {
    func ProcessDataF32(d: DataF32): DataF32
    func ProcessDataF32F32(d: DataF32F32): DataF32F32
    func ProcessDataF32F32F32(d: DataF32F32F32): DataF32F32F32
    func ProcessDataF32F32F32F32(d: DataF32F32F32F32): DataF32F32F32F32
    func ProcessDataF32F32F32F32F32(d: DataF32F32F32F32F32): DataF32F32F32F32F32
    func ProcessDataF64(d: DataF64): DataF64
    func ProcessDataF64F64(d: DataF64F64): DataF64F64
    func ProcessDataF64F64F64(d: DataF64F64F64): DataF64F64F64
}

@C
struct DataF32 {
    var a: Float32 = 0.0
}

@C
struct DataF64 {
    var a: Float64 = 0.0
}

@C
struct DataF32F32 {
    var a: Float32 = 0.0
    var b: Float32 = 0.0
}

@C
struct DataF64F64 {
    var a: Float64 = 0.0
    var b: Float64 = 0.0
}

@C
struct DataF32F32F32 {
    var a: Float32 = 0.0
    var b: Float32 = 0.0
    var c: Float32 = 0.0
}

@C
struct DataF64F64F64 {
    var a: Float64 = 0.0
    var b: Float64 = 0.0
    var c: Float64 = 0.0
}

@C
struct DataF32F32F32F32 {
    var a: Float32 = 0.0
    var b: Float32 = 0.0
    var c: Float32 = 0.0
    var d: Float32 = 0.0
}

@C
struct DataF32F32F32F32F32 {
    var a: Float32 = 0.0
    var b: Float32 = 0.0
    var c: Float32 = 0.0
    var d: Float32 = 0.0
    var e: Float32 = 0.0
}

unsafe main() {
    var d1 = ProcessDataF32(DataF32())
    var d2 = ProcessDataF32F32(DataF32F32())
    var d3 = ProcessDataF32F32F32(DataF32F32F32())
    var d4 = ProcessDataF32F32F32F32(DataF32F32F32F32())
    var d5 = ProcessDataF32F32F32F32F32(DataF32F32F32F32F32())
    var d6 = ProcessDataF64(DataF64())
    var d7 = ProcessDataF64F64(DataF64F64())
    var d8 = ProcessDataF64F64F64(DataF64F64F64())
    println("${d1.a}, ${d2.a}, ${d3.a}, ${d4.a}, ${d5.a}, ${d6.a}, ${d7.a}, ${d8.a}")
    println("-, ${d2.b}, ${d3.b}, ${d4.b}, ${d5.b}, -, ${d7.b}, ${d8.b}")
    println("-, -, ${d3.c}, ${d4.c}, ${d5.c}, -, -, ${d8.c}")
    println("-, -, -, ${d4.d}, ${d5.d}, -, -, -")
    println("-, -, -, -, ${d5.e}, -, -, -")
}
