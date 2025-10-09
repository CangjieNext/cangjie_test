/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 3
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

import std.sync.SyncCounter
import std.collection.*
import std.sync.*

main(): Int64 {
    let syncCounter = SyncCounter(1)
    var fut = ArrayList<Future<Unit>>()

    for (i in 0..1000) {
        fut.add(spawn {
            syncCounter.waitUntilZero()
        })
    }

    for (i in 0..1000) {
        fut[i].cancel()
    }
    syncCounter.dec()

    for (i in 0..1000) {
        if (fut[i].thread.hasPendingCancellation == false) {
            return 1
        }
    }
    return 0
}
