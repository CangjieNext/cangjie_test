/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC-PIPE: %compiler %cmp_opt %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args

import std.collection.*

main(): Int64 {
    var str: Array<String> = ["a", "b", "c"]
    var r2: HashSet<String> = HashSet<String>(["0", "2", "1"])
    var r3: HashSet<String> = HashSet<String>(str)
    var r5: HashSet<String> = HashSet<String>(3, {x: Int64 => x.toString()})
    try {
        r2.reserve(9223372036854775805)
    } catch (e: OverflowException) {
        if (e.toString() != "OverflowException: add") {
            return 1
        }
    }

    try {
        r3.reserve(9223372036854775805)
    } catch (e: OverflowException) {
        if (e.toString() != "OverflowException: add") {
            return 2
        }
    }
    try {
        r5.reserve(9223372036854775805)
    } catch (e: OverflowException) {
        if (e.toString() != "OverflowException: add") {
            return 3
        }
    }
    if (r2.capacity != 3) {
        return 1
    }
    if (r3.capacity != 3) {
        return 2
    }
    if (r5.capacity != 3) {
        return 3
    }
    return 0
}
