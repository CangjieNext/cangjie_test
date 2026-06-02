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
    let thread = spawn {
        s.acquire(amount: 9)
        a.fetchAdd(1)
    }
    thread.get()
    if (s.count == 1 && a.load() == 1) {
        return 0
    }
    return 1
}
