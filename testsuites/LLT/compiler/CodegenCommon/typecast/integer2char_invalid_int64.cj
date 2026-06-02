// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-0: %run %run_opt %output %run_args

internal import std.math.*

main() {
    var res = 0
    try {
        var a: Int64 = -1
        Rune(a)
    } catch (e: OverflowException) {
        res++
    }

    try {
        var a: Int64 = Int64.Min
        Rune(a)
    } catch (e: OverflowException) {
        res++
    }

    try {
        var a: Int64 = 0xD7FF + 1
        Rune(a)
    } catch (e: OverflowException) {
        res++
    }

    try {
        var a: Int64 = 0XE000 - 1
        Rune(a)
    } catch (e: OverflowException) {
        res++
    }

    try {
        var a: Int64 = 0x10FFFF + 1
        Rune(a)
    } catch (e: OverflowException) {
        res++
    }

    try {
        var a: Int64 = Int64.Max
        Rune(a)
    } catch (e: OverflowException) {
        res++
    }

    return 6 - res
}
