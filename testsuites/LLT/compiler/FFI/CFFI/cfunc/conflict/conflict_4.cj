// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// EXEC: %run %run_opt %output %run_args | compare %f
// ASSERT: scan hello
// ASSERT: scan wow
// ASSERT: scan emmm

package test

@C
func MRT_NewSem() {
    println("hello")
}

@C
func MCC_ThrowException() {
    println("wow")
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
