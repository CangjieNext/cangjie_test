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

var range1: Array<Range<Int64>> = [0..10, 0..5]
var r1: HashSet<Range<Int64>> = HashSet<Range<Int64>>(range1)
var r2: HashSet<Range<Int64>> = HashSet<Range<Int64>>([0..10, 0..5])

main(): Int64 {
    if (r1.size != 2) {
        return 1
    }
    if (r1.contains(0..5) != true) {
        return 2
    }
    if (r1.contains(0..10) != true) {
        return 3
    }
    if (r2.size != 2) {
        return 4
    }
    if (r2.contains(0..5) != true) {
        return 5
    }
    if (r2.contains(0..10) != true) {
        return 6
    }
    print("success1\n")
    return 0
}
