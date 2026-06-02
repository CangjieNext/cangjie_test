/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args
import std.collection.*

main(): Int64 {
    let a: HashSet<Int64> = HashSet<Int64>([1])
    let b = HashSet<Int64>([0, 1])
    var c = a.contains(1)
    var d = b.contains(1)
    var e = b.contains(0)
    if (c && d && e) {
        return 0
    }
    return 1
}
