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
        var a: Int16 = -1
        Rune(a)
    } catch (e: OverflowException) {
        res++
    }

    try {
        var a: Int16 = Int16.Min
        Rune(a)
    } catch (e: OverflowException) {
        res++
    }

    return 2 - res
}
