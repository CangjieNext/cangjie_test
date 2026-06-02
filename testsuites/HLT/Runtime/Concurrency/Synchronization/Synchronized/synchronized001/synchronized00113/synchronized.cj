/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: ./../../../../../../API/asan
// EXEC: %compiler %cmp_opt %compile_lib_opt asan/asanGC.cj -o asan.%middle
// EXEC: %compiler %cmp_opt  %f asan.%middle -o %output
// (not Windows) RUN-EXEC-PIPE: %run %run_opt %output %run_args 2>&1 | compare %f
// (Windows) RUN-EXEC-PIPE: %run %run_opt %output %run_args 2>&1 1>log.txt && bash -c "dos2unix log.txt" && bash -c "cat log.txt" | compare %f
// ASSERT: scan in main, count = 0\nin main, count = 10\n
// ASSERT: scan-not Exception

import std.sync.*
import asan.*

var toWait: Int64 = 0
var count: Int64 = 0
let m: Monitor = Monitor()

main(): Int64 {
    var i: Int64 = 0
    while (i < 10) {
        i = i + 1
        spawn {
            synchronized(m) {
                toWait = toWait + 1
                m.wait()
                count = count + 1
            }
        }
    }
    while (toWait < 10) {
        sleep(Duration.Zero)
    }
    print("in main, count = ${count}\n")
    m.lock()
    m.notifyAll()
    m.unlock()
    while (count < 10) {
        sleep(Duration.Zero)
    }
    print("in main, count = ${count}\n")
    asanGC()
    return 0
}
