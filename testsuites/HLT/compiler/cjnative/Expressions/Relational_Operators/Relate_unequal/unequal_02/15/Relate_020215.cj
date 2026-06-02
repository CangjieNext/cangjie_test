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

    //printable character
    let a: Rune = 'A'
    let a1: Rune = 'a'
    let a2: Rune = 'Z'
    let a3: Rune = '9'
    let a4: Rune = '+'

    if (a != a1 || a != a2 || a != a3 || a != a4) {
        return 0
    }

    //printable character
    let b: Rune = '\\'
    let b1: Rune = '\b'
    let b2: Rune = '\n'
    let b3: Rune = '\r'
    let b4: Rune = '\t'
    let b5: Rune = '\''
    let b6: Rune = '\0'

    //special character
    let c: Rune = '\u{2}'

    if (a != a1 || a != a2 || a != a3 || a != a4 || b != b1 || b != b2 || b != b3 || b != b4 || b != b5 || b != b6 ||
        b != a || a != c) {
        return 1
    }

    return 0
}
