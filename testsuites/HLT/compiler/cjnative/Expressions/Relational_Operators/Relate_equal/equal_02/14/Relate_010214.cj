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

    //special character
    let l: Rune = r'\''
    let l1 = r'\''

    let m: Rune = r'\"'
    let m1 = r'\"'

    let n: Rune = r'\u{1}'
    let n1 = r'\u{1}'
    let n2 = r'\u{8}'

    if (l == l1 && l1 == r'\'' && m == m1 && m1 == r'\"' && n == n1 && n1 == r'\u{1}' && n2 == r'\u{8}') {
        return 0
    }

    return 1
}
