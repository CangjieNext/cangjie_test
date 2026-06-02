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
    let a: Rune = r'A'
    let a1 = r'Z'

    let b: Rune = r'z'
    let b1 = r'a'

    let c: Rune = r'5'
    let c1 = r'9'

    let d: Rune = r'+'
    let d1 = r'*'

    if (a != a1 && a1 != r'a' && b != b1 && b1 != r'A' && c != c1 && c1 != r'6' && d != d1 && d1 != r'-') {
        return 0
    }

    return 1
}
