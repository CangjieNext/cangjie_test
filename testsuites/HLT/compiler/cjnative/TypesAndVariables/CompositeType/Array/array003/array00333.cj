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
    let mySet: HashSet<Int64> = HashSet<Int64>([1, 2, 3])
    let a = Array<Int32>(mySet.size, repeat: 5)
    return Int64(a[0] - a[1] + a[0] - a[2])
}
