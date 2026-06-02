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
// ASSERT: scan 10, 10, 10, 10
// ASSERT: scan 20, 20, 20, 20
// ASSERT: scan 30, 30, 30, 30
// ASSERT: scan 40, 40, 40, 40

foreign {
    func ProcessDataI8I8I8I8(d: DataI8I8I8I8): DataI8I8I8I8
    func ProcessDataI16I16I16I16(d: DataI16I16I16I16): DataI16I16I16I16
    func ProcessDataI32I32I32I32(d: DataI32I32I32I32): DataI32I32I32I32
    func ProcessDataI64I64I64I64(d: DataI64I64I64I64): DataI64I64I64I64
}

@C
struct DataI8I8I8I8 {
    var a: Int8 = 0
    var b: Int8 = 0
    var c: Int8 = 0
    var d: Int8 = 0
}

@C
struct DataI16I16I16I16 {
    var a: Int16 = 0
    var b: Int16 = 0
    var c: Int16 = 0
    var d: Int16 = 0
}

@C
struct DataI32I32I32I32 {
    var a: Int32 = 0
    var b: Int32 = 0
    var c: Int32 = 0
    var d: Int32 = 0
}

@C
struct DataI64I64I64I64 {
    var a: Int64 = 0
    var b: Int64 = 0
    var c: Int64 = 0
    var d: Int64 = 0
}

unsafe main() {
    var d1 = ProcessDataI8I8I8I8(DataI8I8I8I8())
    var d2 = ProcessDataI16I16I16I16(DataI16I16I16I16())
    var d3 = ProcessDataI32I32I32I32(DataI32I32I32I32())
    var d4 = ProcessDataI64I64I64I64(DataI64I64I64I64())

    println("${d1.a}, ${d2.a}, ${d3.a}, ${d4.a}")
    println("${d1.b}, ${d2.b}, ${d3.b}, ${d4.b}")
    println("${d1.c}, ${d2.c}, ${d3.c}, ${d4.c}")
    println("${d1.d}, ${d2.d}, ${d3.d}, ${d4.d}")
}
