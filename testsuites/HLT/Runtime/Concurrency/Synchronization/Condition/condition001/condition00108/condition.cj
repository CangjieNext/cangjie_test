/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 3
// EXEC: %compiler %cmp_opt %f -o %output
// (not Windows) RUN-EXEC-PIPE: %run %run_opt %output %run_args 2>&1 | compare %f
// (Windows) RUN-EXEC-PIPE: %run %run_opt %output %run_args 2>&1 1>log.txt && bash -c "dos2unix log.txt" && bash -c "cat log.txt" | compare %f
// ASSERT: scan in main\nin thread\nin main, count = 1\n
// ASSERT: scan-not Exception

import std.sync.*
import std.runtime.*
import std.argopt.*
import std.process

var count: Int64 = 0
var globalFlag = 0

main(): Int64 {
    let m: Monitor = Monitor()
    m.lock()
    spawn {
        m.lock()
        m.lock()
        print("in thread\n")
        while (globalFlag == 0) {
            m.wait()
        }
        count = count + 1
        m.unlock()
        globalFlag = 2
    }
    sleep(Duration.millisecond * 1)
    print("in main\n")
    m.unlock()
    sleep(Duration.millisecond * 10)
    m.lock()
    globalFlag = 1
    m.unlock()
    m.lock()
    m.notify()
    m.unlock()
    while (count < 1) {
        sleep(Duration.Zero)
    }
    while (globalFlag != 2) {
        sleep(Duration.Zero)
    }
    if (!m.tryLock()) {
        print("in main, count = ${count}\n")
    }
    let ao = ArgOpt(process.Process.current.arguments, "", ["asan"])
    let map = ao.getArgumentsMap()
    if (map.contains("--asan")) {
        GC()
        sleep(Duration.second * 2)
    }
    return 0
}
