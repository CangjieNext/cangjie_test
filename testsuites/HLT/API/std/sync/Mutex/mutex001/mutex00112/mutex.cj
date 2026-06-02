/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt  %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan test begin\nin main, count = 0\n
// ASSERT: scan-not Exception

import std.sync.*

var a: Int64 = 0
var b: Int64 = 0
var count: Int64 = 0

main(): Int64 {
    let mtx1: ReentrantMutex = ReentrantMutex()
    let mtx2: ReentrantMutex = ReentrantMutex()
    spawn {
        mtx1.lock()
        b = b + 1
        while (a < 1) {
            sleep(Duration.Zero)
        }
        mtx2.lock()
        count = count + 1
        print("in thread1\n")
        mtx2.unlock()
        mtx1.unlock()
    }
    spawn {
        mtx2.lock()
        a = a + 1
        while (b < 1) {
            sleep(Duration.Zero)
        }
        mtx1.lock()
        count = count + 1
        print("in thread2\n")
        mtx1.unlock()
        mtx2.unlock()
    }
    while (a < 1 || b < 1) {
        sleep(Duration.Zero)
    }
    print("test begin\n")
    if (!mtx1.tryLock() && !mtx2.tryLock()) {
        print("in main, count = ${count}\n")
    }
    return 0
}
