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

func test(arr: Array<Rune>, str: String): Int32 {
    var strb1 = StringBuilder(arr)
    var strb2 = StringBuilder(str)
    var str1 = strb1.toString()
    var str2 = strb2.toString()
    if (str1 == str2) {
        return 0
    } else {
        return 1
    }
}

main(): Int32 {
    var res: Int32 = 0
    var values: Array<Array<Rune>> = [Array<Rune>(), [r' '], [r' ', r' ', r' ', r' '], [r'!', r'@', r'#', r'$'],
        [r'\t', r'\0', r'\"', r'\t'], [r'A', r'B', r'C', r'D'], [r'1', r'2', r'3', r'4'], [r'懿', r'贰', r'叁', r'肆'],
        [r'，', r'！', r'？', r'。'], [r'!', r'A', r'G', r'2', r'3', r'f', r'$', r'L', r';', r'\'']]
    var s = "	\u{0}\"	"
    var strs: Array<String> = ["", " ", "    ", "!@#$", s, "ABCD", "1234", "懿贰叁肆", "，！？。", "!AG23f$L;'"]

    for (i in 0..values.size) {
        res += test(values[i], strs[i])
    }

    return res
}
