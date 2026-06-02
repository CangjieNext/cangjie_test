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
    let b = [r'Ἀ', r'Ǉ', r'Ǳ']
    let c = [r'\u{1F00}', r'\u{01C9}', r'\u{01F3}']
    for (i in 0..3 : 1) {
        if (b[i].toLowerCase() != c[i]) {
            return i + 1
        }
    }
    return 0
}
