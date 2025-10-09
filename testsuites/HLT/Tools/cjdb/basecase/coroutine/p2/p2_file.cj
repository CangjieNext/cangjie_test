/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package p2
import std.sync.*
var count: Int64 = 0
let mtx = ReentrantMutex()

public func son_thread2():Future<Unit>{
    
    let fut = spawn {
        print("son thread: I am reading sheep 0\n")
        print("before sleep.\n")
        sleep(Duration.millisecond * 10) // sleep for 1ms.
        print("after sleep.\n")
        print("son thread: I am reading sheep 1\n")
        mtx.lock()
        print("locked.\n")
        count++
        mtx.unlock() 
        print("unlocked.\n") 
    }

    return fut

}
