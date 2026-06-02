/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt  %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan in thread\nin main, count = 1\n
// ASSERT: scan-not Exception

import std.sync.*

var count: Int64 = 0
var flag: Int64 = 0

main(): Int64 {
    let mtx: ReentrantMutex = ReentrantMutex()
    var i: Int64 = 0
    while (i < 100) {
        i = i + 1
        spawn {
            synchronized(mtx) {
                count = count + 1
                print("in thread\n")
                flag++
                while (true) {}
            }
        }
    }
    while (flag == 0) {
        sleep(Duration.millisecond * 1)
    }
    print("in main, count = ${count}\n")
    return 0
}
