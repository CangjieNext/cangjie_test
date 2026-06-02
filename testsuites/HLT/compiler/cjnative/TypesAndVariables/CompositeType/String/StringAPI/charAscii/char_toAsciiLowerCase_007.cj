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

main(): Int64 {
    var ch1 = r'\u{0001}'
    var ch2 = r'\u{ffff}'

    if (ch1.toAsciiLowerCase() != r'\u{0001}') {
        return 1
    }

    if (ch2.toAsciiLowerCase() != r'\u{ffff}') {
        return 1
    }

    var ch3 = r'\0'
    let ch4: Rune = r'\\'
    let ch5: Rune = r'\''

    if (ch3.toAsciiLowerCase() != r'\0') {
        return 1
    }

    if (ch4.toAsciiLowerCase() != r'\\') {
        return 1
    }

    if (ch5.toAsciiLowerCase() != r'\'') {
        return 1
    }

    if (r'\"'.toAsciiLowerCase() != r'\"') {
        return 1
    }

    if (r'\b'.toAsciiLowerCase() != r'\b') {
        return 1
    }

    if (r'\t'.toAsciiLowerCase() != r'\t') {
        return 1
    }

    return 0
}
