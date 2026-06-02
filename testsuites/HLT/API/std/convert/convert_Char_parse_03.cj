/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

import std.convert.*
import std.collection.*

main(): Int64 {
    var arr1 = ["'\\'", "'\n'", "'\t'", "'\u{0}'", "'\u{0000}'", "'\u{ffff}'"]
    var arr2 = ArrayList<Rune>()
    var arr3 = ArrayList<Rune>([r'\\', r'\n', r'\t', r'\u{0}', r'\u{0000}', r'\u{ffff}'])
    for (i in arr1) {
        arr2.add(Rune.parse(i))
    }
    if (arr2 != arr3) {
        return 1
    }
    return 0
}
