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
    print("aaaaaaaaaa")
    var map01 = HashMap<Rune, Option<Int32>>(
        [(r'a', Option<Int32>.Some(100)), (r'c', Option<Int32>.Some(1)), (r'b', Option<Int32>.Some(50))])
    var map02 = HashMap<Rune, Option<Int32>>(
        [(r'a', Option<Int32>.Some(100)), (r'b', Option<Int32>.Some(50)), (r'c', Option<Int32>.Some(1))])
    if (map01 == map02) {
        return 0
    }
    return 1
}
