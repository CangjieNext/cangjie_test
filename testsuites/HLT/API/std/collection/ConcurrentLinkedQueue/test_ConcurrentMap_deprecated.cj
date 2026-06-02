/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC-PIPE-0: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// RUN-EXEC: %run %run_opt %output %run_args
// ASSERT: scan function 'put' is deprecated. Use member function `public func add(key: K, value: V): ?V` instead.

import std.collection.*
import std.collection.concurrent.*
import std.sync.*

main() {
    let threads = 8
    let M = 1024

    let cmap = ConcurrentHashMap<Int64, Int64>(concurrencyLevel: 64)
    let jobs = Array<Future<Unit>>(threads, repeat: unsafe { zeroValue<Future<Unit>>() })
    for (t in 0..threads) {
        jobs[t] = spawn {
            for (i in t..M : threads) {
                cmap.put(i, i + 3)
            }
        }
    }
}
