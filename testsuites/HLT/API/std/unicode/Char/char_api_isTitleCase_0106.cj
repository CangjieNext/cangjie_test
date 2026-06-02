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
    let b = [r'测', r'试', r'仓', r'颉', r'你', r'好']
    for (i in 0..6 : 1) {
        if (b[i].isTitleCase() != false) {
            return i + 1
        }
    }
    return 0
}
