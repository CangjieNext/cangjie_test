/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args | compare %f
// ASSERT: scan first exception handler
// ASSERT: scan func exception handler
// ASSERT: scan-not second exception handler
// (not iOS) ASSERT: scan third exception handler

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
    Thread.handleUncaughtExceptionBy(testException)

    let fut2 = spawn {
        throw Exception("a base exception")
    }
    try {
        fut2.get()
    } catch (_: Exception) {
        println("fut2.get()")
    }
    let fut3 = spawn {
        Thread.handleUncaughtExceptionBy {
            thread: Thread, exception: Exception => println("second exception handler")
        }
    }.get()
    let fut4 = spawn {
        try {
            throw Exception("a base exception")
        } catch (_: Exception) {
            println("fut4 = spawn")
        }
    }
    let fut5 = spawn {
        Thread.handleUncaughtExceptionBy {
            thread: Thread, exception: Exception => println("third exception handler")
        }
    }.get()
    throw Exception("a base exception")
    return 0
}
