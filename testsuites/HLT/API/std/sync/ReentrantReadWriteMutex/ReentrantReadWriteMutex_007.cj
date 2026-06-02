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
// ASSERT: scan res1 lock
// ASSERT: scan res2 lock
// ASSERT: scan-not res3 lock
// ASSERT: scan-not res4 lock
// ASSERT: scan-not res5 lock

import std.sync.{ReentrantReadWriteMutex, ReadWriteMutexMode}

var flag: Int64 = 0

main(): Int64 {
    let x: Int64 = 0
    let rwm1 = ReentrantReadWriteMutex(mode: Fair)
    let rwm2 = ReentrantReadWriteMutex(mode: Fair)
    let rwm3 = ReentrantReadWriteMutex(mode: Fair)

    let res1 = spawn {
        rwm1.readMutex.lock()
        if (!rwm1.readMutex.tryLock()) {
            return
        }
        rwm1.readMutex.lock()
        println("res1 lock")
        rwm1.readMutex.unlock()
    }.get()

    let res2 = spawn {
        rwm2.writeMutex.lock()
        if (!rwm2.readMutex.tryLock()) {
            return
        }
        rwm2.readMutex.lock()
        if (!rwm2.writeMutex.tryLock()) {
            return
        }
        rwm2.writeMutex.lock()
        println("res2 lock")
        rwm2.writeMutex.unlock()
    }.get()

    let res3 = spawn {
        flag = flag + 1
        rwm3.readMutex.lock()
        if (rwm3.writeMutex.tryLock()) {
            println("res3 lock")
        }
        rwm3.writeMutex.lock()
        println("res3 lock")
    }

    let res4 = spawn {
        flag = flag + 1
        if (rwm2.writeMutex.tryLock()) {
            println("res4 lock")
        }
        rwm2.writeMutex.lock()
        println("res4 lock")
    }

    let res5 = spawn {
        flag = flag + 1
        rwm1.readMutex.unlock()
        if (rwm1.writeMutex.tryLock()) {
            println("res5 lock")
        }
        rwm1.writeMutex.lock()
        println("res5 lock")
    }

    while (flag != 3) {
        sleep(Duration.second * 5)
    }
    return 0
}
