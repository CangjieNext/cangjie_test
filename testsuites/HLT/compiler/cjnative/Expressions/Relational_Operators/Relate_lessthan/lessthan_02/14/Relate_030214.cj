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
    let l1 = r'\"'

    let m: Rune = r'\u{8}'
    let m1 = r'\u{2}'

    if (l1 < l && r'\u{5}' < l1 && m1 < l && m1 < m) {
        return 0
    }

    return 1
}
