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
// TEST INTENT: scope waits for every unconsumed task before returning
// DOC REF: threadScope - "waits for every unconsumed task result"
// EXPECT: finishedCount == 3 after scope returns, exit 0

import std.concurrent.*
import std.sync.*

main(): Int64 {
    let finishedCount = AtomicInt64(0)

    threadScope<Unit, Unit> {
        group =>
            group.launch {
                sleep(Duration.millisecond * 30)
                finishedCount.fetchAdd(1)
            }
            group.launch {
                sleep(Duration.millisecond * 60)
                finishedCount.fetchAdd(1)
            }
            group.launch {
                sleep(Duration.millisecond * 90)
                finishedCount.fetchAdd(1)
            }
    }

    return if (finishedCount.load() == 3) { 0 } else { 1 }
}
