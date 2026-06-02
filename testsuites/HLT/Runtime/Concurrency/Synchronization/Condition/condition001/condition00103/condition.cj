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
// ASSERT: scan IllegalArgumentException: Timeout cannot be less than or equal to `Duration.Zero`.

import std.sync.*

var count: Int64 = 0
var flag: Int64 = 0

main(): Int64 {
    let m: Monitor = Monitor()
    m.lock()
    spawn {
        m.lock()
        print("in thread\n")
        flag = flag + 1
        m.wait(timeout: Duration.Zero)
        count = count + 1
        m.unlock()
    }
    spawn {
        m.lock()
        print("in thread\n")
        flag = flag + 1
        m.wait(timeout: Duration.Zero)
        count = count + 1
        m.unlock()
    }
    sleep(Duration.millisecond * 1)
    print("in main\n")
    m.unlock()

    while (flag == 0) {
        sleep(Duration.Zero)
    }

    if (m.tryLock()) {
        print("in main, count = ${count}\n")
    }
    return 0
}
