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
// TEST INTENT: scope return waits for a task that outlives fn
// DOC REF: threadScope - "waits for all tasks launched by the group to complete before returning"
// EXPECT: task done and wall time >= 300ms, exit 0

import std.concurrent.*
import std.sync.*
import std.time.*

// threadScope waits for every launched task before returning even when fn
// returns immediately: a 300ms task delays the scope's return accordingly.
main(): Int64 {
    let start = MonoTime.now()
    let finished = AtomicBool(false)
    threadScope<Unit, Unit> {
        group =>
            group.launch {
                sleep(Duration.millisecond * 300)
                finished.store(true)
            }
    }
    let elapsed = (MonoTime.now() - start).toMilliseconds()
    if (!finished.load()) {
        return 1
    }
    return if (elapsed >= 300) { 0 } else { 2 }
}
