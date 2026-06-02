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
    var map01 = HashMap<Rune, Int64>([(r'a', 1), (r'c', 3), (r'b', 2)])
    var map02 = HashMap<Rune, Int64>([(r'a', 1), (r'b', 2), (r'c', 3)]) //{r'a':1,r'b':2,r'c':3}
    if (map01 == map01) {
        return 0
    }
    return 1
}
