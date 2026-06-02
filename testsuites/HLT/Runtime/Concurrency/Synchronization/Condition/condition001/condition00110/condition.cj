/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt  %f -o %output
// (not Windows) RUN-EXEC-PIPE: %run %run_opt %output %run_args 2>&1 | compare %f
// (Windows) RUN-EXEC-PIPE: %run %run_opt %output %run_args 2>&1 1>log.txt && bash -c "dos2unix log.txt" && bash -c "cat log.txt" | compare %f
// ASSERT: scan in main\nin thread\nin thread\nin main, count = 1\n
// ASSERT: scan-not Exception

import std.sync.*

var count: Int64 = 0
var m: Monitor = Monitor()
var flag: Int64 = 0

main(): Int64 {
    m.lock()
    spawn {
        m.lock()
        print("in thread\n")
        flag += 1
        m.wait()
        count = count + 1
        m.unlock()
    }
    spawn {
        m.lock()
        print("in thread\n")
        flag += 1
        m.wait()
        count = count + 1
        m.unlock()
    }
    sleep(Duration.millisecond * 1)
    print("in main\n")
    m.unlock()
    while (flag != 2) {
        sleep(Duration.Zero)
    }
    m.lock()
    m.notify()
    m.unlock()
    while (count < 1) {
        sleep(Duration.Zero)
    }
    while (!m.tryLock()) {
        sleep(Duration.Zero)
    }
    print("in main, count = ${count}\n")
    return 0
}
