/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt -o %output %f
// RUN-EXEC: %run %run_opt %output %run_args

import std.collection.*

main(): Int64 {
    var map01 = HashMap<Rune, Int64>([(r'a', 5), (r'c', 3), (r'b', 2), (r'a', 3)])
    var map02 = HashMap<Rune, Int64>([(r'a', 1), (r'b', 3), (r'c', 3), (r'b', 10)])
    if (map01 == map02) {
        return 1
    }
    return 0
}
