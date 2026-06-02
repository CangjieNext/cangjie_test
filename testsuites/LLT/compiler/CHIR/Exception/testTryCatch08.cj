// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt %n.cj -o %output
// (not not CJNATIVE)EXEC-PIPE-1: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan catch an Error!
// ASSERT: scan catch a exception!
// ASSERT: scan StackOverflowError
// ASSERT: scan-not catch a Wildcard pattern error !
 
func f():Int64{
    var a:Int64 = 0;
    var b = a + f()
    return b - a
}

main(): Int64 {
    try {
        f()
    } catch (e: Error) {
        println("catch an Error!")
    }
    try {
        throw ArithmeticException()
    } catch (_) {
        println("catch a exception!")
    }
    try {
        f()
    } catch (_) {
        println("catch a Wildcard pattern error !")
    }
    return 0
}
 
 