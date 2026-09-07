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
//
// TEST INTENT: a failure queued before the iterator exists is still surfaced
// DOC REF: ThreadGroup.iterator - backed by the group's result queue, not a snapshot
// EXPECT: caught "pre-queued failure", exit 0

import std.concurrent.*
import std.sync.*

// A failure queued before the consumer starts is still surfaced: the task
// fails while fn is sleeping, the iterator is created afterwards, and next()
// rethrows the earlier failure (iterator is backed by the group's result
// queue, not by a snapshot).
main(): Int64 {
    var caught = ""
    try {
        threadScope<Int64, Unit> {
            group =>
                group.launch {
                    throw IllegalArgumentException("pre-queued failure")
                }
                sleep(Duration.millisecond * 50)
                let iter = group.iterator()
                match (iter.next()) {
                    case Some(_) => ()
                    case None => ()
                }
        }
    } catch (e: IllegalArgumentException) {
        caught = e.message
    }
    return if (caught == "pre-queued failure") { 0 } else { 1 }
}
