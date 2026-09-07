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
// TEST INTENT: launched tasks run concurrently
// DOC REF: concurrent_package_overview - "creates a scope for groups of Cangjie threads"
// EXPECT: 4x100ms tasks finish under 400ms wall time, exit 0

import std.concurrent.*
import std.sync.*
import std.time.*

// Launched tasks run concurrently: four 100ms sleeps complete in well under
// the 400ms a serialized execution would need.
main(): Int64 {
    let start = MonoTime.now()
    threadScope<Unit, Unit> {
        group =>
            for (_ in 0..4) {
                group.launch {
                    sleep(Duration.millisecond * 100)
                }
            }
    }
    let elapsed = (MonoTime.now() - start).toMilliseconds()
    return if (elapsed < 400) { 0 } else { 1 }
}
