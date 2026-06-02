/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC-PIPE: %compiler %cmp_opt %f -o %output
// EXEC-PIPE: %run %run_opt %output %run_args

/*
 * Verify the branch of toUpper when the size of a Rune from `Rune.fromUtf8` is different from Rune.utf8Size(c.toUpperCase()).
 * Test API: public func toUpper(): String
 */

internal import std.unicode.*

main(): Int64 {
    var a: UInt32 = 305
    var b: UInt32 = 647
    var c: UInt32 = 11366
    var d: UInt32 = 474
    var arr: Array<Rune> = [Rune(a), Rune(b), Rune(c), Rune(d)]
    var s = String(arr)
    var s1 = s.toUpper()
    if (s1 != "IꞱȾǙ") {
        return 1
    }
    return 0
}
