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

var r1: ArrayList<String> = ArrayList<String>(3, {x: Int64 => x.toString()})

func case01() {
    var a = r1.size
    return a
}

func case02() {
    var a = r1.get(1)
    return match (a) {
        case Some(x) => x
        case None => "Not"
    }
}

main(): Int64 {
    if (case01() != 3) {
        return 1
    }
    if (case02() != "1") {
        return 2
    }
    return 0
}
