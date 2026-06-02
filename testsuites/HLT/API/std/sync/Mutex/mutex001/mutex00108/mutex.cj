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
// ASSERT: scan in main, count = 3\nException occured: IllegalSynchronizationStateException: Mutex is not locked by current thread

import std.sync.*
import std.runtime.*
import std.argopt.*
import std.process
import asan.*

var count: AtomicInt64 = AtomicInt64(0)

main(): Int64 {
    let mtx: ReentrantMutex = ReentrantMutex()
    let fut: Future<Unit> = spawn {
        mtx.lock()
        count.fetchAdd(1)
        print("in sub thread\n")
        while (count.load() < 2) {
            sleep(Duration.Zero)
        }
        count.fetchAdd(1)
        mtx.unlock()
        mtx.unlock()
    }
    print("in main\n")
    while (count.load() == 0) {
        sleep(Duration.Zero)
    }
    if (!mtx.tryLock()) {
        count.fetchAdd(1)
    }
    var opt = Option<Exception>.None
    try {
        fut.get()
    } catch (e: Exception) {
        opt = Some(e)
    }
    if (mtx.tryLock()) {
        print("in main, count = ${count.load()}\n")
    }
    match (opt) {
        case None => print("OK\n")
        case Some(e) => print("Exception occured: ${e}")
    }
    asanGC()
    return 0
}
