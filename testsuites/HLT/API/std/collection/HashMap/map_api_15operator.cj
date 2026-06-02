/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f  -o %output
// RUN-EXEC: %run %run_opt %output %run_args

import std.collection.*

main(): Int64 {
    var map01: HashMap<Int64, Int64> = HashMap<Int64, Int64>([(3, 3), (4, 5), (5, 6)])
    var value3 = map01[3]
    var value4 = map01[4]
    var value5 = map01[5]
    if (value3 == 3 && value4 == 5 && value5 == 6) {
        return 0
    }
    return 1
}
