// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
// DEPENDENCE: foo.c
// EXEC: %clang %clang_shared_opt foo.c -o %cffi_output
// EXEC: %compiler %cmp_opt_chir2hlir %f %cffi-link -o %output
// EXEC-PIPE: %pwd_to_ld_path %run %run_opt %output %run_args | compare %f
// ASSERT: scan alpha
// ASSERT: scan beta
// ASSERT: scan gamma
// ASSERT: scan delta
// ASSERT: scan emmm

package test

foreign {
    func CCC_except_table0(): Unit
    func CCC_except_table1(): Unit
    func CCC_except_table2(): Unit
    func CCC_except_table3(): Unit
}

main() {
    unsafe {
        CCC_except_table0()
        CCC_except_table1()
        CCC_except_table2()
        CCC_except_table3()
    }
    try {
        throw Exception("emmm")
    } catch (e: Exception) {
        println(e.message)
    }
    0
}
