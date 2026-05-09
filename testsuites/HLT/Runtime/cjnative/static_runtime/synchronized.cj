/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC-PIPE: %compiler %compilation_options %extra_options %sanitizer_options %mock_options %optimization_options %debug_options --static %f -o %output 2>&1 | compare %f
// ASSERT: scan xxx

import std.sync.*

var count: Int64 = 0
var mtx: ReentrantMutex = ReentrantMutex()

func test(): Unit {
    synchronized(mtx) { 
        count = count + 1
    }
}

main(): Int64 {
    var i: Int64 = 0
    while (i < 10) {
        i = i + 1
        spawn {
            test()
        }
    }
    while (count < 10) {
        sleep(Duration.Zero)
    }
    print("in main, count = ${count}\n")
    return 0
}
