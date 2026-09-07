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
// TEST INTENT: result integrity under load: 200 tasks, no loss or duplication
// DOC REF: ThreadGroup - "records one result for every thread launched"
// EXPECT: sum == 200*199/2, exit 0

import std.concurrent.*
import std.sync.*

// Scale: 200 tasks launch and every result is consumed exactly once; the sum
// verifies no result is lost or duplicated under load.
main(): Int64 {
    let taskCount = 200
    let sum = threadScope<Int64, Int64> {
        group =>
            for (i in 0..taskCount) {
                group.launch { i }
            }
            var total = 0
            for (value in group) {
                total += value
            }
            total
    }
    return if (sum == taskCount * (taskCount - 1) / 2) { 0 } else { 1 }
}
