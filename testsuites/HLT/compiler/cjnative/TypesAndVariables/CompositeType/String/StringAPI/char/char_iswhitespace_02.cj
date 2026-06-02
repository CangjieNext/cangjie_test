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
    var c1: Rune = '\u{5324}'
    var c3 = r'h'
    var c4 = r'1'
    var c6 = r'仓'

    var res1 = c1.isWhiteSpace()
    var res3 = c3.isWhiteSpace()
    var res4 = c4.isWhiteSpace()
    var res5 = r'l'.isWhiteSpace()
    var res6 = c6.isWhiteSpace()

    print("c1 = " + c1.toString() + "\n")
    print("c3 = " + c3.toString() + "\n")
    print("c4 = " + c4.toString() + "\n")
    print("c5 = " + r'l'.toString() + "\n")
    print("c6 = " + c6.toString() + "\n")

    if (res1 || res3 || res4 || res5 || res6) {
        return 1
    }
    return 0
}

main(): Int64 {
    return run()
}
