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
 * Verify the branch of toLower when the size of a Rune from `Rune.fromUtf8` is different from Rune.utf8Size(c.toLowerCase()).
 * Test API: public func toLower(): String
 */

internal import std.unicode.*

main(): Int64 {
    var a: Rune = Rune(UInt32(304))
    var b: Rune = Rune(UInt32(570))
    var c: Rune = Rune(UInt32(11364))
    var d: Rune = Rune(UInt32(473))
    var arr = [a, b, c, d]
    var s = String(arr)
    var s1 = s.toLower()
    if (s1 != "i̇ⱥɽǚ") {
        return 1
    }
    return 0
}
