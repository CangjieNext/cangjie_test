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
        var a: UInt32 = 0xD7FF + 1
        Rune(a)
    } catch (e: OverflowException) {
        res++
    }

    try {
        var a: UInt32 = 0XE000 - 1
        Rune(a)
    } catch (e: OverflowException) {
        res++
    }

    try {
        var a: UInt32 = 0x10FFFF + 1
        Rune(a)
    } catch (e: OverflowException) {
        res++
    }

    try {
        var a: UInt32 = UInt32.Max
        Rune(a)
    } catch (e: OverflowException) {
        res++
    }

    return 4 - res
}
