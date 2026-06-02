/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan Mutex success

import std.sync.*
import std.collection.*

var num = AtomicInt64(0)

main(): Int64 {
    let rwm = ReentrantReadWriteMutex()

    for (i in 0..100) {
        spawn {
            rwm.writeMutex.lock()
            rwm.readMutex.lock()
            num.fetchAdd(1)
            rwm.writeMutex.unlock()
            rwm.readMutex.unlock()
        }
    }
    while (num.load() != 100) {
        sleep(Duration.second * 5)
    }

    let val = num.load()
    if (val == 100) {
        println("Mutex success")
        return 0
    }
    return 1
}
