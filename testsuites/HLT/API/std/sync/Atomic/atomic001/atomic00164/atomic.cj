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
// ASSERT: scan compareAndSwap success\n

import std.sync.*

main(): Int64 {
    let test = AtomicUInt32(1)

    let thread: Future<Unit> = spawn {
        var a: Bool = false
        a = test.compareAndSwap(1, 0)
    }

    while (test.load() != 0) {
        sleep(Duration.Zero)
    }

    if (test.load() == 0) {
        print("compareAndSwap success\n")
    }
    return 0
}
