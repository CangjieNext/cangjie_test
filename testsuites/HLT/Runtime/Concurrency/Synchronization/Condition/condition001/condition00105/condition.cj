/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 3
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

import std.sync.*
import std.runtime.*
import std.argopt.*
import std.process

var count: Int64 = 0
var flag: Int64 = 0

main(): Int64 {
    let m: Monitor = Monitor()
    m.lock()
    spawn {
        m.lock()
        flag = flag + 1
        m.wait()
        count = count + 1
        m.unlock()
    }
    spawn {
        m.lock()
        flag = flag + 1
        m.wait()
        count = count + 1
        m.unlock()
    }
    sleep(Duration.millisecond * 1)
    m.unlock()
    while (flag < 2) {
        sleep(Duration.Zero)
    }
    m.lock()
    m.notifyAll()
    m.unlock()
    while (count < 2) {
        sleep(Duration.Zero)
    }
    while (!m.tryLock()) {
        sleep(Duration.Zero)
    }

    if (count != 2) {
        return 1
    }

    let ao = ArgOpt(process.Process.current.arguments, "", ["asan"])
    let map = ao.getArgumentsMap()
    if (map.contains("--asan")) {
        GC()
        sleep(Duration.second * 2)
    }
    return 0
}
