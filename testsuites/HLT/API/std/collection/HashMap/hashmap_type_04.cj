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

import std.collection.*

main(): Int64 {
    var HashMap01: HashMap<String, Bool> = HashMap<String, Bool>([("a", true)])
    var value1 = HashMap01["a"]
    if (HashMap01.size == 1 && value1 == true) {
        return 0
    }
    return 1
}
