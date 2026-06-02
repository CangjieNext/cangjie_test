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
    var c1: Rune = r' '
    var c2 = r'\u{0020}'
    var c3 = r'\n'
    var c4 = r'\r'
    var c5 = r'\t'

    var res1 = c1.isWhiteSpace()
    var res2 = c2.isWhiteSpace()
    var res3 = c3.isWhiteSpace()
    var res4 = c4.isWhiteSpace()
    var res5 = c5.isWhiteSpace()
    var res6 = r' '.isWhiteSpace()

    if (res1 && res2 && res3 && res4 && res5 && res6) {
        return 0
    }
    return 1
}

main(): Int64 {
    return run()
}
