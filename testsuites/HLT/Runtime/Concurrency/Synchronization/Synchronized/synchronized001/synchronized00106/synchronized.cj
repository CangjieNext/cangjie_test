/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// DEPENDENCE: ./../../../../../../API/asan
// EXEC: %compiler %cmp_opt %compile_lib_opt asan/asanGC.cj -o asan.%middle
// EXEC: %compiler %cmp_opt  %f asan.%middle -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan in main, count = 10\n
// ASSERT: scan-not Exception

import std.sync.*
import asan.*

var count: Int64 = 0

class Test {
    public static var mtx :Option<ReentrantMutex>= Option<ReentrantMutex>.Some(ReentrantMutex())

    public static func testfunc(): Unit {
        synchronized(mtx.getOrThrow()) {
            count = count + 1
        }
    }
}

main(): Int64 {
    var i: Int64 = 0
    while (i < 10) {
        i = i + 1
        spawn {
            Test.testfunc()
        }
    }
    while (count < 10) {
        sleep(Duration.Zero)
    }
    print("in main, count = ${count}\n")
    Test.mtx = None
    asanGC()
    return 0
}
