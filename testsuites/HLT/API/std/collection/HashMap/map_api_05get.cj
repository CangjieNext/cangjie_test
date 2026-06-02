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

var map01: HashMap<Int8, Int8> = HashMap<Int8, Int8>([(1, 2), (2, 3), (4, 5), (5, 2), (1, 5)])

func case01(n: Int8): Int8 {
    var a = map01.get(n)
    var b = match (a) {
        case Some(x) => x
        case None => Int8(1)
    }
    return b
}

main(): Int64 {
    if (case01(1) == 5 && case01(2) == 3 && case01(4) == 5 && case01(5) == 2) {
        return 0
    }
    return 1
}
