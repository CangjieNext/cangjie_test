// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// EXEC: %run %run_opt %output %run_args | compare %f
// ASSERT: scan alpha
// ASSERT: scan beta
// ASSERT: scan gamma
// ASSERT: scan delta
// ASSERT: scan emmm

package test

@C
func CCC_except_table0() {
    println("alpha")
}

@C
func CCC_except_table1() {
    println("beta")
}

@C
func CCC_except_table2() {
    println("gamma")
}

@C
func CCC_except_table3() {
    println("delta")
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
