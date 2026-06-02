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
// ASSERT: scan thread end sleep\nin main\ncount = 2\n
// ASSERT: scan-not Exception

import std.sync.*
import std.runtime.*
import std.argopt.*
import std.process

var count: Int64 = 0

main(): Int64 {
    let mtx: ReentrantMutex = ReentrantMutex()
    spawn {
        mtx.lock()
        count = count + 1
        sleep(Duration.millisecond * 1)
        print("thread end sleep\n")
        count = count + 1
        mtx.unlock()
    }
    while (count < 2) {
        sleep(Duration.Zero)
    }
    print("in main\n")
    mtx.lock()
    print("count = ${count}\n")
    mtx.unlock()
    let ao = ArgOpt(process.Process.current.arguments, "", ["asan"])
    let map = ao.getArgumentsMap()
    if (map.contains("--asan")) {
        GC()
        sleep(Duration.second * 2)
    }
    return 0
}
