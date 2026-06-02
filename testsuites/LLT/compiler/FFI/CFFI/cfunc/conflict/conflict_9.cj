// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
// DEPENDENCE: foo.c
// EXEC: %clang %clang_shared_opt foo.c -o %cffi_output
// EXEC: %compiler %cmp_opt_chir2hlir %f %cffi-link -o %output
// EXEC-PIPE: %pwd_to_ld_path %run %run_opt %output %run_args | compare %f
// ASSERT: scan hello
// ASSERT: scan wow
// ASSERT: scan emmm

package test

foreign {
    func MRT_NewSem(): Unit
    func MCC_ThrowException(): Unit
}

main() {
    unsafe {
        MRT_NewSem()
        MCC_ThrowException()
    }
    try {
        throw Exception("emmm")
    } catch (e: Exception) {
        println(e.message)
    }
    0
}
