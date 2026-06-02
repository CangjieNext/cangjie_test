/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// ERRCHECK: %compiler %cmp_opt %f -o %output

import std.sync.SyncCounter

func testException(thread: Thread, exception: Exception): Unit {
    println("func exception handler")
}

main(): Int64 {
    Thread.handleUncaughtExceptionBy {
        thread: Thread, exception: Exception => println("first exception handler")
    }
    let fut1 = spawn {
        throw Exception("a base exception")
    }
    try {
        fut1.get()
    } catch (_: Exception) {
        println("fut1.get()")
    }
    fut1.thread.handleUncaughtExceptionBy(testException)
    return 0
}
// ASSERT: scan sema_object_cannot_access_static_member
