/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC:%compiler %cmp_opt  %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

import std.sync.*

main(): Int64 {
    let test = AtomicInt32(1)
    test.store(0)

    let thread: Future<Unit> = spawn {
        test.store(-2147483648)
    }

    while (test.load() != -2147483648) {
        sleep(Duration.Zero)
    }

    test.store(2147483647)

    if (test.load() == -2147483648) {
        return 1
    }
    return 0
}
