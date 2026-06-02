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
// ASSERT: scan 10, 10, 10, 10, 10, 10
// ASSERT: scan 20, 20, 20, 20, 20, 20

foreign {
    func ProcessDataI8I16(d: DataI8I16): DataI8I16
    func ProcessDataI8I32(d: DataI8I32): DataI8I32
    func ProcessDataI8I64(d: DataI8I64): DataI8I64
    func ProcessDataI16I32(d: DataI16I32): DataI16I32
    func ProcessDataI16I64(d: DataI16I64): DataI16I64
    func ProcessDataI32I64(d: DataI32I64): DataI32I64
}

@C
struct DataI8I16 {
    var a: Int8 = 0
    var b: Int16 = 0
}

@C
struct DataI8I32 {
    var a: Int8 = 0
    var b: Int32 = 0
}

@C
struct DataI8I64 {
    var a: Int8 = 0
    var b: Int64 = 0
}

@C
struct DataI16I32 {
    var a: Int16 = 0
    var b: Int32 = 0
}

@C
struct DataI16I64 {
    var a: Int16 = 0
    var b: Int64 = 0
}

@C
struct DataI32I64 {
    var a: Int32 = 0
    var b: Int64 = 0
}

unsafe main() {
    var d1 = ProcessDataI8I16(DataI8I16())
    var d2 = ProcessDataI8I32(DataI8I32())
    var d3 = ProcessDataI8I64(DataI8I64())
    var d4 = ProcessDataI16I32(DataI16I32())
    var d5 = ProcessDataI16I64(DataI16I64())
    var d6 = ProcessDataI32I64(DataI32I64())

    println("${d1.a}, ${d2.a}, ${d3.a}, ${d4.a}, ${d5.a}, ${d6.a}")
    println("${d1.b}, ${d2.b}, ${d3.b}, ${d4.b}, ${d5.b}, ${d6.b}")
}
