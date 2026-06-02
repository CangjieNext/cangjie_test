// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
// DEPENDENCE: %n.c
// EXEC: %clang %clang_shared_opt %n.c -o %cffi_output
// EXEC: %compiler %f -L . -l %n -o %output
// EXEC: %run %run_opt %output %run_args
// ASSERT: scan exception when direct call: OverflowException: sub
// ASSERT: scan exception when indirect call: OverflowException: sub

internal import std.math.*

foreign func runCallback(cb: CFunc<(Int32, Int32) -> Int32>, a: Int32, b: Int32): Int32

@C
func foo(a: Int32, b: Int32): Int32 {
    return if (a > b) {
        a - b
    } else {
        b - a
    }
}

unsafe main() {
    try {
        var res = runCallback(foo, Int32.Max, Int32.Min)
        if (res != 1) {
            return 1
        }
    } catch (e: Exception) {
        println("exception when direct call: ${e}")
    }
    try {
        var f = foo
        var res = runCallback(f, Int32.Max, Int32.Min)
        if (res != 1) {
            return 1
        }
    } catch (e: Exception) {
        println("exception when indirect call: ${e}")
    }
    return 0
}
