/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC-PIPE: %compiler %cmp_opt %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan success1

import std.collection.*

main(): Int64 {
    var str1: Array<String> = []
    var str2: Array<String> = []
    var r1: HashSet<String> = HashSet<String>()
    //入参是空列表，构造抛异常
    var r2: HashSet<String> = HashSet<String>([])
    var r3: HashSet<String> = HashSet<String>(str1)
    var r4: HashSet<String> = HashSet<String>(str2)
    //容量入参是0，构造抛异常
    var r5: HashSet<String> = HashSet<String>(0)
    var r6: HashSet<String> = HashSet<String>(0, {x: Int64 => x.toString()})
    for (i in 0..100) {
        r1.add(i.toString())
        r2.add(i.toString())
        r3.add(i.toString())
        r4.add(i.toString())
        r5.add(i.toString())
        r6.add(i.toString())
    }
    if (r1.size != 100) {
        return 1
    }
    if (r2.size != 100) {
        return 2
    }
    if (r3.size != 100) {
        return 3
    }
    if (r4.size != 100) {
        return 4
    }
    if (r5.size != 100) {
        return 5
    }
    if (r6.size != 100) {
        return 6
    }
    print("success1\n")
    return 0
}
