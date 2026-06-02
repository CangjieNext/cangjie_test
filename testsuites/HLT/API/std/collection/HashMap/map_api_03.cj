/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC-PIPE: %compiler %cmp_opt %f  -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args

import std.collection.*

var map02: HashMap<Int32, String> = HashMap<Int32, String>(0, {x: Int64 => (Int32(x), x.toString())})

main(): Int64 {
    if (map02.keys().size == 0 && map02.values().size == 0) {
        return 0
    }
    return 1
}
