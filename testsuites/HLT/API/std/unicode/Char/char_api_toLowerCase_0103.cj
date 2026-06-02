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

import std.unicode.*

main() {
    let b = [r'1', r'2', r'3', r'4', r'5', r'6', r'7', r'8', r'9', r'0']
    for (i in 0..10 : 1) {
        if (b[i].toLowerCase() != b[i]) {
            return i + 1
        }
    }
    return 0
}
