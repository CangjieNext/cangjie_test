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
    var ch1 = r'a'
    var ch2 = r'z'

    if (ch1.toAsciiUpperCase() != r'A') {
        return 1
    }

    if (ch2.toAsciiUpperCase() != r'Z') {
        return 1
    }

    if (r'H'.toAsciiUpperCase() != r'H') {
        return 1
    }

    if (r'p'.toAsciiUpperCase() != r'P') {
        return 1
    }

    if (r'Q'.toAsciiUpperCase() != r'Q') {
        return 1
    }

    return 0
}
