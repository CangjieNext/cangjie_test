/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// DEPENDENCE: ./../../../../API/asan
// EXEC: %compiler %cmp_opt %compile_lib_opt asan/asanGC.cj -o asan.%middle
// EXEC: %compiler %cmp_opt %f asan.%middle -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan before_getResult!first sync!
// ASSERT: scan after_getResult!lock!

import std.sync.*
import asan.*

let mtx: ReentrantMutex = ReentrantMutex()

main(): Int64 {
    let beforeGetResult = AtomicBool(false)
    let f = spawn {
        synchronized(mtx) {
            while (beforeGetResult.load() == false) {}
            print("first sync!")
            throw Exception()
            print("after throw!")
        }
    }
    print("before_getResult!")
    beforeGetResult.store(true)
    try {
        f.get()
        print("Success!")
    } catch (e: Exception) {
        e.printStackTrace()
    }
    print("after_getResult!")
    mtx.lock()
    print("lock!")

    asanGC()
    return 0
}
