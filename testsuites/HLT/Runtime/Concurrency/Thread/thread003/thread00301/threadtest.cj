/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt  %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args 2>&1 | compare %f

// ASSERT: scan result = 100\n
// ASSERT: scan-not Exception

import std.sync.*

main(): Int64 {
    let result = AtomicInt64(0)
    var i: Int64 = 100
    while (i > 0) {
        i = i - 1
        let fut: Future<Unit> = spawn {
            result.fetchAdd(1)
            while (true) {
                sleep(Duration.millisecond * 10)
            }
        }
    }

    while (result.load() != 100) {
        sleep(Duration.Zero)
    }
    print("result = ${result.load()}\n")
    return 0
}
