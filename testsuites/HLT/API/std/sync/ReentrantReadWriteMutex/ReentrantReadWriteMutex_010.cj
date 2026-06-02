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
// ASSERT: scan res2 lock
// ASSERT: scan-not res3 lock

import std.sync.{ReentrantReadWriteMutex, ReadWriteMutexMode}

var flag: Int64 = 0
var flag1: Int64 = 0
var flag2: Int64 = 0

main(): Int64 {
    let x: Int64 = 0
    let rwm = ReentrantReadWriteMutex(mode: Fair)

    let res1 = spawn {
        flag = flag + 1
        rwm.readMutex.lock()
        sleep(Duration.second * 5)
        rwm.readMutex.unlock()
    }
    while (flag != 1) {
        sleep(Duration.second * 0.5)
    }

    let res2 = spawn {
        rwm.writeMutex.lock()
        println("res2 lock")
        flag1 = flag1 + 1
    }
    while (flag1 != 1) {
        sleep(Duration.second)
    }

    let res3 = spawn {
        flag2 = flag2 + 1
        rwm.readMutex.lock()
        println("res3 lock")
    }

    while (flag2 != 1) {
        sleep(Duration.Zero)
    }
    return 0
}
