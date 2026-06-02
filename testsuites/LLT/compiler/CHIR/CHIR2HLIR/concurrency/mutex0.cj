// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC:%compiler %enableCompileDebug %sync-link %verbose_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix %run_args | compare %f
// ASSERT: scan 10\n
internal import std.sync.*

var count: Int64 = 0

func testMutex(): Int64 {
    let mtx = ReentrantMutex()
    var i: Int64 = 0
    while (i < 10) {
        i = i + 1
        spawn {
            =>
            mtx.lock()
            count = count + 1
            mtx.unlock()
        }
    }
    sleep(Duration.second)
    print(count.toString() + "\n")
    if (count != 10) {
        return 1
    }
    return 0
}

main(): Int64 {
    if (testMutex() != 0) {
        return 1
    }
    return 0
}
