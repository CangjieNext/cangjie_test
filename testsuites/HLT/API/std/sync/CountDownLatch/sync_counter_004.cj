/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

import std.sync.*

main(): Int64 {
    let sc: SyncCounter = SyncCounter(2)
    if (sc.count != 2) {
        return 1
    }
    let thread1 = spawn {
        sc.waitUntilZero()
    }
    let thread2 = spawn {
        while (sc.count != 0) {
            sc.dec()
        }
    }
    thread2.get()
    thread1.get()
    if (sc.count != 0) {
        return 2
    }
    return 0
}
