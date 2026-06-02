/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: ./../../../../../../API/asan
// EXEC: %compiler %cmp_opt %compile_lib_opt asan/asanGC.cj -o asan.%middle
// EXEC: %compiler %cmp_opt  %f asan.%middle -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan in main\nthread sleeping\nthread end sleep\nin main, count = 3\n
// ASSERT: scan-not Exception

import std.sync.*
import asan.*

var count: Int64 = 0

main(): Int64 {
    let mtx: ReentrantMutex = ReentrantMutex()
    let fut: Future<Unit> = spawn {
        mtx.lock()
        count = count + 1
        while (count < 2) {
            sleep(Duration.Zero)
        }
        print("thread end sleep\n")
        count = count + 1
        mtx.unlock()
    }
    while (count < 1) {
        sleep(Duration.Zero)
    }
    print("in main\n")
    if (!mtx.tryLock()) {
        print("thread sleeping\n")
    }
    count = count + 1
    fut.get()
    if (mtx.tryLock()) {
        print("in main, count = ${count}\n")
    }
    asanGC()
    return 0
}
