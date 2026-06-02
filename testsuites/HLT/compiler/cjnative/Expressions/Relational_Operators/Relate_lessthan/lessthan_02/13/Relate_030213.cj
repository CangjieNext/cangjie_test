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

    //unprintable character
    let h: Rune = r'\0'
    let h1 = r'\f'

    let j: Rune = r'\b'
    let j1 = r'\v'

    let k: Rune = r'\t'
    let k1 = r'\n'

    if (h < h1 && h1 < r'\"' && j < j1 && j1 < r'\\' && k < k1 && k1 < r'\'') {
        return 0
    }

    return 1
}
