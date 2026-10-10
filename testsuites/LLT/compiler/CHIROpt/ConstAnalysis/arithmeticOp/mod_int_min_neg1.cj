// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// INT_MIN % -1 is defined as 0 under THROWING; ConstAnalysis must not reject it.
// Contrast with div_int_throwing.cj which expects overflow for INT_MIN / -1.

// EXEC: %compiler %cmp_opt %enableCompileDebug %f -o %output -Woff unused
// EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan 0\n0\n0\n0\n

func foo() {
    var a: Int64 = -9223372036854775808
    var c = a % -1
    println(c)
}

func goo() {
    var a: Int32 = -2147483648
    var c = a % -1
    println(c)
}

func hoo() {
    var a: Int16 = -32768
    var c = a % -1
    println(c)
}

func koo() {
    var a: Int8 = -128
    var c = a % -1
    println(c)
}

main(): Int64 {
    foo()
    goo()
    hoo()
    koo()
    0
}
