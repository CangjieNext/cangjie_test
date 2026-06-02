/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import std.sync.*
var count: Int64 = 0
let m = Monitor()

func son_thread():Future<Unit>{
    let fut = spawn {
        print("son thread: I am reading sheep 0\n")
        print("before sleep.\n")
        sleep(Duration.millisecond * 10) // sleep for 1ms.
        print("after sleep.\n")
        print("son thread: I am reading sheep 1\n")
        m.lock()
        print("locked.\n")
        count++
        m.unlock()
        print("unlocked.\n") 
    }
    return fut
}
main(): Int64 {
    m.lock() //Lock the monitor to avoid finishing the son thread before the breakpoints
    var fut = son_thread()
    print("main thread: I am reading sheep 0\n")
    print("main thread: I am reading sheep 1\n")
    print("main thread: I am reading sheep 2\n")
    print("main thread: I am reading sheep 3\n")
    m.unlock()
    fut.get()
    return 0
}
