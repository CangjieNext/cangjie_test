/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// EXEC: %compiler %cmp_opt %f -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

internal import std.sync.Monitor

main(): Int64 {
    let m = Monitor()

    let fut: Future<Unit> = spawn {
        m.lock()
        m.lock() // #Hold: 2
        println("t1 to wait")
        m.wait()
        m.unlock()
        m.unlock()
    }
    sleep(Duration.second * 1) // Sleep 1s to ensure t1 has been waited

    let fut2 = spawn {
        m.lock() // #Hold: 1
        println("t2 to wait")
        m.wait()
        m.unlock()
    }

    sleep(Duration.second * 1) // Sleep 1s to ensure t2 has been waited
    m.lock()
    m.notifyAll()
    m.unlock()

    var result = 0
    try {
        fut.get()
        println("t1 ok")
    } catch (e: Exception) {
        println("${e}")
        result = 1
    }
    println("t1 end")
    fut2.get()
    println("t2 end")
    return result
}
