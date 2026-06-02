// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args
// ASSERT: scan 123 
// ASSERT: scan 123 
// ASSERT: scan 123 
internal import std.math.*

@OverflowWrapping
func foo(num: Int64) {
    try {
        var a = Int64.Min / num
    } catch (e: ArithmeticException) {
        println(123)
    }
}

func goo(num: Int64) {
    try {
        var a = Int64.Min / num
    } catch (e: ArithmeticException) {
        println(123)
    }
}

main() {
    // no exception
    foo(-1)
    // exception
    foo(0)
    // exception
    goo(-1)
    // exception
    goo(0)
    return 0
}
