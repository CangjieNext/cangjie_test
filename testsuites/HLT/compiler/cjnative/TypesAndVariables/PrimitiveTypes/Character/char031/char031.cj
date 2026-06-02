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
    var varChar: Rune = if (2 < 1) {
        r'1'
    } else {
        r'2'
    }
    let letChar: Rune = if (2 > 1) {
        r'2'
    } else {
        r'1'
    }
    if (varChar != r'2') {
        return 1
    }
    if (varChar != letChar) {
        return 1
    }
    return 0
}
