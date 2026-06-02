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

foreign {
    func ProcessDataI8(d: DataI8): DataI8
    func ProcessDataI16(d: DataI16): DataI16
    func ProcessDataI32(d: DataI32): DataI32
    func ProcessDataI64(d: DataI64): DataI64
}

@C
struct DataI8 {
    var a: Int8 = 0
}

@C
struct DataI16 {
    var a: Int16 = 0
}

@C
struct DataI32 {
    var a: Int32 = 0
}

@C
struct DataI64 {
    var a: Int64 = 0
}

unsafe main() {
    var d8 = ProcessDataI8(DataI8())
    var d16 = ProcessDataI16(DataI16())
    var d32 = ProcessDataI32(DataI32())
    var d64 = ProcessDataI64(DataI64())

    println("${d8.a}, ${d16.a}, ${d32.a}, ${d64.a}")
}
