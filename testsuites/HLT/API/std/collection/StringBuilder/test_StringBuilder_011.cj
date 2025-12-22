/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt -o %output %f
// RUN-EXEC: %run %run_opt %output %run_args

import std.math.*

main(): Int32 {
    var strb1 = StringBuilder()
    if (strb1.size != 0) {
        return 1
    }

    var strb4 = StringBuilder("123")
    if (strb4.size != 3) {
        return 4
    }

    var strb5 = StringBuilder([r'A', r'B', r'C', r'D', r'E', r'F'])
    if (strb5.size != 6) {
        return 5
    }

    var arr6: Array<Rune> = Array<Rune>(1024, repeat: r'A')
    var strb6 = StringBuilder(arr6)
    if (strb6.size != 1024) {
        return 6
    }

    var strb7 = StringBuilder([r'\n', r' ', r'\t', r'戸', r'E', r'@', r'。', r'a'])
    if (strb7.size != 12) {
        return 7
    }

    return 0
}
