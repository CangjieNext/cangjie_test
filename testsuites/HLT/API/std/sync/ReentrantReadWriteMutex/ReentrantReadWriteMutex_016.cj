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
// ASSERT: scan readMutex success

import std.sync.*
import std.collection.*

var num = AtomicInt64(0)
var flag = 0

main(): Int64 {
    let rwm = ReentrantReadWriteMutex()

    spawn {
        while (true) {
            rwm.readMutex.lock()
            num.fetchAdd(1)
            flag = 1
        }
    }

    while (flag == 0) {
        sleep(Duration.millisecond)
    }
    println("readMutex success")
    println(num.load())
    return 0
}
