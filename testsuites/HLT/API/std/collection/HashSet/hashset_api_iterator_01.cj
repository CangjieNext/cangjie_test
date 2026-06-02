/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC-PIPE: %compiler %cmp_opt %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args|compare %f
// ASSERT: scan success1

import std.collection.*

main(): Int64 {
    var str: Array<String> = ["a", "b", "c"]
    var r1: HashSet<Int64> = HashSet<Int64>()
    var r2: HashSet<String> = HashSet<String>(["0", "2", "1"])
    var r3: HashSet<String> = HashSet<String>(str)
    var r4: HashSet<String> = HashSet<String>(3)
    var r5: HashSet<String> = HashSet<String>(3, {x: Int64 => x.toString()})
    var itor01 = r1.iterator()
    var itor02 = r2.iterator()
    var itor03 = r3.iterator()
    var itor04 = r4.iterator()
    var itor05 = r5.iterator()
    return match ((itor01.next(), itor02.next(), itor03.next(), itor04.next(), itor05.next())) {
        case (None, Some(v2), Some(v3), None, Some(v5)) =>
            print("success1\n")
            return 0
        case _ => return 1
    }
}
