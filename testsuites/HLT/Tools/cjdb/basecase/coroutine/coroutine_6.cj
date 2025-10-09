/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import p1.*
import std.sync.*

/* 查看跨包子协程 ready running pending 状态*/
main(): Int64 {
    var (fut,m) = son_thread()

    sleep(Duration.second)
    m.lock()
    m.notifyAll()
    m.unlock()
    // Wait for all threads finished.
    fut.get()
    
    return 0
}
