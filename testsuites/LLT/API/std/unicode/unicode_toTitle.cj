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
 * Verify the branch of toTitle when the size of a Rune from `Rune.fromUtf8` is different from Rune.utf8Size(c.toTitleCase()).
 * Test API: public func toTitle(): String
 */

internal import std.unicode.*

main(): Int64 {
    var a: Rune = Rune(UInt32(383))
    var b: Rune = Rune(UInt32(593))
    var c: Rune = Rune(UInt32(619))
    var arr: Array<Rune> = [a, b, c]
    var s = String(arr)
    var s1 = s.toTitle()
    if (s1 != "SⱭⱢ") {
        return 1
    }
    return 0
}
