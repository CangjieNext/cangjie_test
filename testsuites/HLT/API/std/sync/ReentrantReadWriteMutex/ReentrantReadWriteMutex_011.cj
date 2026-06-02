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
// ASSERT: scan res3 lock
// ASSERT: scan-not res2 lock

import std.sync.{ReentrantReadWriteMutex, ReadWriteMutexMode}

var flag1: Int64 = 0
var flag2: Int64 = 0
var flag3: Int64 = 0

main(): Int64 {
    let x: Int64 = 0
    let rwm = ReentrantReadWriteMutex(mode: Fair)

    let res1 = spawn {
        flag1 = flag1 + 1
        rwm.writeMutex.lock()
        sleep(Duration.second * 5)
        rwm.writeMutex.unlock()
    }
    while (flag1 != 1) {
        sleep(Duration.second * 1)
    }

    let res2 = spawn {
        flag2 = flag2 + 1
        rwm.writeMutex.lock()
        println("res2 lock")
    }
    while (flag2 != 1) {
        sleep(Duration.Zero)
    }

    let res3 = spawn {
        rwm.readMutex.lock()
        println("res3 lock")
        flag3 = flag3 + 1
    }
    while (flag3 != 1) {
        sleep(Duration.second)
    }

    return 0
}
