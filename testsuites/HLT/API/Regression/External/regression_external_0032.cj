/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan 0\n0\n1\n

import std.collection.*

main() {
    let a = ArrayList<String>(["0", "1", "2", "3"])
    let r1 = a[0]
    let r2 = a.remove(at: 0)
    let r3 = a.remove(at: 0)
    println(r1)
    println(r2)
    println(r3)
    return 0
}
