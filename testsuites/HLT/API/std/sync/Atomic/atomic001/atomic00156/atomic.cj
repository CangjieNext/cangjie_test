/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC:%compiler %cmp_opt  %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan 65535

import std.sync.*

main(): Int64 {
    let test = AtomicUInt16(100)
    test.fetchSub(1)
    var i: Int64 = 0

    while (i < 100) {
        i = i + 1
        let thread: Future<UInt16> = spawn {
            test.fetchSub(1)
        }
    }

    while (test.load() != 65535) {
        sleep(Duration.Zero)
    }
    print(test.load().toString())
    return 0
}
