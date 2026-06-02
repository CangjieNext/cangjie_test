/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import std.sync.*
import std.collection.ArrayList

var count: Int64 = 0
let mtx = ReentrantMutex()

/* 协程最多显示数目查看 */
main(): Int64 {

    /*互斥锁*/
    var thread_list = ArrayList<Future<Unit>>()
    // 最多显示数量 
    var maxCoroutineNumber = 100

    // creat maxCoroutineNumber threads.
    for (i in 0..(maxCoroutineNumber-1)) {
        let fut = spawn {
            sleep(Duration.second) // sleep for 1ms.
            mtx.lock()
            count++
            mtx.unlock()
        }
        thread_list.add(fut)
    }

    print("${thread_list.size}\n")

    // Wait for all threads finished.
    for (f in thread_list) {
        f.get()
    }

    print("count = ${count}\n")

    return 0
}
