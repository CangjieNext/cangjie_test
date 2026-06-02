// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
// DEPENDENCE: %n.c
// EXEC: %clang %clang_shared_opt %n.c -o %cffi_output
// EXEC: %compiler %cmp_opt %n.cj  %cffi-link -o %n.%suffix
// EXEC-PIPE: %pwd_to_ld_path %run %run_opt %n.%suffix 2>&1 | compare %f
// ASSERT: scan 10, 10, 10, 10

foreign {
    func GetProcessDataI8(): CPointer<Int8>
    func GetProcessDataI16(): CPointer<Int8>
    func GetProcessDataI32(): CPointer<Int8>
    func GetProcessDataI64(): CPointer<Int8>
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
    var ProcessDataI8 = CFunc<(DataI8) -> DataI8>(GetProcessDataI8())
    var ProcessDataI16 = CFunc<(DataI16) -> DataI16>(GetProcessDataI16())
    var ProcessDataI32 = CFunc<(DataI32) -> DataI32>(GetProcessDataI32())
    var ProcessDataI64 = CFunc<(DataI64) -> DataI64>(GetProcessDataI64())

    var d8 = ProcessDataI8(DataI8())
    var d16 = ProcessDataI16(DataI16())
    var d32 = ProcessDataI32(DataI32())
    var d64 = ProcessDataI64(DataI64())

    println("${d8.a}, ${d16.a}, ${d32.a}, ${d64.a}")
}
