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
    let b = [r'\t', r'\r', r'\n', r'\u{0020}', r' ']
    for (i in 0..5 : 1) {
        if (b[i].toTitleCase() != b[i]) {
            return i + 1
        }
    }
    return 0
}
