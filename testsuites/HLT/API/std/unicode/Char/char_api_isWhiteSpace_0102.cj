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
    let b = [r'A', r'B', r'C', r'D', r'E', r'F', r'G', r'H', r'I', r'J', r'K', r'L', r'M', r'N', r'O', r'P', r'Q', r'R',
        r'S', r'T', r'U', r'V', r'W', r'X', r'Y', r'Z']
    for (i in 0..26 : 1) {
        if (b[i].isWhiteSpace() != false) {
            return i + 1
        }
    }
    return 0
}
