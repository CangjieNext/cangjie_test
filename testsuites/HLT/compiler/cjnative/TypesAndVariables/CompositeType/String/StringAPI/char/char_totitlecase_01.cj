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

import std.unicode.*

func run(): Int64 {
    var c1: Rune = r'a'
    var c2 = r'1'
    var c3 = r'\u{5234}'
    var c4 = r'\n'
    var c5 = r'中'
    var c6 = r'\u{0061}'

    var res1 = c1.toTitleCase()
    var res2 = c2.toTitleCase()
    var res3 = c3.toTitleCase()
    var res4 = c4.toTitleCase()
    var res5 = c5.toTitleCase()
    var res6 = c6.toTitleCase()
    var res7 = r'l'.toTitleCase()

    if (res1 == r'A' && res2 == r'1' && res3 == r'\u{5234}' && res4 == r'\n' && res5 == r'中' && res6 == r'A' && res7 ==
        r'L') {
        return 0
    }
    return 1
}

main(): Int64 {
    return run()
}
