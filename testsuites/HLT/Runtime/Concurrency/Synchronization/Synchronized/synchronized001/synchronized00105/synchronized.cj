/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 3
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan in main, count = 10\n
// ASSERT: scan-not Exception

import std.sync.*
import std.runtime.*
import std.argopt.*
import std.process

var count: Int64 = 0

class Test {
    public var mtx: ReentrantMutex
    public init() {
        this.mtx = ReentrantMutex()
    }

    public func testfunc(): Unit {
        synchronized(mtx) {
            count = count + 1
        }
    }
}

main(): Int64 {
    var i: Int64 = 0
    let test: Test = Test()
    while (i < 10) {
        i = i + 1
        spawn {
            test.testfunc()
        }
    }
    while (count < 10) {
        sleep(Duration.Zero)
    }
    print("in main, count = ${count}\n")
    let ao = ArgOpt(process.Process.current.arguments, "", ["asan"])
    let map = ao.getArgumentsMap()
    if (map.contains("--asan")) {
        GC()
        sleep(Duration.second * 2)
    }
    return 0
}
