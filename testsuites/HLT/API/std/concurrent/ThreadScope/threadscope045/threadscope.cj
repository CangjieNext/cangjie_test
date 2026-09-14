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
// TEST INTENT: cancelAll after a full drain is a no-op
// DOC REF: ThreadGroup.cancelAll - cancellation only affects outstanding tasks
// EXPECT: results observed (sum == 3), scope completes, exit 0

import std.concurrent.*
import std.sync.*

// cancelAll called after every result has been consumed is a no-op: the scope
// completes normally and the already-observed results are unaffected.
// (021 covers cancelAll before any launch; this covers the post-drain call.)
main(): Int64 {
    let observed = AtomicInt64(0)
    threadScope<Int64, Unit> {
        group =>
            group.launch { 1 }
            group.launch { 2 }
            for (value in group) {
                observed.fetchAdd(value)
            }
            group.cancelAll()
    }
    return if (observed.load() == 3) { 0 } else { 1 }
}
