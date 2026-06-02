/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args

import std.collection.*

main(): Int64 {
    try {
        var hashmap1: HashMap<Int8, String> = HashMap<Int8, String>(-1)
        ()
    } catch (e: IllegalArgumentException) {
        if (e.toString() != "IllegalArgumentException: Invalid size of HashMap: -1.") {
            return 1
        }
    }
    return 0
}
