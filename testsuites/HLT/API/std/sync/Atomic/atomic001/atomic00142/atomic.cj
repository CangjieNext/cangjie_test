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
    let test = AtomicUInt8(0)
    test.store(0)

    let thread: Future<Unit> = spawn {
        test.store(255)
    }

    while (test.load() != 255) {
        sleep(Duration.Zero)
    }

    test.store(128)

    if (test.load() == 255) {
        return 1
    }
    return 0
}
