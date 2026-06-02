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
    let b = ["23213\n", "qwqw\n\u{0020}", """
1212\r\t"""]
    let c = ["23213", "qwqw", """
1212"""]
    for (i in 0..3 : 1) {
        if (b[i].trimRight() != c[i]) {
            return i + 1
        }
    }
    return 0
}
