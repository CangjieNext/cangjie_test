/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

import std.sync.*
import std.time.*

var running: AtomicInt64 = AtomicInt64(0)
var awake: AtomicInt64 = AtomicInt64(0)

main(): Int64 {
    let mtr: Monitor = Monitor()
    let future: Future<Unit> = spawn {
        mtr.lock()
        running.fetchAdd(1)
        if (!mtr.wait(timeout: Duration.second)) {
            awake.fetchAdd(1)
        }
        awake.fetchAdd(1)
        mtr.unlock()
    }
    while (running.load() != 1) {}
    try {
        future.get(Duration.millisecond * 10)
        return 1
    } catch (e: TimeoutException) {
        ()
    }
    if (running.load() != 1 || awake.load() != 0) {
        return 2
    }
    return 0
}
