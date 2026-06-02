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
    let b = ["\t23213\r", "\u{0009}qwqw\u{0020}", """
  \u{0020}1212\r"""]
    let c = ["23213", "qwqw", """
1212"""]
    for (i in 0..3 : 1) {
        if (b[i].trim() != c[i]) {
            return i + 1
        }
    }
    return 0
}
