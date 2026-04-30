/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import std.sync.*
let mtx = ReentrantMutex()
var count: Int64 = 0
let m = Monitor()

main(): Int64 {
    m.lock()
    let fut = spawn {
        print("son thread: I am reading sheep 0\n")
        print("before sleep.\n")
        let n = 10
        let r1 = "ddd"
        sleep(Duration.millisecond * 10)
        print("after sleep.\n")
        print("son thread: I am reading sheep 1\n")
        mtx.lock()
        print("locked.\n")
        count++
        mtx.unlock() 
        print("unlocked.\n")
    }
    let n = 10
    let r1 = 0..10 : 1
    print("main thread: I am reading sheep 0\n")
    print("main thread: I am reading sheep 1\n")
    print("main thread: I am reading sheep 2\n")
    print("main thread: I am reading sheep 3\n")
    print("main thread: I am reading sheep 4\n")
    m.unlock()
    fut.get()

    return 0
}
