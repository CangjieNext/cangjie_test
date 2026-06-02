/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args  | compare %f
// ASSERT: scan IndexOutOfBoundsException

import std.collection.*

var str: Array<String> = ["a", "b", "c"]
var r1: ArrayList<String> = ArrayList<String>(str)

func case01(x: Int64, y!: String = "y") {
    r1[x] = y
    var b = r1.get(x)
    return match (b) {
        case Some(z) => z
        case None => "No"
    }
}

main(): Int64 {
    try {
        if (case01(4) != "y") {
            return 1
        }
    } catch (e: IndexOutOfBoundsException) {
        print("IndexOutOfBoundsException\n")
    }
    return 0
}
