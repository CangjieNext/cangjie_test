/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC:%compiler %cmp_opt  %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan 127

import std.sync.*

main(): Int64 {
    let test = AtomicInt8(0)
    test.fetchSub(1)
    var i: Int64 = 0

    while (i < 128) {
        i = i + 1
        let thread: Future<Int8> = spawn {
            test.fetchSub(1)
        }
    }

    while (test.load() != 127) {
        sleep(Duration.Zero)
    }
    print(test.load().toString())
    return 0
}
