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
    var ch1 = r'A'
    var ch2 = r'Z'

    if (ch1.toAsciiLowerCase() != r'a') {
        return 1
    }

    if (ch2.toAsciiLowerCase() != r'z') {
        return 1
    }

    if (r'H'.toAsciiLowerCase() != r'h') {
        return 1
    }

    if (r'P'.toAsciiLowerCase() != r'p') {
        return 1
    }

    if (r'h'.toAsciiLowerCase() != r'h') {
        return 1
    }

    return 0
}
