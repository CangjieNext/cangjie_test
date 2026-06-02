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
// EXEC: %compiler %cmp_opt %overflow_wrapping %f asan.%middle -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT:scan finish

import std.sync.*
import std.runtime.*
import std.argopt.*
import std.process
import asan.*

var count: Int64 = 0

main(): Int64 {
    var i: Int64 = 0
    var mtx: ReentrantMutex = ReentrantMutex()
    try {
        synchronized(mtx) {
            count = count + 1
        }
    } catch (_) {}

    print("finish\n")
    asanGC()
    return 0
}
