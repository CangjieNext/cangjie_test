/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args 
import std.collection.*
import std.random.*

main(): Int64 {
    var random = Random(10)

    var r: UInt64 = 0
    for (j in 1..20) {
        r = random.nextUInt64(UInt64(j)) + r
    }
    if (r == 0) {
        return 1
    }
    0
}
