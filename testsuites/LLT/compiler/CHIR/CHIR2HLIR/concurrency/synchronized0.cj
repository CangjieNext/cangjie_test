// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC:%compiler %enableCompileDebug %sync-link %verbose_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix %run_args | compare %f
// ASSERT: scan before_getResult!
// ASSERT: scan first sync!
// ASSERT: scan after_getResult!
// ASSERT: scan lock!
// ASSERT: scan-not after throw!
internal import std.sync.*

let mtx: ReentrantMutex = ReentrantMutex()

main(): Int64 {
    let f = spawn {
        synchronized(mtx) {
            print("first sync!")
            throw Exception()
            print("after throw!")
        }
    }
    print("before_getResult!")
    try {
        f.get()
        print("Success!")
    } catch (e: Exception) {
        e.printStackTrace()
    }
    print("after_getResult!")
    mtx.lock()
    print("lock!")
    return 0
}
