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
// ASSERT: scan in thread\nin main\n

import std.sync.*

main(): Int64 {
    var test = AtomicUInt8(0)

    let thread: Future<Unit> = spawn {
        var test = AtomicUInt8(255)
        if (test.load() == 255) {
            print("in thread\n")
        }
    }

    thread.get()
    test = AtomicUInt8(128)

    if (test.load() == 128) {
        print("in main\n")
    }

    return 0
}
