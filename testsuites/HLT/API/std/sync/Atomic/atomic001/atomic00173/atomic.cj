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
// ASSERT: scan in main\n

import std.sync.*

main(): Int64 {
    let test = AtomicUInt64(0)
    let a: UInt64 = test.swap(1)

    let thread: Future<Unit> = spawn {
        if (a == 0) {
            test.swap(18446744073709551615)
        }
    }

    while (test.load() != 18446744073709551615) {
        sleep(Duration.Zero)
    }

    if (test.load() == 18446744073709551615) {
        print("in main\n")
    }
    return 0
}
