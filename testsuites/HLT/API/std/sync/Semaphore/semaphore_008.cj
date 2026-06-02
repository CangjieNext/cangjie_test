/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

import std.collection.*
import std.sync.*

main() {
    let a = AtomicInt64(0)
    let s = Semaphore(10)
    s.acquire(amount: 10)
    let thread = spawn {
        s.acquire()
        a.fetchAdd(1)
    }
    try {
        thread.get(Duration.millisecond)
    } catch (_: TimeoutException) {
    }

    if (s.count == 0 && a.load() == 0) {
        return 0
    }
    return 1
}
