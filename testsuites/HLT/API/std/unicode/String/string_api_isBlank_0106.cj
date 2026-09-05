/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

import std.unicode.*

main() {
    let blank = ["", " ", "\t\n\r", "\u{2003}", " \u{2003}\t"]
    let nonBlank = ["a", " a", "\u{2003}a", "\u{3000}x"]

    for (value in blank) {
        if (!value.isBlank()) {
            return 1
        }
    }
    for (value in nonBlank) {
        if (value.isBlank()) {
            return 2
        }
    }
    return 0
}