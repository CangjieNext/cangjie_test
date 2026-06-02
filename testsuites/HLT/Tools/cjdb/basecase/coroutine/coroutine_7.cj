/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import p2.*
import std.sync.*
let m = Monitor()
/* 查看跨包子协程 ready running pending 状态*/
main(): Int64 {
    m.lock()
    var fut = son_thread2()
    print("main thread: I am reading sheep 0\n")
    print("main thread: I am reading sheep 1\n")
    print("main thread: I am reading sheep 2\n")
    m.unlock()
    fut.get()
    return 0

}
