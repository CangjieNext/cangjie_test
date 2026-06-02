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

var r1: ArrayList<String> = ArrayList<String>(3)

func case01(x: String, m: Int64) {
    var a = r1.add(x)
    var b = r1.get(m)
    return match (b) {
        case Some(x) => x
        case None => "No"
    }
}

main(): Int64 {
    case01("a", Int64(0))
    case01("b", Int64(1))
    case01("c", Int64(2))
    if (case01("d", Int64(3)) != "d" && r1.size > 3) {
        return 1
    }
    return 0
}
